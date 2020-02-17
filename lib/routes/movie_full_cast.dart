import 'package:film_catalog/models/actor.dart';
import 'package:film_catalog/models/movie.dart';
import 'package:flutter/material.dart';

class MovieFullCast extends StatelessWidget {
  Movie movie;

  MovieFullCast(this.movie);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    Widget actorCard(Actor actor) {
      return Container(
        width: queryData.size.width * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(
          bottom: 20.0,
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: queryData.size.width * 0.4,
              height: queryData.size.width * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(actor.faceImgUrl == ""
                      ? Movie.notFoundMaleImg
                      : actor.faceImgUrl),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: null,
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      actor.name,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      actor.movieName,
                      style: TextStyle(
                        color: Color.fromRGBO(150, 150, 150, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            height: queryData.size.height * 0.1,
            color: Color.fromRGBO(220, 220, 220, 1),
            child: Text(
              "Cast",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: queryData.size.height * 0.9,
            color: Color.fromRGBO(220, 220, 220, 1),
            child: GridView.count(
              padding: EdgeInsets.only(
                top: 20.0,
                left: queryData.size.width * 0.04,
                right: queryData.size.width * 0.04,
              ),
              crossAxisCount: 2,
              childAspectRatio:
                  (queryData.size.width * 0.4 / queryData.size.width * 1.6),
              children: List.generate(movie.cast.length, (index) {
                return Center(
                  child: actorCard(movie.cast[index]),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
