import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/now_playing.dart';
import 'package:movies_app/screens/home_movie_screen/home_movie_widget.dart';
import 'package:movies_app/screens/home_movie_screen/popular_tab/popular_tab.dart';
import 'package:movies_app/screens/home_movie_screen/topRated_tab/topRated_tab.dart';
import 'package:movies_app/themes/themes.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../api_manager/api_manager.dart';


class HomeMovieScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          FutureBuilder<NowPlaying>(
            future: ApiManager.nowPlaying(),
            builder:(context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.data?.statusMessage ?? ''));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(color: MyThemeData.lightBlack,),);
              }

            var popularMovie = snapshot.data;
         return CarouselSlider(
             items: popularMovie?.results?.map((result){
               return HomeMovieWidget(result);
             }).toList(),
             options: CarouselOptions(
               height: 270,
               viewportFraction:1.0,
               initialPage: 0,
               enableInfiniteScroll: true,
               reverse: true,
               autoPlay: true,
               autoPlayInterval: Duration(seconds: 5),
               autoPlayAnimationDuration: Duration(milliseconds: 800),
               autoPlayCurve: Curves.fastOutSlowIn,
               scrollDirection: Axis.vertical,
             )
         );
    }
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Container(
              padding: EdgeInsets.all(20),
              color: MyThemeData.lightBlack,
              height: 220,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Upcoming Movies',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: PopularTab(),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Container(
              padding: EdgeInsets.all(20),
              color: MyThemeData.lightBlack,
              height: 250,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Trending',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: TopRatedTab()
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
