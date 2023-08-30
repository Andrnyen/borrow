import 'package:flutter/material.dart';
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
    return const MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      home: ExplorePage(),
    );
  }
}