import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_dto.freezed.dart';
part 'word_dto.g.dart';

@freezed
class WordDto with _$WordDto {
  const factory WordDto({
    required String word,
    required String meaning,
    required String translation,
  }) = _WordDto;

  factory WordDto.fromJson(Map<String, dynamic> json) =>
      _$WordDtoFromJson(json);
}
