// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:fluttdex/models/pokemon.dart';
import 'package:fluttdex/pages/home_page.dart';
import 'package:fluttdex/services/pokeapi_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'helpers.dart';
import 'home_page_test.mocks.dart';

@GenerateMocks([PokeApiService])
void main() {
  testWidgets('Test Home Screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    var mockPokeApiService = MockPokeApiService();
    var pokemonName = "bulbasaur";

    when(mockPokeApiService.pokemon(any))
        .thenAnswer((_) async => Pokemon(pokemonName, ""));

    await tester.pumpWidget(Provider<PokeApiService>(
      create: (_) => mockPokeApiService,
      child: createTestableWidget(const HomePage()),
    ));

    await tester.pumpAndSettle();

    expect(find.byType(GridView), findsOneWidget);
    expect(find.text(pokemonName), findsOneWidget);
  });
}
