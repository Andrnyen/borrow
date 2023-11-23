import 'package:flutter/material.dart';
import 'package:frontend/components/my_button.dart';
import 'package:frontend/pages/explore_page.dart';

class BookInfoPage extends StatelessWidget {
  const BookInfoPage({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          book.title,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: BackButton(
          onPressed: () {},
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.add,
                color: Colors.black,
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
              child: Image.asset(
                book.imagePath,
                width: 200,
                height: 300,
              )
            ),

            const SizedBox(height: 10,),

            Expanded(
              child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(), 
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * .50,
                        padding: const EdgeInsets.all(10.0),
                        color: Colors.white,
                        child: Text(book.description),
                      )
                    ],
                  ),
                ),
            ),

            const SizedBox(height: 10,),

            const ExpansionTile(
              title: Text('Chapters'),
              children: [
                
              ],
            ),
          ],
        ),
      )
    );
  }
}