class MoviesResponseModel {
  int? currentPage;
  bool? hasNextPage;
  List<MoviesData>? results;
  int? totalResults;
  int? totalPages;

  MoviesResponseModel(
      {this.currentPage,
      this.hasNextPage,
      this.results,
      this.totalResults,
      this.totalPages});

  MoviesResponseModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    hasNextPage = json['hasNextPage'];
    if (json['results'] != null) {
      results = <MoviesData>[];
      json['results'].forEach(
        (v) {
          results?.add(MoviesData.fromJson(v));
        },
      );
    }
    totalResults = json['totalResults'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['hasNextPage'] = hasNextPage;
    if (results != null) {
      data['results'] = results?.map((v) => v.toJson()).toList();
    }
    data['totalResults'] = totalResults;
    data['totalPages'] = totalPages;
    return data;
  }
}

class MoviesData {
  int? id;
  String? title;
  String? image;
  String? type;
  double? rating;
  String? releaseDate;

  MoviesData(
      {this.id,
      this.title,
      this.image,
      this.type,
      this.rating,
      this.releaseDate});

  MoviesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    type = json['type'];
    rating = (json['rating'] ?? 0.0).toDouble();
    releaseDate = json['releaseDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['type'] = type;
    data['rating'] = rating;
    data['releaseDate'] = releaseDate;
    return data;
  }
}
