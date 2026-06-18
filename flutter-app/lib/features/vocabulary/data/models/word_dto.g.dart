

part of 'word_dto.dart';



_$WordDtoImpl _$$WordDtoImplFromJson(Map<String, dynamic> json) =>
    _$WordDtoImpl(
      word: json['word'] as String,
      meaning: json['meaning'] as String,
      translation: json['translation'] as String,
    );

Map<String, dynamic> _$$WordDtoImplToJson(_$WordDtoImpl instance) =>
    <String, dynamic>{
      'word': instance.word,
      'meaning': instance.meaning,
      'translation': instance.translation,
    };
