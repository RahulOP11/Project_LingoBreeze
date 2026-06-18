import 'package:dartz/dartz.dart';
import 'package:lingobreeze/core/error/failure.dart';
import 'package:lingobreeze/core/usecases/usecase.dart';
import 'package:lingobreeze/features/vocabulary/domain/entities/word.dart';
import 'package:lingobreeze/features/vocabulary/domain/repositories/vocabulary_repository.dart';

class SaveWord implements UseCase<void, Word> {
  final VocabularyRepository repository;

  SaveWord(this.repository);

  @override
  Future<Either<Failure, void>> call(Word params) async {
    return await repository.saveWord(params);
  }
}
