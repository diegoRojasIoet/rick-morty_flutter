import 'package:flutter/material.dart';
import 'package:pokemon_app/provider/character_provider.dart';
import 'package:pokemon_app/provider/pokemon_provider.dart';
import 'package:pokemon_app/views/character_list_view.dart';
import 'package:pokemon_app/views/views.dart';
import 'package:provider/provider.dart';
// import 'package:pokemon_app/views/counter_view.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PokemonProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => CharacterProvider(),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      // initialRoute: "/splashScreen",
      initialRoute: "/home",
      routes: {
        "/splashScreen": (context) => const SplashScreen(),
        // "/home": (context) => const PokemonListView(),
        "/home": (context) => const CharacterListView(),
        "/details": (context) => const PokemonDetails(),
      },
    );
  }
}
