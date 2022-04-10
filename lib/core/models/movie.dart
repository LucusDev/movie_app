class Movie {
  int? id;
  String? title;

  List<Genres>? genres;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  int? runtime;
  double? voteAverage;
  int? voteCount;

  Movie({
    this.genres,
    this.id,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCountries,
    this.releaseDate,
    this.runtime,
    this.title,
    this.voteAverage,
    this.voteCount,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    if (json["genres"] is List) {
      genres = json["genres"] == null
          ? null
          : (json["genres"] as List).map((e) => Genres.fromJson(e)).toList();
    }
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["original_title"] is String) {
      originalTitle = json["original_title"];
    }
    if (json["overview"] is String) {
      overview = json["overview"];
    }
    if (json["popularity"] is double) {
      popularity = json["popularity"];
    }
    if (json["poster_path"] is String) {
      posterPath = json["poster_path"];
    }
    if (json["production_countries"] is List) {
      productionCountries = json["production_countries"] == null
          ? null
          : (json["production_countries"] as List)
              .map((e) => ProductionCountries.fromJson(e))
              .toList();
    }
    if (json["release_date"] is String) {
      releaseDate = json["release_date"];
    }
    if (json["runtime"] is int) {
      runtime = json["runtime"];
    }

    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["vote_average"] is double) {
      voteAverage = json["vote_average"];
    }
    if (json["vote_count"] is int) {
      voteCount = json["vote_count"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (genres != null) {
      data["genres"] = genres?.map((e) => e.toJson()).toList();
    }
    data["id"] = id;
    data["original_title"] = originalTitle;
    data["overview"] = overview;
    data["popularity"] = popularity;
    data["poster_path"] = posterPath;
    if (productionCountries != null) {
      data["production_countries"] =
          productionCountries?.map((e) => e.toJson()).toList();
    }
    data["release_date"] = releaseDate;
    data["runtime"] = runtime;

    data["title"] = title;
    data["vote_average"] = voteAverage;
    data["vote_count"] = voteCount;
    return data;
  }

  Movie copyWith({
    List<Genres>? genres,
    int? id,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    List<ProductionCountries>? productionCountries,
    String? releaseDate,
    int? runtime,
    String? title,
    double? voteAverage,
    int? voteCount,
  }) =>
      Movie(
        genres: genres ?? this.genres,
        id: id ?? this.id,
        originalTitle: originalTitle ?? this.originalTitle,
        overview: overview ?? this.overview,
        popularity: popularity ?? this.popularity,
        posterPath: posterPath ?? this.posterPath,
        productionCountries: productionCountries ?? this.productionCountries,
        releaseDate: releaseDate ?? this.releaseDate,
        runtime: runtime ?? this.runtime,
        title: title ?? this.title,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
      );
}

class ProductionCountries {
  String? iso31661;
  String? name;

  ProductionCountries({this.iso31661, this.name});

  ProductionCountries.fromJson(Map<String, dynamic> json) {
    if (json["iso_3166_1"] is String) {
      iso31661 = json["iso_3166_1"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["iso_3166_1"] = iso31661;
    data["name"] = name;
    return data;
  }

  ProductionCountries copyWith({
    String? iso31661,
    String? name,
  }) =>
      ProductionCountries(
        iso31661: iso31661 ?? this.iso31661,
        name: name ?? this.name,
      );
}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    return data;
  }

  Genres copyWith({
    int? id,
    String? name,
  }) =>
      Genres(
        id: id ?? this.id,
        name: name ?? this.name,
      );
}
