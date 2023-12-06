import 'package:flutter/material.dart';
import 'package:frontend/pages/explore_page.dart';
import 'package:frontend/book_model.dart';

class BookInfoPage extends StatelessWidget {
  const BookInfoPage({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          book.title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: BackButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ExplorePage(),));
          },
          color: Colors.white,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 15,),
            // book cover
            Center(
              child: Image.network(
                book.thumb,
                width: 200,
                height: 300,
              )
            ),

            const SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  constraints: const BoxConstraints(
                    minHeight: 0.0,
                    maxHeight: 250.0,),
                  child: SingleChildScrollView(
                    child: Text(
                      book.summary,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
            ),
            
            const ExpansionTile(
              initiallyExpanded: true,
              trailing: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white
              ),
              title: Text(
                'Chapters',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              children: [
                
              ],
            ),
          ],
        ),
      )
    );
  }
}