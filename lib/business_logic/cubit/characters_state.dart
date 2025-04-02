part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {
  CharactersInitial();
}

final class CharactersLoaded extends CharactersState {
  final List<CharacterModel> charactersList;
  CharactersLoaded({required this.charactersList});
}

final class CharactersErrormessage extends CharactersState {
  final String errorMessage;
  CharactersErrormessage({required this.errorMessage});
}
