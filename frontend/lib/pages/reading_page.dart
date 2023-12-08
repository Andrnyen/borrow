import 'package:flutter/material.dart';
import 'package:frontend/models/book_panel_model.dart';
import 'package:frontend/api_service.dart';

class ReadingPage extends StatefulWidget {
  const ReadingPage({super.key, required this.chapterName, required this.bookChapterId});

  final String chapterName;
  final String bookChapterId;

  @override
  State<ReadingPage> createState() => _ReadingPageState();
}

class _ReadingPageState extends State<ReadingPage> {
  List<BookPanel> panelList = [];
  bool panelsLoaded = false;

  Future<void> fetchPanels() async {
    panelList = await ApiService.getPanels(widget.bookChapterId);
    setState(() {
      panelsLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchPanels();
  }

  @override
  Widget build(BuildContext context) {
    return panelsLoaded ? Scaffold(
      appBar: AppBar(
        title: Text(widget.chapterName),
        backgroundColor: Colors.grey[900],
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: panelList.length, 
          itemBuilder: (context, index) => Image.network(
            width: double.infinity,
            panelList[index].image,
            fit: BoxFit.fitWidth,
            loadingBuilder: (context, child, loadingProgress) => 
              loadingProgress == null ? child : const Center(
                child: CircularProgressIndicator(),
              ),
          )
        ),
      
    ) : Container(
      color: Colors.black,
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.orange,
        )
      ),
    );
  }
}