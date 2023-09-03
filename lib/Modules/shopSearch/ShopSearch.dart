import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shopapp/Models/SearchModel.dart';
import '../../Shared/componants/constants.dart';
import '../shop home page/cubit.dart';
import '../shop home page/state.dart';

class ShopSearch extends StatelessWidget {
  const ShopSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => homecubit(),
      child: BlocConsumer<homecubit,homestate>(
        listener: (context, state) {
          if(state is addfavSucess1){
            if(changefav.status == true){
              MotionToast.success(
                description: Text('${changefav.message}'),
              ).show(context);
            }
          }
        },
        builder: (context, state) {
          var cubit = homecubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back_ios)),
            ),
            body:Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 8),
                  child: TextFormField(onChanged: (value) {
                    cubit.Searchs(value);
                  },
                      decoration:InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          label: Text('Search'),
                          contentPadding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 8)
                      )
                  ),
                ),
                Expanded(
                  child: ConditionalBuilder(
                    condition: search.data != null ,
                    builder: (context) => ListView.builder(
                      itemBuilder: (BuildContext context, int index) => searchitem(search.data?.data,context,index,cubit),
                      itemCount: search.data?.data?.length,
                    ),
                    fallback: (context) => const Center(child: CircularProgressIndicator()),),
                ),
              ],
            ) ,
          );


        }, ),
    );
  }
}
Widget searchitem(List<Datum>? model,context, int index, homecubit cubit) => Padding(
  padding: const EdgeInsets.all(10.0),
  child:   Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Container(
            height: 130,
            width: 130,
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(image:NetworkImage('${model![index].image}'), height: 200),
                if(model[index].discount != null)
                  Container(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("discount",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700)),
                    ),),
              ],)),
        SizedBox(width: 5,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                      text:model[index].name,style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    height: 1.2,
                  )
                  )),
              Row(
                children: [
                  Text('${model[index].price?.round()}\$',style: TextStyle(color: Colors.blue),),
                  SizedBox(width: 5,),
                  if(model[index].discount != null)
                    Text('${model[index].oldPrice?.round()}\$',style: TextStyle(color: Colors.grey,decoration: TextDecoration.lineThrough),)
                ],
              )

            ],
          ),
        ),

      ],

    ),
  ),
);