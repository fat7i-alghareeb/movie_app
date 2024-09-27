class MovieDetailsEntity {
  final String poster;
  final String title;
  final String year;
  final String id;
  final String type;
  final String rating;
  final String rated;
  final String duration;
  final String genre;
  final String director;
  final List<String> actors;
  final String plot;
  final String language;
  final String awards;
  MovieDetailsEntity({
    required this.rating,
    required this.poster,
    required this.title,
    required this.year,
    required this.id,
    required this.type,
    required this.rated,
    required this.duration,
    required this.genre,
    required this.director,
    required this.actors,
    required this.plot,
    required this.language,
    required this.awards,
  });
}
