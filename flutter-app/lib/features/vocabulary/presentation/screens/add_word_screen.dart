import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingobreeze/features/vocabulary/presentation/providers/vocabulary_providers.dart';

import 'package:lingobreeze/shared/widgets/loading_widget.dart';

class AddWordScreen extends ConsumerWidget {
  const AddWordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(vocabularyNotifierProvider);
    final notifier = ref.read(vocabularyNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 189, 223, 247),
        elevation: 2,
        toolbarHeight: 75,
      centerTitle: true,
      title: const Text(
    'Explore Words To Add',
      style: TextStyle(
      fontWeight: FontWeight.bold,
           ),
         ),
       ),
      body: state.when(
        initial: () => const LoadingWidget(),
        loading: () => const LoadingWidget(),
        data: (words, savedWords) {
          if (words.isEmpty) {
            return const Center(
     child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Icon(Icons.menu_book, size: 80),
      SizedBox(height: 16),
      Text(
        'You haven\'t saved any words yet',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
            ),
           ),
         ],
       ),
     );
          }
          return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        'Recently Viewed Words!!',
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    Expanded(
      child: ListView.builder(
        itemCount: words.length,
        itemBuilder: (context, index) {
          final word = words[index];
          final isSaved = savedWords.any(
            (savedWord) => savedWord.word == word.word,
          );

          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            child: ListTile(
              title: Text(
                word.word,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(word.meaning),
              trailing: IconButton(
                icon: Icon(
                  isSaved
                      ? Icons.check_circle
                      : Icons.add_circle_outline,
                  color: isSaved ? Colors.green : Colors.blue,
                ),
                onPressed: isSaved
                    ? null
                    : () {
                        notifier.saveWord(word);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${word.word} saved!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
              ),
            ),
          );
        },
      ),
    ),
  ],
);
        },
        error: (message) => Center(child: Text(message)),
      ),
    );
  }
}
