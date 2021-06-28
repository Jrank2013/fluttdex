import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttdex/models/pokemon.dart';
import 'package:fluttdex/services/pokeapi_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:path/path.dart' as path;

void main() {
  Map<String, dynamic> bulbasaur = {};

  setUp(() {
    File pokemon_1 = File("${path.current}/test/unit/fixtures/pokemon_1.json");
    bulbasaur = jsonDecode(pokemon_1.readAsStringSync());
  });

  group("PokeApiService", () {
    test(".pokemon(1) fetches pokemon if not already present", () async {
      final dio = Dio();
      final dioAdapter = DioAdapter();
      dio.httpClientAdapter = dioAdapter;

      dioAdapter.onGet("/pokemon/1", (request) {
        request.reply(200, bulbasaur);
      });

      PokeApiService apiService = PokeApiService(dio);
      Pokemon pokemon = await apiService.pokemon(1);
      expect(pokemon.name, bulbasaur["name"]);
      expect(pokemon.image, bulbasaur["sprites"]["front_default"]);
    });
  });
}
