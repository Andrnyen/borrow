import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend/components/my_grid_tile.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key, required this.title});

  final String title;

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final List<String> images = [
    'lib/images/facebook.png'
  ];
        
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 40,
            color: Colors.white
          ),  
        ),
        actions: [
          SearchAnchor(
            builder: (BuildContext context, SearchController controller) {
              return IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  controller.openView();
                },
              );
            }, 
            suggestionsBuilder: (BuildContext context, SearchController controller) {
              return List<ListTile>.generate(5, (int index) {
                final String item = 'item $index';
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                    });
                  },
                );
              });
            }
          ),
        ]
      ),
      drawer:  
        Drawer(
          width: 390,
          child: Expanded(child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent
                ),
                accountName: Text('Username'), 
                accountEmail: Text('user@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('lib/images/drake.png'),
                ),
              ),

              ListTile(
                leading: const Icon(Icons.library_books),
                title: const Text('Library'),
                onTap: () {},
              ),

              ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text('Notifications'),
                onTap: () {},
              ),

              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {},
              ),

              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Sign out'),
                onTap: () {},
              )
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 0.6,
          crossAxisSpacing: 10,
          mainAxisSpacing: 5,
          children: const [
            MyGridTile(imagePath: '/Users/andrewnguyen/Development/borrow/frontend/lib/images/books/chainsaw_man.jpeg'),
            MyGridTile(imagePath: '/Users/andrewnguyen/Development/borrow/frontend/lib/images/books/jujutsu_kaisen.jpeg'),
            MyGridTile(imagePath: '/Users/andrewnguyen/Development/borrow/frontend/lib/images/books/dragonball_super.jpeg'),
            MyGridTile(imagePath: '/Users/andrewnguyen/Development/borrow/frontend/lib/images/books/bleach.jpeg'),
            MyGridTile(imagePath: '/Users/andrewnguyen/Development/borrow/frontend/lib/images/books/one_piece.jpeg'),
            MyGridTile(imagePath: '/Users/andrewnguyen/Development/borrow/frontend/lib/images/books/naruto.jpeg'),
            MyGridTile(imagePath: '/Users/andrewnguyen/Development/borrow/frontend/lib/images/books/attack_on_titan.jpeg'),
            MyGridTile(imagePath: '/Users/andrewnguyen/Development/borrow/frontend/lib/images/books/mob_psycho_100.jpeg'),
            MyGridTile(imagePath: '/Users/andrewnguyen/Development/borrow/frontend/lib/images/books/one_punch_man.jpeg'),
            MyGridTile(imagePath: '/Users/andrewnguyen/Development/borrow/frontend/lib/images/books/spy_family.jpeg'),
            MyGridTile(imagePath: '/Users/andrewnguyen/Development/borrow/frontend/lib/images/books/fullmetal_alchemist.jpeg'),
            MyGridTile(imagePath: '/Users/andrewnguyen/Development/borrow/frontend/lib/images/books/death_note.jpeg'),
          ],
        ),
      )
    );
  }
}