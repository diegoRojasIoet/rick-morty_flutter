import 'package:flutter/material.dart';
import 'package:pokemon_app/provider/character_provider.dart';
import 'package:pokemon_app/widgets/character_card.dart';
import 'package:provider/provider.dart';

class CharacterListView extends StatefulWidget {
  const CharacterListView({super.key});

  @override
  State<CharacterListView> createState() => _CharacterListViewState();
}

class _CharacterListViewState extends State<CharacterListView> {
  @override
  Widget build(BuildContext context) {
    final characterProvider = Provider.of<CharacterProvider>(context);
    int characterIdCounter = characterProvider.characterId;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters List View'),
      ),
      body: (characterProvider.characters.isEmpty)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: characterProvider.characters.length,
              itemBuilder: (context, index) {
                return CharacterCard(
                  character: characterProvider.characters[index],
                );
              },
            ),
      floatingActionButton: CustomFloatingActionButton(
          icon: Icons.add,
          onPressed: () {
            characterProvider.addCharacter(characterIdCounter);
            characterProvider.characterIdCounter = characterIdCounter + 1;
            setState(() {});
          }),
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomFloatingActionButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      enableFeedback: true,
      elevation: 5,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}