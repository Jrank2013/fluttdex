import 'package:fluttdex/models/pokemon.dart';
import 'package:fluttdex/services/pokeapi_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PokeApiService apiService = Provider.of<PokeApiService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: 1,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) => FutureBuilder(
          future: apiService.pokemon(index + 1),
          builder: (_, AsyncSnapshot<Pokemon> snapshot) =>
              Text(snapshot.data?.name ?? "Error Fetching #$index"),
        ),
      ),
    );
  }
}
