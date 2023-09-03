import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shopapp/Shared/componants/componantes.dart';
import '../../Shared/componants/constants.dart';
import '../shop home page/cubit.dart';
import '../shop home page/state.dart';

class favorits extends StatelessWidget {
  const favorits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homecubit,homestate>(
      listener: (context, state) {
        if(state is addfavSucess1){
          if(changefav.status == true){
            MotionToast.success(
              description: Text(changefav.message!),
            ).show(context);
          }
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: fav.data != null ,
          builder: (context) => ListView.builder(
          itemBuilder: (BuildContext context, int index) => Favbuild(fav.data?.data?[index].product,context),
            itemCount: fav.data?.data?.length,
          ),
          fallback: (context) => const Center(child: CircularProgressIndicator()),);
      }, );
  }
}
