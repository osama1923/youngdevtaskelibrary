// models/book.dart

class Book {
  final String id;
  final String title;
  final String author;
  final String description;
  final String thumbnailUrl; // URL for book cover image

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.thumbnailUrl,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['volumeInfo']['title'],
      author: json['volumeInfo']['authors'] != null ? json['volumeInfo']['authors'][0] : 'Unknown Author',
      description: json['volumeInfo']['description'] != null ? json['volumeInfo']['description'] : 'No description available',
      thumbnailUrl: json['volumeInfo']['imageLinks'] != null ? json['volumeInfo']['imageLinks']['thumbnail'] : '',
    );
  }
}
