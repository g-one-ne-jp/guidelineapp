import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_storage/firebase_storage.dart';

@RoutePage()
class UiPageHomeCatalogTabSearch extends HookConsumerWidget {
  const UiPageHomeCatalogTabSearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _searchController = useTextEditingController();
    final _searchResults = useState<List<Map<String, dynamic>>>([]);

    Future<void> searchFirestore(String query) async {
      final firestore = FirebaseFirestore.instance;
      final storage = FirebaseStorage.instance;

      // Firestore クエリを作成してテキストファイルのパスを取得
      final snapshot = await firestore.collection('your_collection_name').get();
      final filePaths = snapshot.docs.map((doc) => doc['file_path']).toList();

      final results = <Map<String, dynamic>>[];

      // 各テキストファイルの内容を取得して検索ワードが含まれているかをチェック
      for (final path in filePaths) {
        final ref = storage.ref().child(path);
        final data = await ref.getData();
        final content = String.fromCharCodes(data!);

        if (content.contains(query)) {
          results.add({'path': path, 'content': content});
        }
      }

      _searchResults.value = results;
    }

    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
          ),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: '検索ワードを入力',
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  searchFirestore(_searchController.text);
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
                  color: Color(0xFFE8E8E8),
                ),
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: false, // 戻るボタンを表示しない
      ),
      body: Container(
        color: Colors.grey[400],
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.value.length,
                itemBuilder: (context, index) {
                  final result = _searchResults.value[index];
                  return ListTile(
                    title: Text(result['path'] ?? 'No Path'),
                    subtitle: Text(result['content'] ?? 'No Content'),
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
