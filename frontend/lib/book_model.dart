class Book {
  String id;
  String title;
  String thumb;

  Book({
    required this.id, 
    required this.title, 
    required this.thumb,
  });

  factory Book.fromJson(dynamic json) => Book(
    id: json['id'] as String,
    title: json['title'] as String,
    thumb: json['thumb'] as String,
  );

  static List<Book> booksFromSnapshot(List snapshot) => 
    snapshot.map((data) {
      return Book.fromJson(data);
    }
  ).toList();
  

  @override
  String toString() {
    return 'Book {id: $id, title: $title, thumb: $thumb}';
  }
}