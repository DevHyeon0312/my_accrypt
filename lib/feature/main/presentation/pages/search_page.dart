import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchPage extends HookConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController(); // ✅ Hooks 사용

    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchBar(
              controller: searchController,
              leading: const Icon(Icons.search),
              padding: WidgetStateProperty.all(
                  const EdgeInsets.only(left:16,)
              ),
              hintText: 'Search...',
              trailing: [
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                  },
                ),
              ],
              onTap: () {
                print('Search: ${searchController.text}');
              },
              onChanged: (value) {
                print('Search: $value');
              },
              onTapOutside: (_) {
                print('Tap outside');
              },
              onSubmitted: (value) {
                print('Submitted: $value');
              },
            ),
            // TextField(
            //   controller: searchController,
            //   decoration: const InputDecoration(
            //     labelText: 'Search...',
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            Consumer(builder: (context, ref, child) {
              return Center(
                  child: Text('Debug Tools'),
                );
            }),
            HookConsumer(builder: (context, ref, child) {
              return Center(
                  child: Text('Debug Tools'),
                );
            }),
            const SizedBox(height: 20),
            const Center(
              child: Text('🔍 Search Page', style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }
}