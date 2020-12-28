import 'package:flutter/material.dart';
import 'package:movie_app/screens/movies_list/movies_list_controller.dart';
import 'package:get/get.dart';

class MoviesList extends StatelessWidget {
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MoviesListController(),
        builder: (MoviesListController controller) => Scaffold(
              appBar: AppBar(
                title: Text("YTS.MX"),
                backgroundColor: Colors.black87,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      color: Colors.amber,
                      child: IconButton(
                          splashColor: Colors.grey,
                          icon: Icon(Icons.navigate_before),
                          onPressed: () {
                            controller.decrementPage();
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      color: Colors.green,
                      child: IconButton(
                          icon: Icon(Icons.navigate_next),
                          onPressed: () {
                            controller.incrementPage();
                          }),
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.brown.shade900,
              body: ListView(
                children: [
                  SizedBox(height: 20),
                  Text("YTS. Movies At Great Size",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  SizedBox(height: 20),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        runSpacing: 20,
                        spacing: 10,
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: controller.movieCards,
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
