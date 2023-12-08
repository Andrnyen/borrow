class BookChapter {
  String id;
  String title;

  BookChapter({
    required this.id, 
    required this.title,
  });

  factory BookChapter.fromJson(dynamic json) => BookChapter(
    id: json['id'] as String,
    title: json['title'] as String,
  );

  static List<BookChapter> booksFromSnapshot(List snapshot) => 
    snapshot.map((data) {
      return BookChapter.fromJson(data);
    }
  ).toList();
}