import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/now_playing.dart';
import 'package:movies_app/screens/movie_details_screen/moreLike_tab/cast_tab.dart';
import 'package:readmore/readmore.dart';

import '../../models/CastModel2.dart';
import '../../provider/favorite_provider.dart';
import '../../themes/themes.dart';

class MovieDetScreen extends StatefulWidget {
  static const String routeName = 'movieDet';

  @override
  State<MovieDetScreen> createState() => _MovieDetScreenState();
}

class _MovieDetScreenState extends State<MovieDetScreen> {
  bool isSelected = true;
  late Cast cast = Cast();

  @override
  Widget build(BuildContext context) {
    Results results = ModalRoute.of(context)?.settings.arguments as Results;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          results.title ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          Consumer<FavoriteProvider>(
            builder: (context, controler, _) {
              return IconButton(
                onPressed: () {
                  if (isSelected == true) {
                    controler.buttonFavorite(results);
                  }
                },
                icon: controler.isFavorite(results)
                    ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.network(
            'https://image.tmdb.org/t/p/w500' + '${results.backdropPath}',
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                results.title ?? '',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                results.releaseDate ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Stack(children: [
                  Image.network(
                    'https://image.tmdb.org/t/p/w500' + '${results.posterPath}',
                    width: 130,
                    height: 180,
                    fit: BoxFit.fill,
                  ),
                ]),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ReadMoreText(
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontSize: 15),
                        results.overview ?? '',
                        trimLines: 7,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        moreStyle: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontSize: 15, color: Colors.yellow),
                        lessStyle: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontSize: 15, color: Colors.yellow),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 18,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text('Rating: ${results.voteAverage}',
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.reviews,
                            color: Colors.yellow,
                            size: 18,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text('Reviews : ${results.voteCount}',
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: MyThemeData.lightBlack,
              padding: EdgeInsets.all(3),
              height: 250,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Cast',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: CastTab(cast.id ?? 0, cast),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
