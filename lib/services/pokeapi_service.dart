import 'package:dio/dio.dart';
import 'package:fluttdex/models/pokemon.dart';

class PokeApiService {
  PokeApiService(this._client) {
    _client.options.baseUrl = "https://pokeapi.co/api/v2";
  }

  final Dio _client;
  final Map<int, Pokemon> _pokemon = {};

  Future<Pokemon> pokemon(int id) async {
    Pokemon? pokemon = _pokemon[id];

    if (pokemon != null) {
      return pokemon;
    } else {
      Response response = await _client.get("/pokemon/$id");
      pokemon = Pokemon.fromJson(response.data);
      _pokemon[id] = pokemon;
      return pokemon;
    }
  }
}
