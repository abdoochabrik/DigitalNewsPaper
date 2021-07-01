class News {
  final String? id;
  final String? title;
  final String? description;
  final String? categorie;
  final String? author;
  final String? imageUrl;
  final DateTime? date;
  final String? details;

  News(
      {this.id,
      this.title,
      this.description,
      this.categorie,
      this.author,
      this.imageUrl,
      this.date,
      this.details});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        id: json['_id'],
        title: json['title'],
        description: json['description'],
        categorie: json['categorie'],
        author: json['author'],
        imageUrl: json['imageUrl'],
        date: DateTime.parse(json['date']),
        details: json['details']);
  }
}
