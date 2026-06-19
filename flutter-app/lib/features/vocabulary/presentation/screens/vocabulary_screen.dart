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
  backgroundColor: const Color.fromARGB(255, 189, 223, 247),
  elevation: 0,
  toolbarHeight: 80,
  title: Row(
    children: [
      CircleAvatar(
        radius: 21,
        backgroundImage: AssetImage('assets/images/lingobreeze_logo.png'),
        backgroundColor: Colors.transparent,
      ),
      const SizedBox(width: 12),
      const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'LingoBreeze',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Colors.black87,
              letterSpacing: 0.3,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Build your vocabulary daily',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.black45,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    ],
  ),
  actions: [
    Container(
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.5),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: const Icon(Icons.search_rounded, color: Colors.black87),
        onPressed: () {},
        tooltip: 'Search',
      ),
    ),
    Container(
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.5),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: const Icon(Icons.more_vert_rounded, color: Colors.black87),
        onPressed: () {},
        tooltip: 'More',
      ),
    ),
  ],
  bottom: PreferredSize(
    preferredSize: const Size.fromHeight(36),
    child: Container(
      color: const Color.fromARGB(255, 2, 27, 120).withValues(alpha: 0.4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
      alignment: Alignment.centerLeft,
      child: const Text(
        'VIEW ALL YOUR SAVED WORDS!!',
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: Colors.black54,
          letterSpacing: 1.4,
        ),
      ),
    ),
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
