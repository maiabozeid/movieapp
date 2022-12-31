import 'package:flutter/material.dart';
import 'package:movies_app/models/searchRespnse.dart';
import 'package:movies_app/screens/search_screen/search_widget.dart';
import '../../api_manager/api_manager.dart';

class SearchDelegateScreen extends SearchDelegate {

  @override
  // TODO: implement textInputAction
  TextInputAction get textInputAction => TextInputAction.search;

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        toolbarHeight: 100,
        color: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        elevation: 0,
      ),
      scaffoldBackgroundColor: Colors.black,
      inputDecorationTheme: searchFieldDecorationTheme ??
          InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(60),
                borderSide: BorderSide(color: Colors.black)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(60),
                borderSide: BorderSide(color: Colors.black)),
            fillColor: Colors.white,
            hintStyle: TextStyle(color: Colors.black),
            filled: true,
          ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      Icon(Icons.search,size: 35,color: Colors.white,)
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: () {
      Navigator.pop(context);
    }, icon: Icon(Icons.clear,size: 35,color: Colors.white,));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text('');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    if (query.isEmpty) {
      return Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.local_movies,size: 150,color: Colors.grey,),
          Text('No movies found',
          style: Theme.of(context).textTheme.titleSmall
          )
        ],
      ));
    }
    return FutureBuilder<SearchResponse>(
      future: ApiManager.searchMovie(query),
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return Center(child: Text(snapshot.data?.statusMessage??''));
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(color: Colors.yellow,),);
        }
        var searchData = snapshot.data;
        return ListView.separated(
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(height: 2,color: Colors.grey,),
          ),
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => SearchWidget(searchData!.results![index]),
            itemCount: searchData!.results!.length
        );
      },

    );
  }
}
