import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/favorite_provider.dart';
import 'favorite_widget.dart';


class FavoriteScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Favorites',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            Consumer<FavoriteProvider>(
              builder: (context, controller, _) {
                if (controller.favoriteMovies.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: controller.favoriteMovies.length,
                      itemBuilder: (context, index) {
                        return FavoriteWidget(
                          controller.favoriteMovies[index],
                        );
                      },
                    ),
                  );
                } else {
                  return const Expanded(
                    child: Center(
                      child: Text(
                        'Add movies to your favorites list',
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}









//     return Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 20),
//    child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//             margin: EdgeInsets.only(top: 60),
//             child: Text(
//              'Watchlist',
//              style: Theme.of(context).textTheme.bodyLarge,
//             ),
//           ),
//          Expanded(
//            child: ListView.separated(
//               physics: BouncingScrollPhysics(),
//              separatorBuilder: (context, index) => Divider(height: 2, color: Colors.grey,),
//              itemCount: 20,
//               itemBuilder: (context, i)=> WatchlistWidget(),
//          ),
//           )
//        ],
//      ),
//      );
//   }
// }
//
