import 'package:dartz/dartz.dart';
import 'package:lingobreeze/core/error/failure.dart';
import 'package:lingobreeze/features/vocabulary/domain/entities/word.dart';

abstract class VocabularyRepository {
  Future<Either<Failure, List<Word>>> getWords();
  Stream<Either<Failure, List<Word>>> getSavedWords();
  Future<Either<Failure, void>> saveWord(Word word);
}
