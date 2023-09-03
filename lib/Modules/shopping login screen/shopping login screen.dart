import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shopapp/Modules/shop%20home%20page/home.dart';
import 'package:shopapp/Modules/shop%20register%20screen/shop%20register%20screen.dart';
import 'package:shopapp/Modules/shopping%20login%20screen/cubit.dart';
import 'package:shopapp/Modules/shopping%20login%20screen/states.dart';
import 'package:shopapp/Shared/Network/local/shared_helper.dart';

class ShopLogin extends StatefulWidget {
  const ShopLogin({Key? key}) : super(key: key);

  @override
  State<ShopLogin> createState() => _ShopLoginState();
}

class _ShopLoginState extends State<ShopLogin> {
  @override
  Widget build(BuildContext context) {
    var emailcontroller = TextEditingController();
    var passwordcontroller = TextEditingController();
    var formkey = GlobalKey<FormState>() ;

    return  BlocConsumer<logincubit , loginstates>(
        listener: (context, state)  {
          if(state is loginsucess){
            if(logincubit.get(context).user!.status == true){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),));
              MotionToast.success(
               description: Text('${logincubit.get(context).user?.message}'),
             ).show(context);

              sharedhelper.SetData(key: 'toke', value: true);
              sharedhelper.SetData(key: 'token', value: logincubit.get(context).user?.data?.token);
          }
           if(logincubit.get(context).user!.status == false){
            MotionToast.error(
                description: Text('${logincubit.get(context).user?.message}')).show(context);
          }
          }
        },
        builder: (context, state) => Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formkey,
              child: ListView(
                children: [
                  SizedBox(height: 50,),
                  Column(
                    children: [
                      Image.asset('images/Wavy_Tech-28_Single-10.jpg'),
                      SizedBox(height:20,),
                    Padding(
                  padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        controller: emailcontroller,
                        validator: (value) {
                        if (value != null && value.isNotEmpty ) return null;
                        return 'Invalid email.';
                        },

                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        prefixIconColor: Colors.grey,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Icon(Icons.person,size: 30),
                        ),
                        hintText: 'e-mail',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color:Colors.deepOrange,
                              style: BorderStyle.solid,
                            )
                        ),
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color:Color.fromRGBO(96, 180, 180, 1),
                            style: BorderStyle.solid,),
                          gapPadding: 10,

                        )),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: passwordcontroller,

                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value != null && value.length >= 6) return null;
                            return 'Invalid password';
                          },
                          decoration: InputDecoration(
                              prefixIconColor: Colors.grey,
                              suffixIconColor: Colors.grey,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 2),
                                child: Icon(Icons.lock),
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: IconButton( onPressed: () {
                                logincubit.get(context).change();
                                }, icon: Icon(logincubit.get(context).isPassword? Icons.visibility : Icons.visibility_off,),),
                              ) ,
                              hintText: 'Password',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color:Colors.deepOrange,
                                    style: BorderStyle.solid,
                                  )
                              ),
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color:Color.fromRGBO(29, 38, 125, 10),
                                  style: BorderStyle.solid,),
                                gapPadding: 10,
                              )),
                          obscureText: logincubit.get(context).isPassword,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: ConditionalBuilder(
                      condition: state is! loginloding,
                      builder: (BuildContext context) {
                        return ElevatedButton(onPressed: (){
                         if(formkey.currentState!.validate()){
                           logincubit.get(context).userLogin(email: emailcontroller.text, password: passwordcontroller.text);}
                        }, child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('LogIn'),
                            Icon(Icons.login)
                          ],
                        ));
                      },
                      fallback: (BuildContext context) => Center(child: CircularProgressIndicator()),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have any account ?'),
                      SizedBox(width: 5,),
                      InkWell(child: Text('Register Now',style: TextStyle(color: Colors.deepOrange)),onTap:() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Register(),));
                      },)
                    ],
                  )
                ],
              ),
            ),
          ),
        ) ,

    );
  }
}
