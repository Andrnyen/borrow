import 'package:flutter/material.dart';
import 'package:frontend/pages/auth.dart';
import 'package:frontend/pages/explore_page.dart';
import 'package:frontend/pages/login_page.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTree();
}

class _WidgetTree extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges, 
      builder: (context, snapshot) {
        return snapshot.hasData ? const ExplorePage() : const LoginPage();
      }
    );
  }
}