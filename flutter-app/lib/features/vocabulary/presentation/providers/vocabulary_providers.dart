import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingobreeze/features/vocabulary/data/datasource/vocabulary_local_data_source.dart';
import 'package:lingobreeze/features/vocabulary/data/datasource/vocabulary_local_data_source_impl.dart';
import 'package:lingobreeze/features/vocabulary/data/datasource/vocabulary_remote_data_source.dart';
import 'package:lingobreeze/features/vocabulary/data/datasource/vocabulary_remote_data_source_impl.dart';
import 'package:lingobreeze/features/vocabulary/data/repository/vocabulary_repository_impl.dart';
import 'package:lingobreeze/features/vocabulary/domain/repositories/vocabulary_repository.dart';
import 'package:lingobreeze/features/vocabulary/domain/usecases/get_saved_words.dart';
import 'package:lingobreeze/features/vocabulary/domain/usecases/get_words.dart';
import 'package:lingobreeze/features/vocabulary/domain/usecases/save_word.dart';
import 'package:lingobreeze/features/vocabulary/presentation/providers/vocabulary_state.dart';
import 'package:lingobreeze/features/vocabulary/presentation/providers/vocabulary_notifier.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

final firestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final vocabularyRemoteDataSourceProvider =
    Provider<VocabularyRemoteDataSource>((ref) {
  return VocabularyRemoteDataSourceImpl(dio: ref.watch(dioProvider));
});

final vocabularyLocalDataSourceProvider =
    Provider<VocabularyLocalDataSource>((ref) {
  return VocabularyLocalDataSourceImpl(firestore: ref.watch(firestoreProvider));
});

final vocabularyRepositoryProvider = Provider<VocabularyRepository>((ref) {
  return VocabularyRepositoryImpl(
    remoteDataSource: ref.watch(vocabularyRemoteDataSourceProvider),
    localDataSource: ref.watch(vocabularyLocalDataSourceProvider),
  );
});

final getWordsProvider = Provider<GetWords>((ref) {
  return GetWords(ref.watch(vocabularyRepositoryProvider));
});

final getSavedWordsProvider = Provider<GetSavedWords>((ref) {
  return GetSavedWords(ref.watch(vocabularyRepositoryProvider));
});

final saveWordProvider = Provider<SaveWord>((ref) {
  return SaveWord(ref.watch(vocabularyRepositoryProvider));
});

final vocabularyNotifierProvider =
    StateNotifierProvider<VocabularyNotifier, VocabularyState>((ref) {
  return VocabularyNotifier(
    ref.watch(getWordsProvider),
    ref.watch(getSavedWordsProvider),
    ref.watch(saveWordProvider),
  );
});
