class AsianTvResponseModel {
  int? currentPage;
  int? totalPages;
  bool? hasNextPage;
  List<AsianTvDataList>? results;

  AsianTvResponseModel(
      {this.currentPage, this.totalPages, this.hasNextPage, this.results});

  AsianTvResponseModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'] != null
        ? int.parse(
            json['currentPage'],
          )
        : json['currentPage'];
    totalPages = json['totalPages'];
    hasNextPage = json['hasNextPage'];
    if (json['results'] != null) {
      results = <AsianTvDataList>[];
      json['results'].forEach((v) {
        results?.add(AsianTvDataList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['totalPages'] = totalPages;
    data['hasNextPage'] = hasNextPage;
    if (results != null) {
      data['results'] = results?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AsianTvDataList {
  String? id;
  String? title;
  String? url;
  String? image;

  AsianTvDataList({this.id, this.title, this.url, this.image});

  AsianTvDataList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['url'] = url;
    data['image'] = image;
    return data;
  }
}
