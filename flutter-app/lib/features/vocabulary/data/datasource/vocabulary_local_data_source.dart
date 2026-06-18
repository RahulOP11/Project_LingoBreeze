import 'package:lingobreeze/features/vocabulary/data/models/word_dto.dart';

abstract class VocabularyLocalDataSource {
  Stream<List<WordDto>> getSavedWords();
  Future<void> saveWord(WordDto word);
}
