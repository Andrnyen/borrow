import 'package:flutter/material.dart';
import 'package:frontend/components/extensions/string_extension.dart';

class MyGridTile extends StatelessWidget {
  const MyGridTile({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridTile(
          child: Image.asset(
            imagePath,
            height: 180,
            width: 130,
          ),
        ),
        Center(
          child: Text(
            imagePath.split('/').last
                     .split('.')[0]
                     .replaceAll('_', ' ')
                     .capitalizeByWord(),
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black),
          )
        ),
      ]
    );
  }
}