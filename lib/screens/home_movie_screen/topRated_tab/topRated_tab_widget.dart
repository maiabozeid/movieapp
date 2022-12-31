import 'package:flutter/material.dart';
import 'package:movies_app/models/topRatedResponse.dart';
import 'package:movies_app/screens/movie_details_screen/movie_details_screen.dart';

import '../../../models/now_playing.dart';

class TopRatedWidget extends StatelessWidget {
  Results results;
  TopRatedWidget(this.results);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      InkWell(
        onTap: (){
          Navigator.pushNamed(context, MovieDetScreen.routeName,arguments: results);
        },
        child: Row(
          children: [
            Column(
              children: [
                Image.network(
                  'https://image.tmdb.org/t/p/w500' + '${results.posterPath}',
                  width: 100,
                  height: 114,
                  fit: BoxFit.fill,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFF343534),
                  ),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 13,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text('${results.voteAverage}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(results.title??'',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall),
                      SizedBox(
                        height: 5,
                      ),
                      Text(results.releaseDate??'',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                              color: Colors.grey))
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
      ),
      Positioned(
          right: 85,
          bottom: 139,
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bookmark_add,
                color: Colors.grey,
                size: 35,
              )))
    ]);
  }
}

