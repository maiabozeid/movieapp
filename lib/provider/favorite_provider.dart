import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:movies_app/api_manager/sharedpref_manager.dart';

import '../models/now_playing.dart';


class FavoriteProvider extends ChangeNotifier {
  final List<Results> _favoriteMovies = SharedPrefsManager.getFavorites();

  UnmodifiableListView<Results> get favoriteMovies =>
      UnmodifiableListView(_favoriteMovies);

  void buttonFavorite(Results movie) {
    if (!isFavorite(movie)) {
      _add(movie);
    } else {
      _remove(movie);
    }
  }

  void _add(Results movie) {
    _favoriteMovies.add(movie);
    SharedPrefsManager.addToFavorites(movie);
    notifyListeners();
  }

  void _remove(Results movie) {
    _favoriteMovies.removeWhere((element) => element.id == movie.id);
    SharedPrefsManager.removeFromFavorites(movie);
    notifyListeners();
  }

  bool isFavorite(Results movie) {
    return _favoriteMovies.any((element) => element.id == movie.id);
  }
}
