import 'package:film_catalog/tests/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:film_catalog/models/movie.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:film_catalog/routes/selected_movie_detail.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class MovieSelection extends StatefulWidget {
  @override
  _MovieSelection createState() => _MovieSelection();
}

class _MovieSelection extends State<MovieSelection> {
  //PageController _pageController;
  int indexTap = 0;
  int viewPageIndex = 0;

  Color textColor = Color.fromRGBO(150, 150, 150, 1);

  GlobalKey<AutoCompleteTextFieldState<Movie>> key = new GlobalKey();

  Movie selected;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    //_pageController = PageController(initialPage: 0, viewportFraction: 0.9);

    //Initialized Widgets
    final customSearch = Container(
      margin: EdgeInsets.only(
        top: 40.0,
        bottom: 10.0,
        left: 20.0,
        right: 20.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(32)),
      ),
      child: AutoCompleteTextField<Movie>(
        key: key,
        suggestions: DummyData.dummyMoviesList,
        itemFilter: (item, query) {
          return item.name.toLowerCase().startsWith(
                query.toLowerCase(),
              );
        },
        itemBuilder: (context, suggestion) => new Container(
          child: new ListTile(
            title: new Text(suggestion.name),
          ),
        ),
        itemSubmitted: (item) => setState(() => selected = item),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            top: 10.0,
            left: 20.0,
          ),
          hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
          hintText: 'Search',
          suffixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          border: InputBorder.none,
        ), itemSorter: null,
      ),
      /*TextField(
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
          hintText: 'Search',
          suffixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          border: InputBorder.none,
        ),
      ),*/
    );

    final appBar = Container(
      width: double.infinity,
      height: 96,
      color: Color.fromRGBO(220, 220, 220, 1),
      child: customSearch,
    );

    final titleText = Container(
      margin: EdgeInsets.only(
        top: 8.0,
        left: 20.0,
      ),
      child: Text(
        "Now Playing",
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    Widget movieCard2(Movie movie) {
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SelectedMovieDetail(movie)),
          );
        },
        child: Hero(
          tag: movie.url,
          child: Container(
            width: queryData.size.width * 0.8,
            margin: EdgeInsets.only(
              left: queryData.size.width * 0.025,
              right: queryData.size.width * 0.025,
              top: 10.0,
              bottom: 10.0,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(movie.url),
              ),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              shape: BoxShape.rectangle,
              //color: Colors.indigo,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 5.0,
                )
              ],
            ),
            child: null,
          ),
        ),
      );
    }

    void _onPageViewPageChanged(int index) {
      setState(() {
        viewPageIndex = index;
      });
    }

    final carrousel = Expanded(
      child: Container(
        margin: EdgeInsets.only(
          top: 8.0,
        ),
        child: CarouselSlider.builder(
          height: queryData.size.height * 0.7,
          viewportFraction: 0.85,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          itemCount: DummyData.dummyMoviesList.length,
          itemBuilder: (context, index) {
            return movieCard2(DummyData.dummyMoviesList[index]);
          },
          onPageChanged: _onPageViewPageChanged,
        ),
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

    final movieDescription = Container(
      margin: EdgeInsets.only(
        top: 5.0,
        left: queryData.size.width * 0.1,
        right: queryData.size.width * 0.1,
        bottom: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Hero(
            tag: DummyData.dummyMoviesList[viewPageIndex].rating,
            child: Container(
              child: Material(
                color: Colors.transparent,
                child: Row(
                  children: <Widget>[
                    imdbText,
                    Text(
                      " " +
                          DummyData.dummyMoviesList[viewPageIndex].rating
                              .toString(),
                      style: TextStyle(
                        color: Color.fromRGBO(150, 150, 150, 1),
                        fontSize: 15.0,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Hero(
            tag: DummyData.dummyMoviesList[viewPageIndex].name,
            child: Container(
              margin: EdgeInsets.only(
                top: 2.0,
              ),
              child: Material(
                color: Colors.transparent,
                child: Text(
                  DummyData.dummyMoviesList[viewPageIndex].name,
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
          Hero(
            tag: DummyData.dummyMoviesList[viewPageIndex].genres[0],
            child: Container(
              margin: EdgeInsets.only(
                top: 2.0,
              ),
              child: Material(
                color: Colors.transparent,
                child: Text(
                  DummyData.dummyMoviesList[viewPageIndex].getGenresList(),
                  style: TextStyle(
                    color: Color.fromRGBO(150, 150, 150, 1),
                    fontSize: 15.0,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );

    final body = Expanded(
      child: Container(
        color: Color.fromRGBO(220, 220, 220, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            titleText,
            carrousel,
            movieDescription,
          ],
        ),
      ),
    );

    void onTapTapped(int index) {
      setState(() {
        indexTap = index;
      });
    }

    final buttomNavigationBar = BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: false,
      onTap: onTapTapped,
      currentIndex: indexTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.trending_up),
          title: Text("Trending"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_movies),
          title: Text("Movie List"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          title: Text("Bookmark"),
        ),
      ],
    );

    //need to return a Scaffold to use TextInput...
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: queryData.size.height,
          child: Column(
            children: <Widget>[appBar, body, buttomNavigationBar],
          ),
        ),
      ),
    );
  }
}
