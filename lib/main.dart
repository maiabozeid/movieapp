import 'package:flutter/material.dart';
import 'package:movies_app/api_manager/sharedpref_manager.dart';
import 'package:movies_app/screens/category_list_screen/category_list_screen.dart';
import 'package:movies_app/screens/home_screen.dart';
import 'package:movies_app/screens/movie_details_screen/movie_details_screen.dart';
import 'package:movies_app/splash_screen.dart';
import 'package:movies_app/themes/themes.dart';
import 'package:provider/provider.dart';

import 'provider/favorite_provider.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefsManager().initPrefs();
  runApp(ChangeNotifierProvider<FavoriteProvider>(
    create: (context) => FavoriteProvider(),
    child: const MyApp(),
  ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen2Sub.routeName,
      routes: {
        SplashScreen2Sub.routeName:(_)=>SplashScreen2Sub(),
          HomeScreen.routeName:(_)=>HomeScreen(),
        MovieDetScreen.routeName:(_)=>MovieDetScreen(),
        CategoryListScreen.routeName:(_)=>CategoryListScreen(),
      },
      theme: MyThemeData.appTheme,

    );
  }
}
