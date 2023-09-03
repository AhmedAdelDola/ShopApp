import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Shared/componants/constants.dart';
import '../../Shared/componants/componantes.dart';
import '../shop home page/cubit.dart';
import '../shop home page/state.dart';

class categoris extends StatelessWidget {
  const categoris({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homecubit,homestate>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition:state is getDataSucess1,
          builder: (context) => categoribuild(catogry),
          fallback: (context) => const Center(child: CircularProgressIndicator()),);
      }, );
  }
}
