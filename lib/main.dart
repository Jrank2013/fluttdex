import 'package:dio/dio.dart';
import 'package:fluttdex/pages/home_page.dart';
import 'package:fluttdex/services/pokeapi_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: key,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider(
        create: (BuildContext context) {
          PokeApiService(Dio());
        },
        child: const HomePage(),
      ),
    );
  }
}
