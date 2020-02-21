import 'package:film_catalog/routes/movie_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //For manipulating status bar color
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    /*final flutubePlayer = FluTube(
          'https://www.youtube.com/watch?v=SEUtpeQ4v88',
          aspectRatio: 16 / 9,
          autoPlay: true,
          looping: true,
          onVideoStart: () {},
          onVideoEnd: () {},
      );*/

    /*final youtubePlayer = YoutubePlayer(
          source: "https://www.youtube.com/watch?v=pU8-7BX9uxs&t=3s",
          quality: YoutubeQuality.HD,
          aspectRatio: 1/1,
          showThumbnail: true,
      );*/

    return MaterialApp(
      title: 'Movie App Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MovieSelection(),
      //VideoPlayerScreen(),
      /*Container(
          child: Material(
            child: flutubePlayer,
          ),
        ),*/
      /*Container(
          width: 200,
          height: 200,
          child: Material(
            child: youtubePlayer,
          ),
        ),*/
    );
  }
}
