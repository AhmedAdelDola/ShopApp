import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shopapp/Shared/componants/constants.dart';

import '../../Shared/componants/ProfileButton.dart';
import '../shop home page/cubit.dart';
import '../shop home page/state.dart';

class settings extends StatelessWidget {
  const settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homecubit, homestate>(
        listener: (context, state) {
          if(state is logoutSucess){
            if(logOut.status == true){
              MotionToast.success(
                description: Text(logOut.message!),
              ).show(context);
            }
          }
        },
    builder: (context, state) {
    return ConditionalBuilder(
      condition: profile.data != null ,
      builder: (context) => Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyButton(txt: 'UserName', value: profile.data?.name,),
            MyButton(txt: 'Email', value: profile.data?.email,),
            MyButton(txt: 'phone', value: profile.data?.phone,),
            ElevatedButton(onPressed: (){
              homecubit.get(context).LOGOUT();
            }, child: Text('LogOut'),style: ButtonStyle(
              fixedSize: MaterialStatePropertyAll(Size(200, 60)),
              backgroundColor: MaterialStatePropertyAll(Colors.red)
            ),)
          ],
        ),
      ),
      fallback: (context) => const Center(child: CircularProgressIndicator()),
      );


    });
}
}
