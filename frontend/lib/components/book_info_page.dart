import 'package:flutter/material.dart';
import 'package:frontend/pages/explore_page.dart';

class BookInfoPage extends StatelessWidget {
  const BookInfoPage({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Align(
              alignment: Alignment(-0.9, 0),
              child: BackButton(
                color: Colors.black,
              )
            ),

            // book cover
            Center(
              child: Image.asset(
                book.imagePath,
                width: 200,
                height: 300,
              )
            ),

            const SizedBox(
              height: 5
            ),

            // title
            Text(
              book.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30
              ),
            ),

            const SizedBox(height: 10),

            // description
            const Text(
              'Description: Idly indulging in baseless paranormal activities with the Occult Club, high schooler Yuuji Itadori spends his days at either the clubroom or the hospital, where he visits his bedridden grandfather. However, this leisurely lifestyle soon takes a turn for the strange when he unknowingly encounters a cursed item. Triggering a chain of supernatural occurrences, Yuuji finds himself suddenly thrust into the world of Curses—dreadful beings formed from human malice and negativity—after swallowing the said item, revealed to be a finger belonging to the demon Sukuna Ryoumen, the "King of Curses.\n\nYuuji experiences first-hand the threat these Curses pose to society as he discovers his own newfound powers. Introduced to the Tokyo Metropolitan Jujutsu Technical High School, he begins to walk down a path from which he cannot return—the path of a Jujutsu sorcerer.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ],
        ),
      )
    );
  }
}