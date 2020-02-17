import 'package:film_catalog/models/actor.dart';
import 'package:film_catalog/models/movie.dart';

class DummyData {
  //Genres
  static List<String> genericGenres1 = [
    "Thriller",
    "Aciton",
    "Crime",
  ];
  static List<String> genericGenres2 = ["Aciton", "Adventure", "Sci-Fi"];
  static List<String> genericGenres3 = ["Aciton", "Adventure", "Fantasy"];
  static List<String> genericGenres4 = ["Aciton", "Adventure", "Drama"];
  static List<String> genericGenres5 = ["Aciton", "Adventure", "Sci-Fi"];

  //Casts
  static List<Actor> cast1 = [
    new Actor("Keanu Reeves", "John Wick", "lib/assets/images/actor_1.jpg"),
    new Actor("Halle Berry", "Sofia", "lib/assets/images/actor_2.jpg"),
    new Actor("Ian McShane", "Winston", "lib/assets/images/actor_3.jpg"),
    new Actor("Mark Dacascos", "Zero", "lib/assets/images/actor_4.jpg"),
    new Actor(
        "Laurence Fishburne", "Bowery King", "lib/assets/images/actor_5.jpg"),
  ];
  static List<Actor> cast2 = [
    new Actor("Tom Holland", "Peter Parker", "lib/assets/images/actor_2_1.jpg"),
    new Actor("Zendaya", 'Michelle "MJ"', "lib/assets/images/actor_2_2.jpg"),
    new Actor("Jake Gyllenhaal", "Mysterio", "lib/assets/images/actor_2_3.jpg"),
    new Actor("Jacob Batalon", "Ned Leeds", "lib/assets/images/actor_2_4.jpg"),
    new Actor(
        "Samuel L. Jackson", "Nyck Fury", "lib/assets/images/actor_2_5.jpg"),
    new Actor(
        "Cobie Smulders", "Maria Hill", "lib/assets/images/actor_2_6.jpg"),
    new Actor("Marisa Tomei", "Mary Parker", "lib/assets/images/actor_2_7.jpg"),
    new Actor("Jon Favreau", "Happy Hogan", "lib/assets/images/actor_2_8.jpg"),
  ];
  static List<Actor> cast3 = [
    new Actor("Millie Bobby Brown", "Madison Russell", ""),
    new Actor("Vera Farmiga", "Dr. Emma Russel", ""),
    new Actor("Kyle Chandler", "Mark Russel", ""),
    new Actor("Ken Watanabe", "Dr. Ishiro S.", ""),
    new Actor("O'Shea Jackson Jr.", "Barnes", ""),
    new Actor("Charles Dance", "Alan Jonah", ""),
  ];
  static List<Actor> cast4 = [
    new Actor("Scarlett Johansson", "Black Widow", ""),
    new Actor("Robert Downey Jr.", "Iron Man", ""),
    new Actor("Chris Evans", "Captain America", ""),
    new Actor("Chris Hemsworth", "Thor", ""),
    new Actor("Mark Ruffalo", "Hulk", ""),
    new Actor("Jeremy Renner", "Clint Barton", ""),
    new Actor("Brie Larson", "Captain Marvel", ""),
    new Actor("Paul Rudd", "Ant Man", ""),
    new Actor("Karen Gillan", "Nebula", ""),
    new Actor("Don Cheadle", "War Machine", ""),
    new Actor("Tom Holland", "Spider Man", "lib/assets/images/actor_2_1.jpg"),
  ];
  static List<Actor> cast5 = [
    new Actor("Linda Hamilton", "Sarah Connor", ""),
    new Actor("Arnold Schwarzenegger", "Terminator", ""),
    new Actor("Mackenzie Davis", "Grace", ""),
    new Actor("Natalia Reyes", "Dani Ramos", ""),
    new Actor("Gabriel Luna", "Terminator", ""),
  ];

  //Trailers
  static List<String> trailers1 = [
    "lib/assets/videos/jhon_wick_trailer.mp4",
    "lib/assets/videos/jhon_wick_trailer.mp4",
    "lib/assets/videos/jhon_wick_trailer.mp4",
  ];

  static List<Movie> dummyMoviesList = [
    //
    new Movie(
      "Jhon Wick: Chapter 3 - Parabellum",
      "lib/assets/images/jhonwick_poster.jpg",
      genericGenres1,
      7.5,
      "John Wick is on the run after killing a member of the international assassins' guild, and with a ${14} million price tag on his head, he is the target of hit men and women everywhere.",
      cast1,
      "2019",
      "2h 11min",
      "NC-17",
      "USA",
      trailers1,
    ),
    //
    new Movie(
      "Spiderman: Far from home",
      "lib/assets/images/spiderman_poster.jpg",
      genericGenres2,
      7.6,
      "Following the events of Avangers: Endgame (2019), Spider-Man must step up to take on new threats in a world that has changed forever.",
      cast2,
      "2019",
      "2h 9min",
      "PG-13",
      "USA",
      new List(),
    ),
    //
    new Movie(
      "Godzilla: King of monsters",
      "lib/assets/images/godzilla_poster.jpg",
      genericGenres3,
      6.1,
      "The crypto-zoological agency Monarch faces off against a battery of god-sized monsters, including the mighty Godzilla, who collides with Mothra, Rodan, and his ultimate nemesis, the three-headed King Ghidorah.",
      cast3,
      "2019",
      "2h 12min",
      "PG-13",
      "USA",
      new List(),
    ),
    //
    new Movie(
      "Avangers: End game",
      "lib/assets/images/avangers_poster.png",
      genericGenres4,
      8.5,
      "After the devastating events of Vengadores: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos' actions and restore balance to the universe.",
      cast4,
      "2019",
      "3h 1min",
      "PG-13",
      "USA",
      new List(),
    ),
    //
    new Movie(
      "Terminator: Dark fate",
      "lib/assets/images/terminator_poster.jpg",
      genericGenres5,
      6.3,
      "An augmented human and Sarah Connor must stop an advanced liquid Terminator, from hunting down a young girl, whose fate is critical to the human race.",
      cast5,
      "2019",
      "2h 8min",
      "R",
      "USA",
      new List(),
    ),
  ];
}
