import 'package:dartz/dartz.dart';
import 'package:lingobreeze/core/error/failure.dart';
import 'package:lingobreeze/features/vocabulary/data/datasource/vocabulary_local_data_source.dart';
import 'package:lingobreeze/features/vocabulary/data/datasource/vocabulary_remote_data_source.dart';
import 'package:lingobreeze/features/vocabulary/data/models/word_dto.dart';
import 'package:lingobreeze/features/vocabulary/domain/entities/word.dart';
import 'package:lingobreeze/features/vocabulary/domain/repositories/vocabulary_repository.dart';

class VocabularyRepositoryImpl implements VocabularyRepository {
  final VocabularyRemoteDataSource remoteDataSource;
  final VocabularyLocalDataSource localDataSource;

  VocabularyRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Word>>> getWords() async {
    try {
      final remoteWords = await remoteDataSource.getWords();
      return Right(remoteWords
          .map((dto) => Word(
                word: dto.word,
                meaning: dto.meaning,
                translation: dto.translation,
              ))
          .toList());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Stream<Either<Failure, List<Word>>> getSavedWords() {
    try {
      return localDataSource.getSavedWords().map((dtos) {
        return Right(dtos
            .map((dto) => Word(
                  word: dto.word,
                  meaning: dto.meaning,
                  translation: dto.translation,
                ))
            .toList());
      });
    } catch (e) {
      return Stream.value(Left(CacheFailure()));
    }
  }

  @override
  Future<Either<Failure, void>> saveWord(Word word) async {
    try {
      final wordDto = WordDto(
        word: word.word,
        meaning: word.meaning,
        translation: word.translation,
      );
      await localDataSource.saveWord(wordDto);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
