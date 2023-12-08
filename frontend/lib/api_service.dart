import 'dart:convert';
import 'package:frontend/models/book_chapter_model.dart';
import 'package:frontend/models/book_panel_model.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/models/book_model.dart';

class ApiService {
  static Future<List<Book>> getBooks() async {
    var url = Uri.https(
      'mangaverse-api.p.rapidapi.com',
      '/manga/fetch',
      {
        'type': 'japan',
      }
    );

    final response = await http.get(
      url,
      headers: {
        'x-rapidapi-key': '1509e488c4msh055312b2b2dde14p12d522jsn9f316f4f0446',
        'x-rapidapi-host': 'mangaverse-api.p.rapidapi.com',
      },
    );

    Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data['data']) {
      temp.add(i);
    }

    return Book.booksFromSnapshot(temp);
  }

  static Future<List<BookChapter>> getChapters(String id) async {
    var url = Uri.https(
      'mangaverse-api.p.rapidapi.com',
      '/manga/chapter',
      {
        'id': id
      }
    );

    final response = await http.get(
      url,
      headers: {
        'x-rapidapi-key': '1509e488c4msh055312b2b2dde14p12d522jsn9f316f4f0446',
        'x-rapidapi-host': 'mangaverse-api.p.rapidapi.com',
      },
    );

    Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data['data']) {
      temp.add(i);
    }

    return BookChapter.booksFromSnapshot(temp);
  }

  static Future<List<BookPanel>> getPanels(String id) async {
    var url = Uri.https(
      'mangaverse-api.p.rapidapi.com',
      '/manga/image',
      {
        'id': id
      }
    );

    final response = await http.get(
      url,
      headers: {
        'x-rapidapi-key': '1509e488c4msh055312b2b2dde14p12d522jsn9f316f4f0446',
        'x-rapidapi-host': 'mangaverse-api.p.rapidapi.com',
      },
    );

    Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data['data']) {
      temp.add(i);
    }

    return BookPanel.booksFromSnapshot(temp);
  }
}
