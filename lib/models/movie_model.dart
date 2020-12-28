import 'package:movie_app/models/movie_cast_model.dart';
import 'package:movie_app/models/torrent_model.dart';

class MovieModel {
  final String id, cover, title, year, description, rating;
  final int runtime, likes;
  final List<TorrentModel> torrentModelList;
  final List<MovieCastModel> castsModelList;
  MovieModel(
      {this.id,
      this.cover,
      this.title,
      this.year,
      this.description,
      this.rating,
      this.runtime,
      this.likes,
      this.torrentModelList,
      this.castsModelList});
}
