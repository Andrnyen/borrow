import 'package:flutter/material.dart';
import 'package:frontend/book.dart';

class MyGridTile extends StatelessWidget {
  const MyGridTile({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridTile(
          child: Image.network(
            book.thumb,
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