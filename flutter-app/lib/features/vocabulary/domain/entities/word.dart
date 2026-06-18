import 'package:equatable/equatable.dart';

class Word extends Equatable {
  final String word;
  final String meaning;
  final String translation;

  const Word({
    required this.word,
    required this.meaning,
    required this.translation,
  });

  @override
  List<Object?> get props => [word, meaning, translation];
}
