import 'package:flutter/material.dart';
import 'package:frontend/book.dart';

class MyGridTile extends StatelessWidget {
  const MyGridTile({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          height: 190,
          width: 140,
          book.thumb,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) => 
            loadingProgress == null ? child : const Center(
              child: CircularProgressIndicator(color: Colors.orange)
          )
        ),
        

        Expanded( 
          child: Container(
            alignment: Alignment.center,
            color: Colors.grey[900],
            child: Text(
              book.title,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.left,
            )
          ) 
        )
      ]
    );
  }
}