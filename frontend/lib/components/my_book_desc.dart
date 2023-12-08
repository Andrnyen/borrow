import 'package:flutter/material.dart';
import 'package:frontend/book_model.dart';
import 'package:frontend/components/subheadings.dart';

class MyBookDesc extends StatefulWidget {
  const MyBookDesc({super.key, required this.book});

  final Book book;

  @override
  State<MyBookDesc> createState() => _MyBookDescState();
}

class _MyBookDescState extends State<MyBookDesc> {
  String firstHalf = '';
  String secondHalf = '';

  bool extended = true;

  @override
  void initState() {
    super.initState();

    if (widget.book.summary.length > 500) {
    firstHalf = widget.book.summary.substring(0, 500);
      secondHalf = widget.book.summary.substring(500, widget.book.summary.length);
    } else {
      firstHalf = widget.book.summary;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: SubHeadings(title: 'Description')
          ),

          const SizedBox(height: 10,),

          Align(
            alignment: Alignment.centerLeft,
            child: secondHalf.isEmpty ? Text(
              firstHalf,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ) : Column(
              children: [
                Text(
                  extended ? ('$firstHalf...') : ('$firstHalf $secondHalf'),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        extended ? "show more" : "show less",
                        style: TextStyle(
                          color: Colors.orange.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      extended = !extended;
                    });
                  },
                ),
              ],
            ),
          ),

          const Align(
            alignment: Alignment.topLeft,
            child: SubHeadings(title: 'Genres')
          ),

          const SizedBox(height: 10,),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.book.genres.join(', '),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      )
    );
  }
}