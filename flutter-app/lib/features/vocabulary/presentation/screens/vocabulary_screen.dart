import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingobreeze/features/vocabulary/presentation/providers/vocabulary_providers.dart';
import 'package:lingobreeze/features/vocabulary/presentation/screens/add_word_screen.dart';
import 'package:lingobreeze/features/vocabulary/presentation/widgets/vocabulary_card_widget.dart';
import 'package:lingobreeze/shared/widgets/custom_empty_state_widget.dart';
import 'package:lingobreeze/shared/widgets/custom_error_widget.dart';
import 'package:lingobreeze/shared/widgets/loading_widget.dart';

class VocabularyScreen extends ConsumerWidget {
  const VocabularyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(vocabularyNotifierProvider);
    final notifier = ref.read(vocabularyNotifierProvider.notifier);

    return Scaffold(
     appBar: AppBar(
  backgroundColor: Color.fromARGB(255, 189, 223, 247),
  elevation: 2,
  toolbarHeight: 75,
  title: const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        'LingoBreeze Dictionary',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      Text(
        'Build your vocabulary daily!!',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black54,
        ),
      ),
    ],
  ),
),
      body: RefreshIndicator(
        onRefresh: () => notifier.fetchData(),
        child: state.when(
          initial: () => const LoadingWidget(),
          loading: () => const LoadingWidget(),
          data: (words, savedWords) {
            if (savedWords.isEmpty) {
              return CustomEmptyStateWidget(
                message: "You haven't saved any words yet.",
                buttonText: 'Add Your First Word',
                onButtonPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddWordScreen(),
                    ),
                  );
                },
              );
            }
            return ListView.builder(
              itemCount: savedWords.length,
              itemBuilder: (context, index) {
                final word = savedWords[index];
                return VocabularyCardWidget(word: word);
              },
            );
          },
          error: (message) => CustomErrorWidget(
            message: message,
            onRetry: () => notifier.fetchData(),
          ),
        ),
      ),
      floatingActionButton: state.maybeWhen(
        data: (words, savedWords) => FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AddWordScreen(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        orElse: () => null,
      ),
    );
  }
}
