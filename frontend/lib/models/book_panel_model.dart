class BookPanel {
  String id;
  String image;

  BookPanel({
    required this.id, 
    required this.image
  });

  factory BookPanel.fromJson(dynamic json) => BookPanel(
    id: json['id'] as String,
    image: json['link'] as String,
  );

  static List<BookPanel> booksFromSnapshot(List snapshot) => 
    snapshot.map((data) {
      return BookPanel.fromJson(data);
    }
  ).toList();
}