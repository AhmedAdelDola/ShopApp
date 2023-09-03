import 'package:flutter/material.dart';
import 'package:shopapp/Modules/shopping%20login%20screen/shopping%20login%20screen.dart';
import 'package:shopapp/Shared/Network/local/shared_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Shared/Styles.dart';

class OnBordingScrren extends StatefulWidget {
  const OnBordingScrren({Key? key}) : super(key: key);

  @override
  State<OnBordingScrren> createState() => _OnBordingState();
}

class _OnBordingState extends State<OnBordingScrren> {
  var controller = PageController();
  bool islast = false ;
  void submit(){
    sharedhelper.SetData(key: 'onBording', value: true).then((value) {
      if(value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ShopLogin(),));
      }});
  }
  List<onbordingitems> screen = [
    onbordingitems(title:'onbording 1 ' ,
      image: 'images/10484.jpg' ,
      subtitle: "page 1",),
    onbordingitems(title:'onbording 2 ' ,
      image: 'images/3858422.jpg' ,
      subtitle: "page 2",),
    onbordingitems(title:'onbording 3 ' ,
      image: 'images/Wavy_Bus-44_Single-07.jpg' ,
      subtitle: "page 3",),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(onPressed:submit, child: Text('Skip'))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (index){
                    if(index == screen.length-1 ){
                      setState(() {
                        islast = true ;
                      });
                    }else{
                      setState(() {
                        islast = false ;
                      });
                    }
                  },
                  physics: BouncingScrollPhysics(),
                  controller: controller,
                  itemBuilder: (context, index) => onbordingitem(screen[index]),
                  itemCount: screen.length,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(controller: controller, count: screen.length,effect: ExpandingDotsEffect(
                      activeDotColor: defualtcolor ,
                      paintStyle: PaintingStyle.fill,
                      expansionFactor: 4.0,
                      spacing: 10
                  ),),
                  FloatingActionButton(onPressed: () {
                    if(islast == true){
                      submit();
                    }else {
                      controller.nextPage(
                          duration: Duration(milliseconds: 250),
                          curve: Curves.easeInOutCubicEmphasized);
                    }
                  },
                    child: Icon(Icons.arrow_forward_ios),

                  )
                ],
              )
            ],
          ),
        )
    );
  }
}
class onbordingitems {
  late String image ;
  late String title ;
  late String subtitle ;
  onbordingitems({required this.title , required this.subtitle,required this.image});
}

Widget onbordingitem(onbordingitems list) => Padding(
  padding: const EdgeInsets.all(20),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child: Image.asset(list.image)),
      Text(list.title,style: TextStyle(fontSize: 25)),
      SizedBox(height: 10,),
      Text(list.subtitle),
      SizedBox(height: 100,),
    ],
  ),
);