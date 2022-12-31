import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/now_playing.dart';

class SharedPrefsManager {
  static late SharedPreferences _preferences;
  static String favoritesKey = 'favorites';


  void initPrefs() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static void addToFavorites(Results movie) {
    var currentFavorites = _getPrefsFavorites();

    currentFavorites.add(json.encode(movie.toJson()));
    _preferences.setStringList(favoritesKey, currentFavorites);
  }

  static void removeFromFavorites(Results movie) {
    var currentFavorites = _getPrefsFavorites();

    currentFavorites.remove(json.encode(movie.toJson()));
    _preferences.setStringList(favoritesKey, currentFavorites);
  }

  static List<String> _getPrefsFavorites() {
    return _preferences.getStringList(favoritesKey) ?? [];
  }

  static List<Results> getFavorites() {
    var favorites =
        _getPrefsFavorites().map((item) => json.decode(item)).toList();
    favorites = favorites.map((item) => Results.fromJson(item)).toList();

    return favorites as List<Results>;
  }
}
