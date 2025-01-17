class Book {
  final int id;
  final String title;
  final String author;
  final int publicationYear;
  final List<String> genre;
  final String description;
  final String coverImage;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.publicationYear,
    required this.genre,
    required this.description,
    required this.coverImage,
  });

  //Factory method to create a Book object from JSON
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as int,
      title: json['title'] as String,
      author: json['author'] as String,
      publicationYear: json['publication_year'] as int,
      genre: List<String>.from(json['genre']),
      description: json['description'] as String,
      coverImage: json['cover_image'] as String,
    );
  }

  //Method to convert a Book object to Json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'publication_year': publicationYear,
      'genre': genre,
      'description': description,
      'cover_image': coverImage,
    };
  }
}
