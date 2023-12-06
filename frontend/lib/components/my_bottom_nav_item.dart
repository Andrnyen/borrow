import 'package:flutter/material.dart';

BottomNavigationBarItem myBottomNavItem(IconData icon, String title) {
  return BottomNavigationBarItem(
    icon: Icon(icon),
    label: title
  );
}