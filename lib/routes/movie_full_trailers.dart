import 'package:film_catalog/funtional/custom_video_player.dart';
import 'package:film_catalog/models/movie.dart';
import 'package:flutter/material.dart';

class MovieFullTrailers extends StatelessWidget {
  Movie movie;

  MovieFullTrailers(this.movie);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    Widget bigTrailersCard(String videoUrl) {
      return Container(
        margin: EdgeInsets.only(
          bottom: 15.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.black,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black38,
              blurRadius: 5.0,
            ),
          ],
        ),
        height: 230.0,
        child: VideoPlayerScreen.custom(
          videoUrl,
          VideoPlayerScreenInfo.from_assets_folder,
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: queryData.size.height * 0.2,
            width: queryData.size.width,
            color: Color.fromRGBO(220, 220, 220, 1),
            child: Text(
              "Trailers",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              ),
          ),
          Container(
            height: queryData.size.height * 0.8,
            width: double.infinity,
            color: Color.fromRGBO(220, 220, 220, 1),
            child: ListView.builder(
              padding: EdgeInsets.only(
                top: 20.0,
                left: 20.0,
                right: 20.0,
              ),
              itemCount: movie.videos.length,
              itemBuilder: (BuildContext context, int index) {
                return bigTrailersCard(movie.videos[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
