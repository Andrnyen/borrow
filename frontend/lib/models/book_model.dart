class Book {
  String id;
  String title;
  String thumb;
  String summary;
  List<String> authors;
  List<String> genres;
  String status;

  Book({
    required this.id, 
    required this.title, 
    required this.thumb,
    required this.summary,
    required this.authors,
    required this.genres,
    required this.status
  });

  factory Book.fromJson(dynamic json) => Book(
    id: json['id'] as String,
    title: json['title'] as String,
    thumb: json['thumb'] as String,
    summary: json['summary'] as String,
    authors: List<String>.from(json['authors'] as List),
    genres: List<String>.from(json['genres'] as List),
    status: json['status'] as String
  );

  static List<Book> booksFromSnapshot(List snapshot) => 
    snapshot.map((data) {
      return Book.fromJson(data);
    }
  ).toList();
  

  @override
  String toString() {
    return 'Book {id: $id, title: $title, thumb: $thumb, summary: $summary}';
  }
}