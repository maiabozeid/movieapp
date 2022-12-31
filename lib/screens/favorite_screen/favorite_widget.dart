import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:movies_app/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

import '../../models/now_playing.dart';
import '../movie_details_screen/movie_details_screen.dart';


class FavoriteWidget extends StatelessWidget {
late Results movie;
bool isSelected = true;


FavoriteWidget(this.movie);

  @override
  Widget build(BuildContext context) {

    return  Row(
        children: [
           Image.network(
              'https://image.tmdb.org/t/p/w500' +'${movie.posterPath}',
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            ),


          SizedBox(
            width: 10,
          ),
         Expanded(
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.title??'',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w500)),
                    Text(
                      movie.releaseDate??'',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      'Rating: ${movie.voteAverage}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),

    ),
             ),


Consumer<FavoriteProvider>(
builder: (context, controler, _) {
    return IconButton(
    onPressed: () {
    controler.buttonFavorite(movie);

    }, icon:Icon(Icons.remove,color: Colors.white,));}
)
    ]);



  }
}








