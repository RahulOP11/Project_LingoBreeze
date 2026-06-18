import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingobreeze/features/vocabulary/data/datasource/vocabulary_local_data_source.dart';
import 'package:lingobreeze/features/vocabulary/data/models/word_dto.dart';

class VocabularyLocalDataSourceImpl implements VocabularyLocalDataSource {
  final FirebaseFirestore firestore;

  VocabularyLocalDataSourceImpl({required this.firestore});

  @override
  Stream<List<WordDto>> getSavedWords() {
    return firestore
        .collection('vocabulary')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return WordDto(
          word: data['word'],
          meaning: data['meaning'],
          translation: data['translation'],
        );
      }).toList();
    });
  }

  @override
  Future<void> saveWord(WordDto word) async {
    await firestore.collection('vocabulary').add({
      'word': word.word,
      'meaning': word.meaning,
      'translation': word.translation,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
