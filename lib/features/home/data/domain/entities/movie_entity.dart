class MovieEntity {
  final String poster;
  final String title;
  final String year;
  final String id;
  final String type;
  MovieEntity(this.id, this.type,
      {required this.poster, required this.title, required this.year});
}
