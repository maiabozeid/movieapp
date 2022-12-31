import 'package:flutter/material.dart';
import 'package:movies_app/models/categoryResponse.dart';
import 'package:movies_app/screens/category_list_screen/category_list_screen.dart';

class CategoryScreenWidget extends StatelessWidget {
  Genres category;
  CategoryScreenWidget(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, CategoryListScreen.routeName,arguments: category);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://cdn.dribbble.com/users/21415/screenshots/4427509/media/9a9e75e884083bfdcc8c86af8e4cc879.jpg?compress=1&resize=400x300',
                  width: 180,
                  height: 140,
                  fit: BoxFit.fill,
                )),
            Container(
              color: Color.fromRGBO(1, 1, 1, 0.5),
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              child: Text(
                category.name??'',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
