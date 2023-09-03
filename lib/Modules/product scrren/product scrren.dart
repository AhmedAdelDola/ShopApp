import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shopapp/Modules/shop%20home%20page/cubit.dart';
import 'package:shopapp/Modules/shop%20home%20page/state.dart';
import 'package:shopapp/Shared/componants/constants.dart';
import '../../Shared/componants/componantes.dart';

class products extends StatelessWidget {
  const products({Key? key}) : super(key: key);

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
              condition: product.data != null ,
              builder: (context) => Homebuild(product ,context,catogry),
              fallback: (context) => const Center(child: CircularProgressIndicator()),);
        }, );
  }
}
