// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:film_actors_app/data/models/character_model.dart';
import 'package:film_actors_app/data/repository/characters_repository.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  late List<CharacterModel> characters = [];
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  Future<void> getCharacters() async {
    try {
      characters = await charactersRepository.getCharactersData();
      emit(CharactersLoaded(charactersList: characters));
    } catch (e) {
      emit(CharactersErrormessage(errorMessage: e.toString()));
    }
  }
}
