import 'package:flutter/material.dart';
import 'package:frontend/api_service.dart';
import 'package:frontend/components/my_bottom_nav_item.dart';
import 'package:frontend/book_model.dart';
import 'package:frontend/components/my_manga_card.dart';
import 'package:frontend/components/book_info_page.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int selectedNavIndex = 0;
  bool mangaLoaded = false;
  List<Book> mangaList = [];

  void navBarTap(int index) =>
    setState(() => selectedNavIndex = index
  );

  Future<void> fetchManga() async {
    mangaList = await ApiService.getBooks();
    setState(() {
      mangaLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchManga();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Borrow'),
        backgroundColor: Colors.grey[900],
      ),
      body: mangaLoaded ? 
        Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          height: screenSize.height,
          width: double.infinity,
          color: Colors.black,
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                crossAxisCount: 3,
                childAspectRatio: 1 / 2.25
              ), 
              itemCount: mangaList.length,
              itemBuilder: (_, i) =>  GestureDetector(
                onTap: () => {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => BookInfoPage(book: mangaList[i]),))
                },
                child: MyGridTile(book: mangaList[i]),
              )
            ),
        ) :
        const Center(child: CircularProgressIndicator(
          color: Colors.orange
          )
        ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: navBarTap,
        currentIndex: selectedNavIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.orange[300],
        unselectedItemColor: Colors.white,
        items: [
          myBottomNavItem(Icons.explore, 'DISCOVER'),
          myBottomNavItem(Icons.library_books, 'MY LIBRARY'),
          myBottomNavItem(Icons.account_circle_outlined, 'PROFILE')
        ]
      ),
    );
  }
}