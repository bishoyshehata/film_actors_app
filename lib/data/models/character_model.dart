class CharacterModel {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  String? image;
  CharacterLocationMoled? location;

  CharacterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    image = json['image'];
    location = CharacterLocationMoled.fromJson(json['location']);
  }
}

class CharacterLocationMoled {
  String? name;

  CharacterLocationMoled.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}
