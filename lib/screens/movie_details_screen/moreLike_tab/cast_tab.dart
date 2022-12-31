import 'package:flutter/material.dart';
import '../../../api_manager/api_manager.dart';
import '../../../models/CastModel2.dart';
import 'package:movies_app/screens/movie_details_screen/moreLike_tab/cast_widget.dart';

class CastTab extends StatefulWidget {
  static const String routeName= ' build';
  int id;
  Cast cast;
  CastTab(this.id,this.cast);

  @override
  State<CastTab> createState() => _CastTabState();
}

class _CastTabState extends State<CastTab> {

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<CastModel2>(
        future: ApiManager.castModel(widget.id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.data?.statusMessage ?? ''));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.yellow,),);
          }
          var likeMovies = snapshot.data;
          return ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                  onTap: (){
                    widget.cast = likeMovies!.cast![index];
                    setState(() {

                    });
                  },
                  child: MoreLikeWidget(likeMovies!.cast![index])),
              itemCount: likeMovies?.cast?.length
          );
        }
    );
  }
}
