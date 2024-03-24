import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/model/character_model.dart';
import 'package:rick_and_morty_app/utils/file_system_utils.dart';
import 'package:rick_and_morty_app/utils/utils.dart';

class CharacterDetails extends StatelessWidget {
  const CharacterDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final character = ModalRoute.of(context)!.settings.arguments as Character;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Character Details'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _CharacterHeader(character: character),
              Text(
                capitalize(character.name),
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Status: ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                character.status,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Additional info: ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              buildAdditionalInfoRow(character.gender, 'gender'),
              const SizedBox(
                height: 20,
              ),
              buildAdditionalInfoRow(character.species, 'species'),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}

class _CharacterHeader extends StatelessWidget {
  const _CharacterHeader({
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
     return Container(
        color: Colors.green,
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Stack(
          children: [
            Center(
                child: Image(
              image: NetworkImage(character.image),
              fit: BoxFit.fill,
              height: 160,
              width: 180,
            )),
            Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: const Icon(Icons.camera_alt_rounded),
                  color: Colors.white,
                  iconSize: 50,
                  onPressed: () async {
                    final picker = ImagePicker();
                    final XFile? pickedFile = await picker.pickImage(
                      source: ImageSource.camera,
                    );
                    if (pickedFile == null) return;

                    Directory capturesDirectory =
                        await FileSystemUtils.createLocalDirectory(
                            'character_${character.id}');

                    String fileName = basename(pickedFile.path);

                    String destinationFile =
                        '${capturesDirectory.path}$fileName';

                    File sourceFile = File(pickedFile.path);
                    File destination = File(destinationFile);

                    await destination
                        .writeAsBytes(await sourceFile.readAsBytes());

                    print("Saved Image Path: $destinationFile");
                    print(
                        "Saved Image Size: ${await File(destinationFile).length()} bytes");
                  },
                ))
          ],
        ));
  }
}

Widget buildAdditionalInfoRow(String info, String infoTitle) {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
            Row(
              children: [
                Text(
                  capitalize(infoTitle),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              info,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
    ),
  );
}