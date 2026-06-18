import 'package:lingobreeze/features/vocabulary/data/models/word_dto.dart';

abstract class VocabularyRemoteDataSource {
  Future<List<WordDto>> getWords();
}
