import 'package:dio/dio.dart';
import 'package:lingobreeze/core/config.dart';
import 'package:lingobreeze/features/vocabulary/data/datasource/vocabulary_remote_data_source.dart';
import 'package:lingobreeze/features/vocabulary/data/models/word_dto.dart';

class VocabularyRemoteDataSourceImpl implements VocabularyRemoteDataSource {
  final Dio dio;

  VocabularyRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<WordDto>> getWords() async {
    try {
      final response = await dio.get('${AppConfig.baseUrl}/words');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => WordDto.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load words');
      }
    } catch (e) {
      throw Exception('Failed to load words: $e');
    }
  }
}
