import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingobreeze/core/usecases/usecase.dart';
import 'package:lingobreeze/features/vocabulary/domain/entities/word.dart';
import 'package:lingobreeze/features/vocabulary/domain/usecases/get_saved_words.dart';
import 'package:lingobreeze/features/vocabulary/domain/usecases/get_words.dart';
import 'package:lingobreeze/features/vocabulary/domain/usecases/save_word.dart';
import 'package:lingobreeze/features/vocabulary/presentation/providers/vocabulary_state.dart';

class VocabularyNotifier extends StateNotifier<VocabularyState> {
  final GetWords _getWords;
  final GetSavedWords _getSavedWords;
  final SaveWord _saveWord;
  StreamSubscription? _savedWordsSubscription;

  VocabularyNotifier(this._getWords, this._getSavedWords, this._saveWord)
      : super(const VocabularyState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = const VocabularyState.loading();
    
    final wordsEither = await _getWords(NoParams());
    
    wordsEither.fold(
      (failure) {
        state = const VocabularyState.error('Failed to fetch words');
      },
      (words) {
        _savedWordsSubscription?.cancel();
        final savedWordsEither = _getSavedWords(NoParams());

        savedWordsEither.then((either) {
          either.fold(
            (failure) {
              state = const VocabularyState.error('Failed to get saved words');
            },
            (stream) {
              _savedWordsSubscription = stream.listen((savedWords) {
                state = VocabularyState.data(
                  words: words,
                  savedWords: savedWords,
                );
              });
            },
          );
        });
      },
    );
  }

  Future<void> saveWord(Word word) async {
    final result = await _saveWord(word);
    result.fold(
      (failure) => state = const VocabularyState.error('Failed to save word'),
      (_) {}, // Handled by stream
    );
  }

  @override
  void dispose() {
    _savedWordsSubscription?.cancel();
    super.dispose();
  }
}
