import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/provider/character_provider.dart';
import 'package:rick_and_morty_app/widgets/character_card.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/widgets/my_character_button.dart';

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
         : SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: characterProvider.characters.length,
                    itemBuilder: (context, index) {
                      return CharacterCard(
                        character: characterProvider.characters[index],
                        // ignore: prefer_const_literals_to_create_immutables
                        captures: [],
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  MyCharacterButton(
                    onTap: () => Navigator.pushNamed(context, "/my-characters")
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          // : ListView.builder(
          //     itemCount: characterProvider.characters.length,
          //     itemBuilder: (context, index) {
          //       return CharacterCard(
          //         character: characterProvider.characters[index],
          //       );
          //     },
          //   ),
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