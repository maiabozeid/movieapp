import 'package:flutter/material.dart';
import '../../../models/now_playing.dart';

class CastTabWidget extends StatelessWidget {
  Results results;
  CastTabWidget(this.results);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Row(
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/w500' + '${results.posterPath}',
            width: 100,
            height: 150,
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      Positioned(
          right: 85,
          bottom: 108,
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
