class SearchModel {
  String? totalResults;

  List<SearchMap>? searchList;

  SearchModel.fromJson(Map json) {
    totalResults = json['totalResults'];
    searchList =(json['Search'] ?? [])
        .map((e) => SearchMap.fromJson(e))
        .toList()
        .cast<SearchMap>();
  }
}

class SearchMap{

  String? title;
  String? year;
  String? type;
  String? poster;
  String? imdbId;

  SearchMap.fromJson(Map json){
    title = json['Title'];
    year = json['Year'];
    type = json['Type'];
    poster = json['Poster'];
    imdbId = json['imdbID'];
  }

}
