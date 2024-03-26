import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/view_model/my_characters_view_model.dart';
import 'package:rick_and_morty_app/widgets/character_card.dart';

class MyCharactersViewBody extends StatefulWidget {

  const MyCharactersViewBody({
    super.key
  });

  @override
  State<MyCharactersViewBody> createState() => _MyCharactersViewBodyState();
}

class _MyCharactersViewBodyState extends State<MyCharactersViewBody> {
  late MyCharactersViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<MyCharactersViewModel>(context);
    return viewModel.loadingCharactersCaptures
      ? const Center(
          child: CircularProgressIndicator(),
        )
      : SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: viewModel.charactersCaptures.length,
              itemBuilder: (context, index) {
                return CharacterCard(
                  character: viewModel.charactersCaptures[index].character,
                );
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      );
  }
}