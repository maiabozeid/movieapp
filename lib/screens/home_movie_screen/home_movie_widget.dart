import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/now_playing.dart';

class HomeMovieWidget extends StatelessWidget {

  Results results;
HomeMovieWidget(this.results);

  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
        child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
           Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                  'https://image.tmdb.org/t/p/w500' + '${results.backdropPath}',
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                    padding: EdgeInsets.only(left: 155),
                    child: Text(
                      results.title??'',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyMedium,
                    )),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.only(left: 155),
                  child: Text(
                      results.releaseDate??'',
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.grey)),
                ),
              ],
            ),
          
          Positioned(
            left: 10,
            child: Image.network(
              'https://image.tmdb.org/t/p/w500' + '${results.posterPath}',
              width: 125,
              height: 200,
            ),
          ),
        ],
    ),
      );
  }
}
