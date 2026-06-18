import 'package:dartz/dartz.dart';
import 'package:lingobreeze/core/error/failure.dart';
import 'package:lingobreeze/core/usecases/usecase.dart';
import 'package:lingobreeze/features/vocabulary/domain/entities/word.dart';
import 'package:lingobreeze/features/vocabulary/domain/repositories/vocabulary_repository.dart';

class GetWords implements UseCase<List<Word>, NoParams> {
  final VocabularyRepository repository;

  GetWords(this.repository);

  @override
  Future<Either<Failure, List<Word>>> call(NoParams params) async {
    return await repository.getWords();
  }
}
