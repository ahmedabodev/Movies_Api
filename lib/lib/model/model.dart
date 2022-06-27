class model {
  String release_date;
  var vote_average;
  String title;
  String poster_path;
  String backdrop_path;
  String overview;
  model(
      {required this.release_date,
      required this.vote_average,
      required this.title,
      required this.poster_path,
      required this.backdrop_path,
      required this.overview});

  Map<String, dynamic> toJson() {
    return {
      "release_date": this.release_date,
      "vote_average": this.vote_average,
      "title": this.title,
      "poster_path": this.poster_path,
      "backdrop_path": this.backdrop_path,
    };
  }

  factory model.fromJson(Map<String, dynamic> json) {
    return model(
      overview: json["overview"],
      release_date: json["release_date"],
      vote_average: json["vote_average"],
      title: json["title"],
      poster_path: json["poster_path"],
      backdrop_path: json["backdrop_path"],
    );
  }
//

//

}
