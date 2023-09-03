import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Models/favmodel.dart';
import '../../Models/Categories Model.dart';
import '../../Models/Product Model.dart';
import '../../Modules/shop home page/cubit.dart';
import '../../Modules/shop home page/state.dart';
import '../Styles.dart';

Widget Homebuild(Products model,context,Catogry categor ) => SingleChildScrollView(child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    CarouselSlider(
      items: model.data?.banners?.map((e) => Image(
        image: NetworkImage('${e.image}'),
        width: double.infinity,
        fit: BoxFit.cover,
      )).toList(),
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 0.1,
        viewportFraction: 1.0,
        autoPlayAnimationDuration: Duration(seconds: 1),
        autoPlayCurve: Curves.easeIn,
        reverse: false,
        autoPlayInterval: Duration(seconds: 3),
        height: 200,
        scrollDirection: Axis.horizontal,


      ),),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('Catogries',style: TextStyle(fontSize: 23,fontWeight: FontWeight.w700)),),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 100,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage('${categor.data?.data?[index].image}'),
                      fit: BoxFit.cover)
              ),
              height: 150,
              width: 100,
              child: Stack(
                children: [
                  Positioned(
                    top: 70,
                    child: Container(
                      alignment: AlignmentDirectional.bottomCenter,
                      width: 100,
                      height: 30,
                      color: Colors.black54,
                      child: Center(child: Text('${categor.data?.data?[index].name}',style: TextStyle(
                          color: Colors.white,overflow: TextOverflow.ellipsis
                      ))),
                    ),
                  )
                ],
              ),
            ) ,
            separatorBuilder: (context, index) => SizedBox(width: 25),
            itemCount: categor.data!.data!.length),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('Products',style: TextStyle(fontSize: 23,fontWeight: FontWeight.w700)),),

    Padding(
      padding: const EdgeInsets.symmetric( horizontal: 10),
      child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 0.1,
          crossAxisSpacing: 15.0,
          childAspectRatio: 1/1.58,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children:List.generate(
              model.data!.products!.length,
                  (index) => buildproduct(model.data!.products![index],context))),
    )


  ],
));

Widget buildproduct(ProductElement model,context) => BlocConsumer<homecubit , homestate>(
listener: (context, state) {},
builder: (context, state) => Column(
  children: [
    Container(
        height: 200,
        width: double.infinity,
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(image:NetworkImage('${model.image}'), height: 200),
            if(model.discount != 0)
              Container(
                color: defualtcolor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("discount",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700)),
                ),),
          ],)) ,
    SizedBox(height: 5,),
    Center(child: Text('${model.name}',overflow: TextOverflow.ellipsis,style: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w700,
        height: 1.2
    ),maxLines: 2,)),
    Row(
      children: [
        Text('${model.price?.round()}\$',style: TextStyle(color: Colors.blue),),
        SizedBox(width: 5,),
        if(model.discount != 0)
          Text('${model.oldPrice?.round()}\$',style: TextStyle(color: Colors.grey,decoration: TextDecoration.lineThrough),),
        Spacer(),
        IconButton(onPressed: (){
          homecubit.get(context).changefavorit(model.id ?? 0);
          print(model.id ?? 0);
        } , icon:Icon(Icons.favorite,color: homecubit.get(context).Favorit[model.id]??false ? Colors.red : Colors.grey  ,
          ),
        )
      ],
    )

  ],
));

Widget categoribuild(Catogry model) => Card(
  child: Padding(
    padding: const EdgeInsets.all(20),
    child: ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return  Row(
          children: [
            Image(image:  NetworkImage('${model.data!.data![index].image}'),height: 100,width: 100),
            SizedBox(width: 20,),
            Text('${model.data!.data![index].name}',style: Theme.of(context).textTheme.titleLarge,),
            Spacer(),
            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios))
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(height: 20),
      itemCount: model.data!.data!.length,
    ),
  ),
);

Widget Favbuild(Product? model , context) => Padding(
  padding: const EdgeInsets.all(10.0),
  child:   Row(
      children: [
        Container(
            height: 130,
            width: 130,
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(image:NetworkImage('${model?.image}'), height: 200),
                if(model?.discount != 0)
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
                text:model?.name,style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  height: 1.2,
              )
              )),
              Row(
                children: [
                  Text('${model?.price?.round()}\$',style: TextStyle(color: Colors.blue),),
                  SizedBox(width: 5,),
                  if(model?.discount != 0)
                    Text('${model?.oldPrice?.round()}\$',style: TextStyle(color: Colors.grey,decoration: TextDecoration.lineThrough),),
                  Spacer(),
                  IconButton(onPressed: (){
                    homecubit.get(context).changefavorit(model?.id ?? 0);

                    print(model?.id ?? 0);
                  } , icon:Icon(Icons.favorite,color: homecubit.get(context).Favorit[model?.id]??false ? Colors.red : Colors.grey  ,
                  ),
                  )
                ],
              )

            ],
          ),
        ),

      ],

  ),
);
