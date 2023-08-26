import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key, required this.title});

  final String title;

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.cyanAccent),
        backgroundColor: Colors.cyan,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 40,
            color: Colors.cyanAccent
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
                  color: Colors.cyan
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
              )
            ],
          ),
        ),
      )
    );
  }
}