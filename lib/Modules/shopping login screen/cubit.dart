import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Models/User_model.dart';
import 'package:shopapp/Modules/shopping%20login%20screen/states.dart';
import 'package:shopapp/Shared/Network/remot/dio.dart';

import '../../Shared/Network/endpoint.dart';

class logincubit extends Cubit<loginstates>{
  logincubit() : super(intiallogin());
  static logincubit get(context) => BlocProvider.of(context);


  Users? user ;


  void userLogin({
    required String email,
    required String password,
  })
  {
    emit(loginloding());
    DioHelper.postData(
      url:LOGIN,
      data:
      {
        'email': email,
        'password': password,
      },
    ).then((value)
    {
      print(value.data);
      user = Users.fromJson(value.data);
      emit(loginsucess());
    }).catchError((error)
    {
      emit(loginerror(error.toString()));
    });
  }
  bool isPassword = true;
void change(){
   isPassword = !isPassword ;
   emit(changestate());
}
}