class HotMovieData {
  Rating rating;
  List<String> genres;
  String title;
  List<Cast> casts;
  int collectCount;
  List<Cast> directors;
  Avatars images;
  String id;

  HotMovieData();
  factory HotMovieData.fromJson(Map<String, dynamic> movieDataJson) {
    HotMovieData hotMovieData = HotMovieData();

    Rating rating = Rating(movieDataJson['rating']['max'], double.parse(movieDataJson['rating']['average'].toString()), movieDataJson['rating']['min']);
    hotMovieData.rating = rating;

    List<String> genres =new List();
    for(String genre in movieDataJson['genres']){
      genres.add(genre);
    }
    hotMovieData.genres = genres;

    hotMovieData.title = movieDataJson['title'];

    List<Cast> casts = new List();
    for (dynamic castData in movieDataJson['casts']) {
      Avatars avatars = Avatars(castData['avatars']['small'], castData['avatars']['large'], castData['avatars']['medium']);
      Cast cast= new Cast(castData['alt'],avatars,castData['name'],castData['id']);
      casts.add(cast);
    }
    hotMovieData.casts = casts;

    hotMovieData.collectCount = movieDataJson['collect_count'];

    List<Cast> directors = new List();
    for (dynamic castData in movieDataJson['directors']) {
      Avatars avatars = Avatars(castData['avatars']['small'], castData['avatars']['large'], castData['avatars']['medium']);
      Cast cast= new Cast(castData['alt'],avatars,castData['name'],castData['id']);
      directors.add(cast);
    }
    hotMovieData.directors = directors;

    hotMovieData.images = Avatars(movieDataJson['images']['small'],movieDataJson['images']['large'],movieDataJson['images']['medium']);

    hotMovieData.id = movieDataJson['id'];
    return hotMovieData;
  }
}

class Rating {
  int max;
  double average;
  int min;

  Rating(this.max,this.average,this.min);
}

class Cast {
  String alt;
  Avatars avatars;
  String name;
  String id;

  Cast(this.alt,this.avatars,this.name,this.id);
}

class Avatars {
  String small;
  String large;
  String medium;

  Avatars(this.small,this.large,this.medium);
}
