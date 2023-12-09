import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frontend/components/widget_tree.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: WidgetTree()
    );
  }
}