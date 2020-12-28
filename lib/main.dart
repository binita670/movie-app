import 'package:flutter/material.dart';
import 'package:movie_app/screens/movies_list/movies_list.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    home: MoviesList(),
    debugShowCheckedModeBanner: false,
  ));
}
