import 'package:flutter/material.dart';
import 'package:frontend/components/book_info_page.dart';
import 'package:frontend/components/my_grid_tile.dart';
import 'package:frontend/book.dart';
import 'package:frontend/api_service.dart';

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
  List<Book> _list = <Book>[];
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
    init();
  }

  Future<void> init() async {
    _list = await ApiService.getBooks();
    _searchList = _list;
    setState(() {
      isSearching = false;
    });
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
            return GestureDetector( 
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BookInfoPage(book: _searchList[index]),));
              },
              child: MyGridTile(book: _searchList[index])
            );
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