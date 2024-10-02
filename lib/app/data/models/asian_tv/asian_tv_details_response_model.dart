class TVDetailsResponseModel {
  String? id;
  String? title;
  String? status;
  List<String>? genres;
  List<String>? otherNames;
  String? image;
  String? description;
  String? releaseDate;
  String? contentRating;
  String? airsOn;
  String? director;
  String? originalNetwork;
  Trailer? trailer;
  List<CharactersList>? characters;
  List<Episodes>? episodes;

  TVDetailsResponseModel(
      {this.id,
      this.title,
      this.status,
      this.genres,
      this.otherNames,
      this.image,
      this.description,
      this.releaseDate,
      this.contentRating,
      this.airsOn,
      this.director,
      this.originalNetwork,
      this.trailer,
      this.characters,
      this.episodes});

  TVDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    genres = json['genres'].cast<String>();
    otherNames = json['otherNames'].cast<String>();
    image = json['image'];
    description = json['description'];
    releaseDate = json['releaseDate'];
    contentRating = json['contentRating'];
    airsOn = json['airsOn'];
    director = json['director'];
    originalNetwork = json['originalNetwork'];
    trailer =
        json['trailer'] != null ? Trailer.fromJson(json['trailer']) : null;
    if (json['characters'] != null) {
      characters = <CharactersList>[];
      json['characters'].forEach((v) {
        characters?.add(CharactersList.fromJson(v));
      });
    }
    if (json['episodes'] != null) {
      episodes = <Episodes>[];
      json['episodes'].forEach((v) {
        episodes?.add(Episodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['status'] = status;
    data['genres'] = genres;
    data['otherNames'] = otherNames;
    data['image'] = image;
    data['description'] = description;
    data['releaseDate'] = releaseDate;
    data['contentRating'] = contentRating;
    data['airsOn'] = airsOn;
    data['director'] = director;
    data['originalNetwork'] = originalNetwork;
    if (trailer != null) {
      data['trailer'] = trailer?.toJson();
    }
    if (characters != null) {
      data['characters'] = characters?.map((v) => v.toJson()).toList();
    }
    if (episodes != null) {
      data['episodes'] = episodes?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Trailer {
  String? id;
  String? url;

  Trailer({this.id, this.url});

  Trailer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    return data;
  }
}

class CharactersList {
  String? url;
  String? image;
  String? name;

  CharactersList({this.url, this.image, this.name});

  CharactersList.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['image'] = image;
    data['name'] = name;
    return data;
  }
}

class Episodes {
  String? id;
  String? title;
  int? episode;
  String? subType;
  String? releaseDate;
  String? url;

  Episodes(
      {this.id,
      this.title,
      this.episode,
      this.subType,
      this.releaseDate,
      this.url});

  Episodes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    episode = json['episode'];
    subType = json['subType'];
    releaseDate = json['releaseDate'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['episode'] = episode;
    data['subType'] = subType;
    data['releaseDate'] = releaseDate;
    data['url'] = url;
    return data;
  }
}
