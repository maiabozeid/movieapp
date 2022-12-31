import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:movies_app/models/categoryResponse.dart';
import 'package:movies_app/models/likeMoviesResponse.dart';
import 'package:movies_app/models/now_playing.dart';
import 'package:movies_app/models/searchRespnse.dart';
import 'package:movies_app/models/topRatedResponse.dart';
import '../constant/api_constant.dart';

import '../models/CastModel2.dart';
import '../models/categoryListResponse.dart';
import '../models/now_playing.dart';

class ApiManager {


  static Future<TopRatedResponse> topRated() async {
    var uri = Uri.https(ApiConstant.baseUrl, '/3/movie/top_rated', {'api_key': ApiConstant.apiKey});
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return TopRatedResponse.fromJson(json);
    }
    throw Exception('error');
  }

  static Future<NowPlaying> nowPlaying() async {
    var uri = Uri.https(ApiConstant.baseUrl, '/3/movie/now_playing', {'api_key': ApiConstant.apiKey});
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NowPlaying.fromJson(json);
    }
    throw Exception('error');
  }

  static Future<LikeMoviesResponse> likeMovies(int movieId) async {
    var uri = Uri.https(ApiConstant.baseUrl, '/3/movie/$movieId/similar',
        {'api_key':ApiConstant.apiKey, 'movie_id': ''});
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return LikeMoviesResponse.fromJson(json);
    }
    throw Exception('error');
  }

  static Future<SearchResponse> searchMovie(String query) async {
    var uri = Uri.https(
        ApiConstant.baseUrl, '/3/search/movie', {'api_key': ApiConstant.apiKey, 'query': query});
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SearchResponse.fromJson(json);
    }
    throw Exception('error');
  }

  static Future<CategoryResponse> movieCategory() async {
    var uri = Uri.https(ApiConstant.baseUrl, '/3/genre/movie/list', {
      'api_key': ApiConstant.apiKey,
    });
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return CategoryResponse.fromJson(json);
    }
    throw Exception('error');
  }

  static Future<CategoryListResponse> categoryList(num catId) async {
    var uri = Uri.https(ApiConstant.baseUrl, '/3/discover/movie', {
      'api_key': ApiConstant.apiKey,
      'with_genres': catId.toString(),
    });
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return CategoryListResponse.fromJson(json);
    }
    throw Exception('error');
  }

  static Future<CastModel2> castModel(int movieId) async {
    var uri = Uri.https(ApiConstant.baseUrl, '/3/movie/550/credits',
        {'api_key':ApiConstant.apiKey, 'movie_id': ''});
    var response = await http.get(uri);
    print(uri);
    if (response.statusCode == 200) {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return CastModel2.fromJson(json);

    }
    throw Exception('error');
  }

}
