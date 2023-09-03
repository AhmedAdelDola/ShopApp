import 'package:flutter/material.dart';
import 'package:shopapp/Models/LogoutModel.dart';
import 'package:shopapp/Models/Product%20Model.dart';
import 'package:shopapp/Models/SearchModel.dart';
import 'package:shopapp/Models/favmodel.dart';
import 'package:shopapp/Shared/Network/local/shared_helper.dart';
import '../../Models/Categories Model.dart';
import '../../Models/ProfileModel.dart';
import '../../Models/change fav model.dart';
import '../Styles.dart';

String token = sharedhelper.getData(key: 'token')?? '' ;
ThemeData lightTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.red),
            elevation: MaterialStatePropertyAll(20),
            padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
            textStyle: MaterialStatePropertyAll(TextStyle(fontFamily: AutofillHints.name,fontSize: 20,)),
            alignment: Alignment.center,

            shape: MaterialStatePropertyAll(ContinuousRectangleBorder(borderRadius: BorderRadius.circular(40)))

        )
    ),
    fontFamily:'bein' ,
    primaryColor: defualtcolor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      foregroundColor: Colors.black,

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.red,),
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: defualtcolor)
);

ThemeData DarkTheme =ThemeData(
    fontFamily:'bein' ,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.deepOrange),
            elevation: MaterialStatePropertyAll(20),
            padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
            textStyle: MaterialStatePropertyAll(TextStyle(fontFamily: AutofillHints.name,fontSize: 20,)),
            alignment: Alignment.center,

            shape: MaterialStatePropertyAll(ContinuousRectangleBorder(borderRadius: BorderRadius.circular(40)))

        )
    ),
    primaryColor: defualtcolor,
    appBarTheme: AppBarTheme(
      color: Colors.black45,
      elevation: 0.0,
      foregroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black45,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.red,),
    scaffoldBackgroundColor: Colors.black45,
    textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: defualtcolor)
);


Products product = Products();
Catogry catogry = Catogry();
ChangeFav changefav = ChangeFav();
Fav fav = Fav() ;
Search search = Search() ;
Profile profile = Profile() ;
LogOut logOut = LogOut() ;