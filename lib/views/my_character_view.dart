import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/view_model/my_characters_view_model.dart';
import 'package:rick_and_morty_app/widgets/my_characters_view_body.dart';

class MyCharactersView extends StatefulWidget {
  const MyCharactersView({super.key});

  @override
  State<MyCharactersView> createState() => _MyCharactersViewState();
}

class _MyCharactersViewState extends State<MyCharactersView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Characters'),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => MyCharactersViewModel(),
          ),
        ],
        child: const MyCharactersViewBody()
      ),
    );
  }
}