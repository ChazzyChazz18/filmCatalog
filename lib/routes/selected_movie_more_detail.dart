import 'package:film_catalog/funtional/ChazzToast.dart';
import 'package:film_catalog/funtional/custom_video_player.dart';
import 'package:film_catalog/models/actor.dart';
import 'package:film_catalog/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'movie_full_cast.dart';

class SelectedMovieMoreDetail extends StatelessWidget {
  final Movie movie;

  SelectedMovieMoreDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    /* DETAILS */

    final story = Container(
      margin: EdgeInsets.only(
        top: 30.0,
        left: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Story",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 15.0,
              right: 20.0,
            ),
            child: Text(
              movie.summary,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );

    Widget castCard2(Actor actor) {
      return Container(
        margin: EdgeInsets.only(
          right: 8.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.white,
        ),
        height: 80.0,
        width: 250.0,
        child: Row(
          children: <Widget>[
            Container(
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
                    offset: Offset(3.0, 0),
                  ),
                ],
              ),
              height: 80.0,
              width: 80.0,
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

    final cast = Container(
      margin: EdgeInsets.only(
        top: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MovieFullCast(movie)),
                );
              },
              child: Container(
                padding: EdgeInsets.only(
                  top: 20.0,
                  bottom: 10.0,
                ),
                //color: Colors.green,
                margin: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Cast",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Full Cast >",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color.fromRGBO(150, 150, 150, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: queryData.size.width,
            height: 80.0,
            child: ListView.builder(
              padding: EdgeInsets.only(
                left: 20.0,
                right: 8.0,
              ),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return castCard2(movie.cast[index]);
              },
            ),
          ),
        ],
      ),
    );

    Widget trailersCard2(String videoUrl) {
      return Container(
        margin: EdgeInsets.only(
          right: 15.0,
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
        width: 250.0,
        child: VideoPlayerScreen.custom(
          videoUrl,
          VideoPlayerScreenInfo.from_assets_folder,
        ),
      );
    }

    final noTrailers = Container(
      alignment: Alignment.center,
      width: queryData.size.width * 0.9,
      child: Text(
        "No trailers available",
        style: TextStyle(
          fontSize: 18.0,
          color: Color.fromRGBO(150, 150, 150, 1),
        ),
      ),
    );

    final trailers = Container(
      margin: EdgeInsets.only(
        top: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                if (movie.videos.length == 0) {
                  ChazzToast.show("No videos to display");
                } else {}
              },
              child: Container(
                padding: EdgeInsets.only(
                  top: 20.0,
                  bottom: 15.0,
                ),
                margin: EdgeInsets.only(
                  right: 20.0,
                  left: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Trailers",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "More Videos >",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color.fromRGBO(150, 150, 150, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: queryData.size.width,
            height: 160.0,
            margin: EdgeInsets.only(
              bottom: 20.0,
            ),
            child: ListView.builder(
              padding: EdgeInsets.only(
                left: 20.0,
              ),
              itemCount: movie.videos.length == 0 ? 1 : movie.videos.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                if (movie.videos.length != 0) {
                  return trailersCard2(movie.videos[index]);
                } else {
                  return noTrailers;
                }
              },
            ),
          ),
        ],
      ),
    );

    final detailsPage = SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            story,
            cast,
            trailers,
          ],
        ),
      ),
    );

    final appBar2 = PreferredSize(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 80.0,
        ),
        child: TabBar(
          unselectedLabelColor: Colors.grey,
          indicatorPadding: EdgeInsets.only(left: 30, right: 30),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Colors.blue,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black38,
                blurRadius: 5.0,
              ),
            ],
          ),
          tabs: [
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Showtimes",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Details",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
      preferredSize: Size.fromHeight(100.0),
    );

    final tabs = Container(
      child: DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
          backgroundColor: Color.fromRGBO(220, 220, 220, 1),
          appBar: appBar2,
          //appBar: appBar,
          body: Container(
            color: Color.fromRGBO(220, 220, 220, 1),
            child: TabBarView(
              children: [
                Container(
                  //Showtimes
                  child: Icon(Icons.apps),
                ),
                Container(
                  //Details
                  child: detailsPage,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    return Container(
      color: Color.fromRGBO(220, 220, 220, 1),
      width: double.infinity,
      child: tabs,
    );
  }
}
