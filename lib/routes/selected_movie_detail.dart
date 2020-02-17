import 'package:flutter/material.dart';
import 'package:film_catalog/models/movie.dart';
import 'package:film_catalog/routes/selected_movie_fullscreen_cover.dart';
import 'package:film_catalog/routes/selected_movie_more_detail.dart';

class SelectedMovieDetail extends StatefulWidget {
  final Movie movie;
  SelectedMovieDetail(this.movie);

  @override
  _SelectedMovieDetail createState() => _SelectedMovieDetail(movie);
}

class _SelectedMovieDetail extends State<SelectedMovieDetail> {
  Movie movie;

  _SelectedMovieDetail(this.movie);

  PageController _pageController;

  List<Widget> starList = new List(5);

  Color textColor = Color.fromRGBO(150, 150, 150, 1);

  bool isBookmarked = false;

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    _pageController = PageController(initialPage: 0);

    final movieCover = Hero(
      tag: movie.url,
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.delta.dy > 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SelectedMovieFullscreenCover(movie)),
            );
          }
        },
        child: Container(
          height: queryData.size.height * 0.75,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(movie.url),
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
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

    final starEmpty = Container(
      margin: EdgeInsets.only(
        right: 3.0,
      ),
      child: Icon(
        Icons.star_border,
        color: textColor,
      ),
    );

    final starHalf = Container(
      margin: EdgeInsets.only(
        right: 3.0,
      ),
      child: Icon(
        Icons.star_half,
        color: textColor,
      ),
    );

    final star = Container(
      margin: EdgeInsets.only(
        right: 3.0,
      ),
      child: Icon(
        Icons.star,
        color: textColor,
      ),
    );

    //From 0 - 10 to get star values
    List<Widget> getPlaceStars(int starNum) {
      double finalStars;
      List<Widget> filledList = new List();
      bool oneHalfAdded = false;

      if (starNum % 2 == 0) {
        // even
        finalStars = starNum / 2;

        for (int i = 0; i < 5; i++) {
          if (i < finalStars)
            filledList.add(star);
          else
            filledList.add(starEmpty);
        }
      } else {
        // odd
        finalStars = (starNum / 2) - 1;

        if (starNum > 0) {
          if (starNum - 1 > 0) {
            for (int i = 0; i < 5; i++) {
              if (i < finalStars) {
                filledList.add(star);
              } else {
                if (!oneHalfAdded) {
                  filledList.add(starHalf);
                  oneHalfAdded = true;
                } else {
                  filledList.add(starEmpty);
                }
              }
            }
          } else {
            for (int i = 0; i < 5; i++) {
              if (!oneHalfAdded) {
                filledList.add(starHalf);
                oneHalfAdded = true;
              } else {
                filledList.add(starEmpty);
              }
            }
          }
        }
      }

      return filledList;
    }

    starList = getPlaceStars(movie.rating.floor());

    final starListHolder = Container(
      child: Row(
        children: <Widget>[
          /*star, star, star, star, star_empty*/
          starList.elementAt(0),
          starList.elementAt(1),
          starList.elementAt(2),
          starList.elementAt(3),
          starList.elementAt(4),
        ],
      ),
    );

    final imdbText = Container(
      decoration: BoxDecoration(
        border: Border.all(color: textColor),
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: Text(
        " IMDb ",
        style: TextStyle(
          color: textColor,
          fontSize: 15.0,
        ),
      ),
    );

    final ratingText = Hero(
      tag: movie.rating,
      child: Container(
        child: Material(
          color: Colors.transparent,
          child: Row(
            children: <Widget>[
              imdbText,
              Text(
                " " + movie.rating.toString(),
                style: TextStyle(
                  color: textColor,
                  fontSize: 15.0,
                ),
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );

    final ratingDescription = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ratingText,
          starListHolder,
        ],
      ),
    );

    void bookmarkAction() {
      setState(() {
        isBookmarked = !isBookmarked;
      });
    }

    final nameDescription = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Hero(
          tag: movie.name,
          child: Container(
            width: queryData.size.width * 0.75,
            margin: EdgeInsets.only(
              top: 3.0,
            ),
            child: Material(
              color: Colors.transparent,
              child: Text(
                movie.name,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            bookmarkAction();
          },
          icon: Icon(
            isBookmarked ? Icons.bookmark : Icons.bookmark_border,
            color: textColor,
            size: 30.0,
          ),
        ),
      ],
    );

    final genreDescription = Hero(
      tag: movie.genres[0],
      child: Container(
        margin: EdgeInsets.only(
          top: 3.0,
        ),
        child: Material(
          color: Colors.transparent,
          child: Text(
            movie.getGenresList(),
            style: TextStyle(
              color: textColor,
              fontSize: 15.0,
            ),
            maxLines: 1,
          ),
        ),
      ),
    );

    Widget moreInfoDescription(Movie movie) {
      String description = movie.country +
          (", ") +
          movie.releaseDate +
          (" / ") +
          movie.duration +
          (" / ") +
          movie.clasification;

      return Container(
        margin: EdgeInsets.only(
          top: 3.0,
        ),
        child: Text(
          description,
          style: TextStyle(
            color: textColor,
            fontSize: 15.0,
          ),
          maxLines: 1,
        ),
      );
    }

    final backBtn = Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        margin: EdgeInsets.only(
          top: 10.0,
        ),
        width: 56.0,
        height: 56.0,
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: textColor,
          icon: Icon(Icons.arrow_back),
        ),
      ),
    );

    final movieDescription = Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: 25.0,
        left: 20.0,
        right: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ratingDescription,
          nameDescription,
          genreDescription,
          moreInfoDescription(movie),
          backBtn,
        ],
      ),
    );

    final selectedMovieDetail = Material(
      type: MaterialType.transparency,
      child: Container(
        width: double.infinity,
        color: Color.fromRGBO(220, 220, 220, 1),
        child: Column(
          children: <Widget>[
            movieCover,
            movieDescription,
          ],
        ),
      ),
    );

    return PageView(
      scrollDirection: Axis.vertical,
      controller: _pageController,
      children: <Widget>[
        selectedMovieDetail,
        SelectedMovieMoreDetail(movie),
      ],
    );
  }
}
