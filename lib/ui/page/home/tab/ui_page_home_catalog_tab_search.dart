import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
        title: const Text('検索'),
        automaticallyImplyLeading: false, // 戻るボタンを表示しない
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
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
              ),
            ),
          ),
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
    );
  }
}
