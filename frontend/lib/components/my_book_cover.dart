import 'package:flutter/material.dart';
import 'package:frontend/book_model.dart';

class MyBookCover extends StatelessWidget {
  final Book book;

  const MyBookCover({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 285,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 250,
                    width: 180,
                    child: Image.network(
                      book.thumb,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Text( 
                    'Author(s): ${book.authors.join(', ')}',
                    style: const TextStyle(
                      color: Colors.white
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}