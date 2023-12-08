import 'package:flutter/material.dart';
import 'package:frontend/models/book_chapter_model.dart';
import 'package:frontend/components/hor_divider.dart';
import 'package:frontend/components/my_book_cover.dart';
import 'package:frontend/components/my_book_desc.dart';
import 'package:frontend/pages/explore_page.dart';
import 'package:frontend/models/book_model.dart';
import 'package:frontend/api_service.dart';
import 'package:frontend/pages/reading_page.dart';

class BookInfoPage extends StatefulWidget {
  const BookInfoPage({super.key, required this.book});

  final Book book;

  @override
  State<BookInfoPage> createState() => _BookInfoPage();
}

class _BookInfoPage extends State<BookInfoPage> {
  List<BookChapter> bookChapters = [];
  bool dataFetch = false;
  
  Future<void> fetchChapters() async {
    bookChapters = await ApiService.getChapters(widget.book.id);
    setState(() {
      dataFetch = true;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchChapters();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          widget.book.title,
          style: const TextStyle(color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: Colors.grey[900],
        leading: BackButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ExplorePage(),));
          },
          color: Colors.white,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: dataFetch ? SizedBox(
        height: screenSize.height,
        width: screenSize.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              MyBookCover(book: widget.book),
              const HorDivider(),

              Padding(
                padding: const EdgeInsets.all(10),
                child: MyBookDesc(book: widget.book,),
              ),

              const HorDivider(),

              Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: Colors.white, // here for close state
                  colorScheme: const ColorScheme.light(
                    primary: Colors.white,
                  )
                ),
                child: ExpansionTile(
                  tilePadding: const EdgeInsets.all(10),
                  title: const Text(
                    'Chapters',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                  children: List.generate(
                    bookChapters.length, 
                    (index) => GestureDetector(
                      onTap: () => {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => 
                            ReadingPage(chapterName: bookChapters[index].title, bookChapterId: bookChapters[index].id,)
                          )
                        )
                      },
                      child: ListTile(
                        contentPadding: const EdgeInsets.only(left: 10), 
                        title: Text(
                          bookChapters[index].title,
                          style: const TextStyle(color: Colors.white),
                        ),
                      )
                    )
                  ),
                )
              )
            ]
          )
        )
      ) : Container(
        color: Colors.black,
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.orange,
          )
        ),
      )
    );
  }
}