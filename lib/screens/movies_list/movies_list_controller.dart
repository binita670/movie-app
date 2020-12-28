import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/screens/movie_card.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart';

class MoviesListController extends GetxController {
  List<Widget> _movieCards = [CircularProgressIndicator()];
  List<Widget> get movieCards => _movieCards;
  int _page = 1;

  MoviesListController() {
    getMovies();
  }

  void incrementPage() async {
    _page++;
    getMovies();
  }

  void decrementPage() async {
    if (_page > 1) {
      _page--;
      getMovies();
    }
  }

  Future<void> getMovies() async {
    String url = "https://yts.mx/api/v2/list_movies.json?page=$_page";
    Response res = await get(url);
    List moviesList = jsonDecode(res.body)["data"]["movies"];
    List<Widget> tempList = [];
    for (int i = 0; i < moviesList.length; i++) {
      MovieModel model = MovieModel(
          id: moviesList[i]["id"].toString(),
          cover: moviesList[i]["medium_cover_image"],
          title: moviesList[i]["title"],
          year: moviesList[i]["year"].toString());
      tempList.add(MovieCard(movie: model));
    }
    _movieCards = tempList;
    update();
  }
}
