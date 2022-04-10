class People {
  int? id;
  String? name;
  String? profilePath;

  People({
    this.id,
    this.name,
    this.profilePath,
  });

  People.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) id = json["id"];
    if (json["name"] is String) name = json["name"];
    if (json["profile_path"] is String) profilePath = json["profile_path"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["profile_path"] = profilePath;
    return data;
  }

  People copyWith({
    int? id,
    String? name,
    String? profilePath,
  }) =>
      People(
        id: id ?? this.id,
        name: name ?? this.name,
        profilePath: profilePath ?? this.profilePath,
      );
}
