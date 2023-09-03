import 'package:shared_preferences/shared_preferences.dart';

class sharedhelper {
  static SharedPreferences? shared ;

  static init() async {
    shared =  await SharedPreferences.getInstance() ;
  }

  static  Future<bool> SetData({
    required String key,
    required dynamic value
  })async {
    if(value is String){return await shared!.setString(key, value);}
   else if(value is bool){return await shared!.setBool(key, value);}
   else if(value is double){return await shared!.setDouble(key, value);}
   else {return await shared!.setInt(key, value);}

  }

  static  getData({
    required String key,
  }) {
    return shared!.get(key) ;
  }

}