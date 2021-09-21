import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:movies/models/detail_model.dart';
import 'package:movies/models/search_model.dart';

class Api {
  var logger = Logger();
  var detailUrl = "https://movie-database-imdb-alternative.p.rapidapi.com/?r=json&";
  var apiUrl =
      "https://movie-database-imdb-alternative.p.rapidapi.com/?r=json&";

  Map<String, String> headers = {
    'x-rapidapi-host': "movie-database-imdb-alternative.p.rapidapi.com",
    'x-rapidapi-key': "b6ba029ccemshdd8e42cba3e92c7p1a99bajsnd856a933360b"
  };

  Future<List<SearchMap>> getMovies(String urx) async {
    urx = ulkeAra(urx);
    var res = await http.get(Uri.parse(urx), headers: headers);

    logger.i(res.body);
    logger.i(res.statusCode);

    if (res.statusCode == 200) {
      Map<String,dynamic> body = jsonDecode(res.body);
      List<dynamic> matchesList = body['Search'];

      List<SearchMap> matches =
      matchesList.map((dynamic item) => SearchMap.fromJson(item)).toList();

      return matches;
    } else {
      throw ("Can't get the Articles");
    }
  }
  String ulkeAra(String urx) {
    return apiUrl + urx;
  }



  Future<MovieDetail> getDetail(String urx) async {
    urx = detay(urx);
    var res = await http.get(Uri.parse(urx), headers: headers);

    logger.i(res.body);
    logger.i(res.statusCode);

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      return MovieDetail.fromJson(body);
    } else {
      throw ("Can't get the Articles");
    }
  }
  String detay(String urx) {
    return detailUrl + urx;
  }


}