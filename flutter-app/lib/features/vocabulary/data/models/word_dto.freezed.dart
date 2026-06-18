
part of 'word_dto.dart';

// this is theFreezedGenerator

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WordDto _$WordDtoFromJson(Map<String, dynamic> json) {
  return _WordDto.fromJson(json);
}

/// @nodoc
mixin _$WordDto {
  String get word => throw _privateConstructorUsedError;
  String get meaning => throw _privateConstructorUsedError;
  String get translation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordDtoCopyWith<WordDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordDtoCopyWith<$Res> {
  factory $WordDtoCopyWith(WordDto value, $Res Function(WordDto) then) =
      _$WordDtoCopyWithImpl<$Res, WordDto>;
  @useResult
  $Res call({String word, String meaning, String translation});
}

/// @nodoc
class _$WordDtoCopyWithImpl<$Res, $Val extends WordDto>
    implements $WordDtoCopyWith<$Res> {
  _$WordDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? meaning = null,
    Object? translation = null,
  }) {
    return _then(_value.copyWith(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      meaning: null == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String,
      translation: null == translation
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WordDtoImplCopyWith<$Res> implements $WordDtoCopyWith<$Res> {
  factory _$$WordDtoImplCopyWith(
          _$WordDtoImpl value, $Res Function(_$WordDtoImpl) then) =
      __$$WordDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String word, String meaning, String translation});
}

/// @nodoc
class __$$WordDtoImplCopyWithImpl<$Res>
    extends _$WordDtoCopyWithImpl<$Res, _$WordDtoImpl>
    implements _$$WordDtoImplCopyWith<$Res> {
  __$$WordDtoImplCopyWithImpl(
      _$WordDtoImpl _value, $Res Function(_$WordDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? meaning = null,
    Object? translation = null,
  }) {
    return _then(_$WordDtoImpl(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      meaning: null == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String,
      translation: null == translation
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WordDtoImpl implements _WordDto {
  const _$WordDtoImpl(
      {required this.word, required this.meaning, required this.translation});

  factory _$WordDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordDtoImplFromJson(json);

  @override
  final String word;
  @override
  final String meaning;
  @override
  final String translation;

  @override
  String toString() {
    return 'WordDto(word: $word, meaning: $meaning, translation: $translation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordDtoImpl &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.meaning, meaning) || other.meaning == meaning) &&
            (identical(other.translation, translation) ||
                other.translation == translation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, word, meaning, translation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WordDtoImplCopyWith<_$WordDtoImpl> get copyWith =>
      __$$WordDtoImplCopyWithImpl<_$WordDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WordDtoImplToJson(
      this,
    );
  }
}

abstract class _WordDto implements WordDto {
  const factory _WordDto(
      {required final String word,
      required final String meaning,
      required final String translation}) = _$WordDtoImpl;

  factory _WordDto.fromJson(Map<String, dynamic> json) = _$WordDtoImpl.fromJson;

  @override
  String get word;
  @override
  String get meaning;
  @override
  String get translation;
  @override
  @JsonKey(ignore: true)
  _$$WordDtoImplCopyWith<_$WordDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
