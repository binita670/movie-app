import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/screens/movie_detail/movie_detail.dart';
import 'package:get/get.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;
  MovieCard({@required this.movie});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(MovieDetail(movie.id));
      },
      child: Container(
        width: Get.width * 0.45,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.network(
                movie.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(movie.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white, fontSize: 18)),
            SizedBox(height: 4),
            Text(movie.year, style: TextStyle(color: Colors.white38)),
          ],
        ),
      ),
    );
  }
}
