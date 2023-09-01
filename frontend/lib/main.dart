import 'package:flutter/material.dart';
import 'package:frontend/components/book_info_page.dart';
import 'package:frontend/pages/explore_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Borrow';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      home: BookInfoPage(book: Book(
        id: '1',
        title: 'Jujutsu Kaisen',
        imagePath: '/Users/andrewnguyen/Development/borrow/frontend/lib/images/books/jujutsu_kaisen.jpeg',
      ),),
    );
  }
}