import 'package:flutter/material.dart';
import 'package:frontend/components/my_grid_tile.dart';

class Book {
  String id;
  String title;
  String imagePath;
  String description;

  Book({
    required this.id, 
    required this.title, 
    required this.imagePath,
    required this.description,  
  });
}

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  Widget appBarTitle = const Text(
    'Borrow',
    style: TextStyle(
      color: Colors.white,
    ),
  );

  Icon actionIcon = const Icon(
    Icons.search,
  );
  
  final _searchQuery = TextEditingController();
  final List<Book> _list = <Book>[];
  List<Book> _searchList = <Book>[];

  late bool isSearching;
  String _searchText = "";
  _ExplorePageState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          isSearching = false;
          _searchText = "";
          _buildSearchList();
        });
      } else {
        setState(() {
          isSearching = true;
          _searchText = _searchQuery.text;
          _buildSearchList();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    isSearching = false;
    init();
  }

  void init() {
    _list.add(
      Book(
        id: '1', 
        title: 'Chainsaw Man', 
        imagePath: '/Users/andrewnguyen/Development/borrow/frontend/lib/images/books/chainsaw_man.jpeg',
        description: ''
      ),
    );
    _list.add(
      Book(
        id: '2', 
        title: "Jujutsu Kaisen",
        imagePath: '/Users/andrewnguyen/Development/borrow/frontend/lib/images/books/jujutsu_kaisen.jpeg',
        description: ''
      ),
    );
    _list.add(
      Book(
        id: '3',
        title: 'Dragonball Super', 
        imagePath: '/Users/andrewnguyen/Development/borrow/frontend/lib/images/books/dragonball_super.jpeg',
        description: ''
      ),
    );
    _list.add(
      Book(
        id: '4',
        title: 'Bleach', 
        imagePath: '/Users/andrewnguyen/Development/borrow/frontend/lib/images/books/bleach.jpeg',
        description: ''
      ),
    );
    _list.add(
      Book(
        id: '5',
        title: 'One Piece', 
        imagePath: '/Users/andrewnguyen/Development/borrow/frontend/lib/images/books/one_piece.jpeg',
        description: ''
      ),
    );
    _list.add(
      Book(
        id: '6',
        title: 'Naruto', 
        imagePath: '/Users/andrewnguyen/Development/borrow/frontend/lib/images/books/naruto.jpeg',
        description: ''
      ),
    );
    _list.add(
      Book(
        id: '7',
        title: 'Attack On Titan', 
        imagePath: '/Users/andrewnguyen/Development/borrow/frontend/lib/images/books/attack_on_titan.jpeg',
        description: ''
      ),
    );
    _list.add(
      Book(
        id: '8',
        title: 'Mob Psycho 100', 
        imagePath: '/Users/andrewnguyen/Development/borrow/frontend/lib/images/books/mob_psycho_100.jpeg',
        description: ''
      ),
    );
    _list.add(
      Book(
        id: '9',
        title: 'One Punch Man', 
        imagePath: '/Users/andrewnguyen/Development/borrow/frontend/lib/images/books/one_punch_man.jpeg',
        description: ''
      ),
    );
    _list.add(
      Book(
        id: '10',
        title: 'Spy Family', 
        imagePath: '/Users/andrewnguyen/Development/borrow/frontend/lib/images/books/spy_family.jpeg',
        description: ''
      ),
    );
    _list.add(
      Book(
        id: '11',
        title: 'Fullmetal Alchemist', 
        imagePath: '/Users/andrewnguyen/Development/borrow/frontend/lib/images/books/fullmetal_alchemist.jpeg',
        description: ''
      ),
    );
    _list.add(
      Book(
        id: '12',
        title: 'Death Note', 
        imagePath: '/Users/andrewnguyen/Development/borrow/frontend/lib/images/books/death_note.jpeg',
        description: ''
      ),
    );
    _searchList = _list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBar(context),
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
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: _searchList.length,
          itemBuilder: (context, index) {
            return MyGridTile(book: _searchList[index]);
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.6,
            crossAxisSpacing: 10,
            mainAxisSpacing: 4,
          )
        )
      )
    );
  }

  AppBar buildBar(BuildContext context) {
    return AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.lightBlueAccent,
        title: appBarTitle,
        actions: [
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (actionIcon.icon == Icons.search) {
                  actionIcon = Icon(
                    Icons.close,
                    color: Colors.grey[700],
                  );
                  appBarTitle = TextField(
                    controller: _searchQuery,
                    style: const TextStyle(
                      color: Colors.white
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Search here...',
                      hintStyle: TextStyle(color: Colors.white)
                    ),
                  );
                  _handleSearchStart();
                } else {
                  _handleSearchEnd();
                }
              }
            );
          },
        )
      ]
    );
  }

  List<Book> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _searchList = _list;
    } else {
      _searchList = _list.where(
        (element) => element.title.toLowerCase().contains(_searchText.toLowerCase()))
        .toList();
      return _searchList; //_searchList.map((contact) =>  Uiitem(contact)).toList();
    }
  }

  void _handleSearchStart() {
    setState(() {
      isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      actionIcon = const Icon(
        Icons.search,
        color: Colors.white,
      );
      appBarTitle = const Text(
        'Borrow',
        style: TextStyle(
          color: Colors.white,
        ),
      );
      isSearching = false;
      _searchQuery.clear();
    });
  }
}