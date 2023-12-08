import 'package:flutter/material.dart';
import 'package:frontend/models/book_model.dart';

class MyGridTile extends StatelessWidget {
  const MyGridTile({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: Image.network(
            book.thumb,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) => 
              loadingProgress == null ? child : const Center(
                child: CircularProgressIndicator(color: Colors.orange)
            )
          )
        ),
        

        Expanded( 
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              book.title,
              style: const TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              maxLines: 2,
            )
          ) 
        )
      ]
    );
  }
}