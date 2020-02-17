import 'package:flutter/material.dart';
import 'package:film_catalog/models/movie.dart';

class SelectedMovieFullscreenCover extends StatelessWidget {
  final Movie movie;

  SelectedMovieFullscreenCover(this.movie);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Hero(
      tag: movie.url,
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.delta.dy < 0) {
            Navigator.pop(context);
          }
        },
        child: Container(
          height: queryData.size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(movie.url),
            ),
            shape: BoxShape.rectangle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
