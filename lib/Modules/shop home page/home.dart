import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Modules/shop%20home%20page/cubit.dart';
import 'package:shopapp/Modules/shop%20home%20page/state.dart';

import '../shopSearch/ShopSearch.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)
    => homecubit()..getProduct()
                  ..getCategory()
                  ..getFav()
                  ..getPrfile(),
      child : BlocConsumer<homecubit , homestate>(
        listener: (context, state) {},
    builder: (context, state) {
          var cubit = homecubit.get(context);
          return Scaffold(
              appBar: AppBar(
                actions: [IconButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ShopSearch(),));
                }, icon: Icon(Icons.search))],
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Ashtry',style: TextStyle(fontSize: 23,fontWeight: FontWeight.w700,fontFamily: 'bein')),
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(items: [
                BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
                BottomNavigationBarItem(icon: Icon(Icons.category),label: 'category'),
                BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'favorite'),
                BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'settings'),
              ],
                currentIndex: cubit.currentindex,
                onTap: (value) {
                  cubit.changeindex(value);
                },
      ),
            body: cubit.scrrens[cubit.currentindex],

    );}));
  }
}
