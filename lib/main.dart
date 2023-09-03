

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Shared/Network/local/shared_helper.dart';

import 'Modules/on Bording.dart';
import 'Modules/shop home page/home.dart';
import 'Modules/shopping login screen/cubit.dart';
import 'Modules/shopping login screen/shopping login screen.dart';
import 'Modules/shopping login screen/states.dart';
import 'Shared/Network/remot/dio.dart';
import 'Shared/componants/constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
 await sharedhelper.init();
  bool OnBording = sharedhelper.getData(key: 'onBording')??false;
  bool toke = sharedhelper.getData(key: 'toke')??false;
  Widget widget ;
  print('=====================================');
  print(token);
  if(OnBording == true ){
    if(toke == true ) {
     widget = Home();
    }else{
      widget = ShopLogin();
    }
  }else{
    widget = OnBordingScrren();
  }
  runApp( MyApp(StartWidget:widget,));
}

class MyApp extends StatelessWidget {
  MyApp({this.StartWidget});
  final StartWidget;



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => logincubit(),
      child: BlocConsumer<logincubit , loginstates>(
       listener: (context, state) {},
       builder: (context, state) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme:DarkTheme,
        themeMode: ThemeMode.light,
        home: StartWidget,
      )
    ));
  }
}
