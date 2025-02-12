// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:JCSGuidelines/debug/debug_print.dart';
import 'package:JCSGuidelines/module/firebase/model_firebase_pdf_config.dart';
import 'package:JCSGuidelines/providers/user_provider.dart';
import 'package:JCSGuidelines/repotitory/mixin_repository_firestorage.dart';

@RoutePage()
class UiPageHomeCatalogTabSearch extends HookConsumerWidget with RepositoryFireStorage {
  const UiPageHomeCatalogTabSearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userProvider = ref.watch(userProvider);
    final _userNotifer = ref.watch(userProvider.notifier);

    final _searchController = useTextEditingController();
    final _searchResults = useState<List<Map<String, dynamic>>>([]);

    final _tos = useState(ModelFirebasePdfConfig());

    final _focusNode = useState(FocusNode());

    final _minorKey = useState('');
    final _minorKeys = useState(<String>[]);
    useEffect(() {
      Future<void>(() async {
        _tos.value = await _userNotifer.readTocsJson();
      });
      return () => customDebugPrint('dispose!');
    }, []);

    // 再帰関数でJSONデータを走査し、特定のキーの値を検索
    Future<void> searchJsonValue(dynamic jsonData, String text) async {
      //
      try {
        jsonData = jsonData.toJson();
      } catch (e) {
        //debugPrint('error: $e');
      }

      if (jsonData is Map) {
        for (var key in jsonData.keys) {
          debugPrint('key: $key,');
          if (jsonData.containsKey('minorKey')) {
            _minorKey.value = jsonData['minorKey'];
          }
          if (jsonData.containsKey('searchKeywords')) {
            List<dynamic> keywords = jsonData['searchKeywords'];
            if (keywords.any((keyword) => keyword.contains(text))) {
              if (!_searchResults.value.any((result) => result['title'] == jsonData['settionTitle'])) {
                _searchResults.value = [
                  ..._searchResults.value,
                  {
                    'key': _minorKey.value,
                    'title': jsonData['settionTitle'],
                  }
                ];
              }
            }
            if (jsonData.containsKey('markdown')) {
              if (jsonData['markdown'] != '') {
                final file = await downLoadData(path: jsonData['markdown']);
                final txt = file.readAsStringSync();

                if (txt.contains(text)) {
                  if (!_searchResults.value.any((result) => result['title'] == jsonData['settionTitle'])) {
                    _searchResults.value = [
                      ..._searchResults.value,
                      {
                        'key': _minorKey.value,
                        'title': jsonData['settionTitle'],
                      }
                    ];
                  }
                }
              }
            }
          }

          await searchJsonValue(jsonData[key], text);
        }
      } else if (jsonData is List) {
        for (var item in jsonData) {
          await searchJsonValue(item, text);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.transparent,
          ),
          child: Focus(
            focusNode: _focusNode.value,
            child: TextField(
              controller: _searchController,
              onSubmitted: (value) {
                _searchResults.value.clear();
                searchJsonValue(_tos.value.categories.values.toList()[0].toJson(), _searchController.text);
                FocusScope.of(context).unfocus();
                _focusNode.value.unfocus();
              },
              decoration: InputDecoration(
                hintText: '検索ワードを入力',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    _searchResults.value.clear();
                    if (_searchController.text.isNotEmpty) {
                      searchJsonValue(_tos.value.categories.values.toList()[0].toJson(), _searchController.text);
                    }
                    FocusScope.of(context).unfocus();
                    _focusNode.value.unfocus();
                  },
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 12.h,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.r),
                  borderSide: const BorderSide(
                    color: Color(0xFFE8E8E8),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.r),
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: false, // 戻るボタンを表示しない
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.value.length,
                itemBuilder: (context, index) {
                  final result = _searchResults.value[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      color: Colors.white,
                      child: ListTile(
                        trailing: const Icon(Icons.arrow_forward_ios),
                        title: Text(result['title'] ?? 'No Path'),
                        onTap: () async {
                          await context.router.pushNamed(
                            '/tabHomeMinor/${result['key']}/false',
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
