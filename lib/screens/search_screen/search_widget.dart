import 'package:flutter/material.dart';
import '../../../models/now_playing.dart';
import 'package:movies_app/screens/movie_details_screen/movie_details_screen.dart';

class SearchWidget extends StatelessWidget {
    Results results;
    SearchWidget(this.results);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, MovieDetScreen.routeName,arguments: results);
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500' + '${results.posterPath}',
                width: 160,
                height: 120,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(results.title??'',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w400
                    ),
                    ),
                    SizedBox(height: 5,),
                    Text(results.releaseDate??'',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey
                      ),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 18,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text('${results.voteAverage}',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
