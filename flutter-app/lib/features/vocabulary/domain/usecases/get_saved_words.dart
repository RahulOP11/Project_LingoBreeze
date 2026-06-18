import 'package:dartz/dartz.dart';
import 'package:lingobreeze/core/error/failure.dart';
import 'package:lingobreeze/core/usecases/usecase.dart';
import 'package:lingobreeze/features/vocabulary/domain/entities/word.dart';
import 'package:lingobreeze/features/vocabulary/domain/repositories/vocabulary_repository.dart';

class GetSavedWords implements UseCase<Stream<List<Word>>, NoParams> {
  final VocabularyRepository repository;

  GetSavedWords(this.repository);

  @override
  Future<Either<Failure, Stream<List<Word>>>> call(NoParams params) async {
    try {
      final stream = repository.getSavedWords();
      return Right(stream.map((either) => either.fold((l) => [], (r) => r)));
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
