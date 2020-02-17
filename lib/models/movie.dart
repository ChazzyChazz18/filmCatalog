import 'package:film_catalog/models/actor.dart';

class Movie {
  String name;
  String url;
  List<String> genres;
  double rating;
  String summary;
  List<Actor> cast;
  String releaseDate;
  String duration;
  String clasification;
  String country;
  List<String> videos;

  Movie.empty();

  Movie(
    this.name,
    this.url,
    this.genres,
    this.rating,
    this.summary,
    this.cast,
    this.releaseDate,
    this.duration,
    this.clasification,
    this.country,
    this.videos,
  );

  String getGenresList() {
    String genresList;
    List<String> genresSorted = new List();
    genresSorted.addAll(genres);
    genresSorted.sort((a, b) => a.toString().compareTo(b.toString()));
    genresList = genresSorted.join(", ");
    return genresList;
  }

  static const notFoundMaleImg = "lib/assets/images/not_found_male.jpg";
  static const notFoundFemaleImg = "lib/assets/images/not_found_female.png";

}
