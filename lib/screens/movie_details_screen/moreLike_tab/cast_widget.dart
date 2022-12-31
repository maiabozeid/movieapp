import 'package:flutter/material.dart';
import '../../../models/CastModel2.dart';
import '../../../models/now_playing.dart';

class MoreLikeWidget extends StatelessWidget {
  Cast cast;
  MoreLikeWidget(this.cast);
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Row(
        children: [
          Column(children: [
            Image.network(
              'https://image.tmdb.org/t/p/w500' + '${cast.profilePath}',
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(cast.name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    cast.character ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ]),
          SizedBox(
            width: 15,
          )
        ],
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
