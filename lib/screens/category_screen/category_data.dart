import 'package:flutter/material.dart';
import '../../api_manager/api_manager.dart';
import '../../models/categoryResponse.dart';
import 'category_screen_widget.dart';

class CategoryData extends StatelessWidget {
  const CategoryData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CategoryResponse>(
        future: ApiManager.movieCategory(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.data?.statusMessage ?? ''));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.yellow,),);
          }
          var category = snapshot.data;
          return GridView.builder(
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1,
              ),
              itemCount: category?.genres?.length,
              itemBuilder: (context, index) {
                return CategoryScreenWidget(category!.genres![index]);
              }
          );
        }
    );
  }
}
