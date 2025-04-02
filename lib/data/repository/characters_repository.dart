import 'package:film_actors_app/data/models/character_model.dart';
import 'package:film_actors_app/data/services/get_characters.dart';

class CharactersRepository {
  GetCharactersService getCharactersService;
  CharactersRepository({required this.getCharactersService});

  Future<List<CharacterModel>> getCharactersData() async {
    // return getCharactersService.getCharactersData();

    List<dynamic> jsonData = await getCharactersService
        .getCharactersData(); // API returns a list of maps
    List<CharacterModel> charactersList = jsonData
        .map((singleModle) => CharacterModel.fromJson(singleModle))
        .toList();
    return charactersList;
  }
}
