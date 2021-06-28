class Pokemon {
  final String name;
  final String image;

  const Pokemon(this.name, this.image);

  Pokemon.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        image = json["sprites"]["front_default"];
}
