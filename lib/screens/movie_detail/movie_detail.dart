import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_cast_model.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/models/torrent_model.dart';
import 'package:movie_app/screens/movie_detail/movie_detail_controller.dart';
import 'package:get/get.dart';

class MovieDetail extends StatelessWidget {
  final String id;
  MovieDetail(this.id);
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MovieDetailController(id),
        builder: (MovieDetailController controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text("YTS"),
              backgroundColor: Colors.black87,
            ),
            backgroundColor: Colors.brown.shade900,
            body: ListView(
              children: controller.movieModel == null
                  ? [CircularProgressIndicator()]
                  : [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _movieTitleAndCoverLeft(controller.movieModel),
                            SizedBox(width: 80),
                            _movieRatingAndLikes(controller.movieModel)
                          ],
                        ),
                      ),
                      Divider(height: 10, color: Colors.white),
                      _movieDescription(controller.movieModel),
                      Divider(height: 10, color: Colors.white),
                      _casts(controller.movieModel.castsModelList),
                      Divider(height: 10, color: Colors.white),
                      _torrents(controller.movieModel.torrentModelList,
                          controller.movieModel.runtime.toString()),
                    ],
            ),
          );
        });
  }

  Widget _movieDescription(MovieModel movie) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Summary", style: TextStyle(fontSize: 20, color: Colors.white)),
          SizedBox(height: 15),
          Container(
            child: Text(
              movie.description,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _casts(List<MovieCastModel> casts) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Text("Casts",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
            for (int i = 0; i < casts.length; i++) _cast(casts[i])
          ],
        ));
  }

  Widget _cast(MovieCastModel cast) {
    TextStyle style =
        TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          CircleAvatar(
              backgroundImage: NetworkImage(cast.imageUrl != null
                  ? cast.imageUrl
                  : "https://www.pinclipart.com/picdir/middle/78-780477_about-us-avatar-icon-red-png-clipart.png")),
          SizedBox(width: 10),
          Text(cast.name, style: TextStyle(color: Colors.grey)),
          Text(' as ${cast.characterName}', style: style),
        ],
      ),
    );
  }

  Widget _torrents(List<TorrentModel> torrentList, String runtime) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Text("Torrents",
                style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
          for (int i = 0; i < torrentList.length; i++)
            _torrent(torrentList[i], runtime)
        ],
      ),
    );
  }

  Widget _torrent(TorrentModel torrent, String runtime) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.indigo, borderRadius: BorderRadius.circular(5)),
          // height: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${torrent.quality}.${torrent.type.toUpperCase()}',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Icon(Icons.folder_open, color: Colors.white54),
              SizedBox(width: 6),
              Text(torrent.size,
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ],
          ),
        ),
        SizedBox(width: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.access_time,
              color: Colors.white,
            ),
            SizedBox(width: 6),
            Text(
              '$runtime h',
              style: TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        )
      ],
    );
  }

  Widget _movieTitleAndCoverLeft(MovieModel model) {
    TextStyle style = TextStyle(color: Colors.white, fontSize: 18);
    return Container(
      width: Get.width * 0.45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          Text(model.title, style: style),
          SizedBox(height: 6),
          Text(model.year, style: style),
          SizedBox(height: 10),
          Container(
            child: Image.network(
              model.cover,
              width: Get.width * 0.45,
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _movieRatingAndLikes(MovieModel model) {
    TextStyle style = TextStyle(color: Colors.white, fontSize: 18);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(height: 15),
        Row(children: [
          Icon(Icons.star, color: Colors.yellow),
          SizedBox(width: 18),
          Text(model.rating.toString(), style: style),
        ]),
        SizedBox(height: 5),
        Row(children: [
          Icon(Icons.favorite, color: Colors.red),
          SizedBox(width: 18),
          Text(model.likes.toString(), style: style),
        ]),
      ],
    );
  }
}
