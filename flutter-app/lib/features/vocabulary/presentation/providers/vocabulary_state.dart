import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lingobreeze/features/vocabulary/domain/entities/word.dart';

part 'vocabulary_state.freezed.dart';

@freezed
abstract class VocabularyState with _$VocabularyState {
  const factory VocabularyState.initial() = _Initial;
  const factory VocabularyState.loading() = _Loading;
  const factory VocabularyState.data({
    required List<Word> words,
    required List<Word> savedWords,
  }) = _Data;
  const factory VocabularyState.error(String message) = _Error;
}
