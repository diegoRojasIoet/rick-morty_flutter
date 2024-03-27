import 'package:flutter/material.dart';

class MyCharacterButton extends StatelessWidget {
  final Function() onTap;

  const MyCharacterButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Center(
          child: Text(
            'My Characters',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}