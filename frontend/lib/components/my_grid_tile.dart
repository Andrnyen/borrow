import 'package:flutter/material.dart';
import 'package:frontend/extensions/string_extension.dart';
import 'package:frontend/pages/explore_page.dart';

class MyGridTile extends StatelessWidget {
  const MyGridTile({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridTile(
          child: Image.asset(
            book.imagePath,
            height: 180,
            width: 130,
          ),
        ),
        Center(
          child: Text(
            book.title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black),
          )
        ),
      ]
    );
  }
}