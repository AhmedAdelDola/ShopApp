
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Models/Product%20Model.dart';
import 'package:shopapp/Modules/Favorit%20scrren/favorit%20scrren.dart';
import 'package:shopapp/Modules/product%20scrren/product%20scrren.dart';
import 'package:shopapp/Modules/settings/settings.dart';
import 'package:shopapp/Modules/shop%20home%20page/state.dart';
import 'package:shopapp/Shared/Network/endpoint.dart';
import 'package:shopapp/Shared/Network/remot/dio.dart';
import 'package:shopapp/Shared/componants/constants.dart';
import '../../Models/Categories Model.dart';
import '../../Models/LogoutModel.dart';
import '../../Models/ProfileModel.dart';
import '../../Models/SearchModel.dart';
import '../../Models/change fav model.dart';
import '../../Models/favmodel.dart';
import '../catogris scrren/categoris scrren.dart';

class homecubit extends Cubit<homestate>{
  homecubit() : super(initstate());
  static homecubit get(context) => BlocProvider.of(context);
  List scrrens = [
    products(),
    categoris(),
    favorits(),
    settings()
  ];
  int currentindex =0 ;
  void changeindex(int index){
    currentindex = index ;
    if(index == 0){
      getProduct();
    }
    if(index == 1){
      getCategory();
    }
    if(index == 2){
      getFav();
    }
    if(index == 3){
      getPrfile();
    }
    emit(changebotmNav());
  }
  Map<int? , bool? > Favorit = {};
  void getProduct() {
    emit(getDataLoading());
    DioHelper.getData(
        url: home,
      token: token
    ).then((value){
      print(value.data);
      product = Products.fromJson(value.data);
      product.data?.products?.forEach((element){
        Favorit.addAll({
          element.id : element.inFavorites
        });
      });
      emit(getDataSucess());
    }).catchError((e){
      print(e);
      emit(getDataError());
    });
  }
  void getCategory() {
    emit(getDataLoading1());
    DioHelper.getData(
        url: categry,
        token: token
    ).then((value){
      print(value.data);
      catogry = Catogry.fromJson(value.data);
      emit(getDataSucess1());
    }).catchError((e){
      print(e);
      emit(getDataError1());
    });
  }
  void changefavorit(int id){
    Favorit[id] = !Favorit[id]! ;
    emit(addfavLoading1());
    DioHelper.postData(
        url: Favorites,
        token: token,
        data: {
          'product_id' : id
        }).then((value) {
      changefav = ChangeFav.fromJson(value.data);
      if(changefav.status == false){
        Favorit[id] = !Favorit[id]! ;
      }
      getFav();
      emit(addfavSucess1());
    }).catchError((e){
      Favorit[id] = !Favorit[id]! ;
      emit(addfavError1());
    });
  }
  void getFav() {
    emit(getfavLoading1());
    DioHelper.getData(
        url: Favorites,
        token: token
    ).then((value){
      print(value.data);
      fav = Fav.fromJson(value.data);
      emit(getfavSucess1());
    }).catchError((e){
      print(e);
      emit(getfavError1());
    });
  }
  void Searchs(String q) {
    emit(getsearchLoading());
    DioHelper.postData(
        url: Searcher,
        token: token,
        data: {
          'text' : q
    }
    ).then((value){
      print(value.data);
      search = Search.fromJson(value.data);
      emit(getsearchSucess());
    }).catchError((e){
      print(e);
      emit(getsearchError());
    });
  }
  void getPrfile() {
    emit(getprofileLoading());
    DioHelper.getData(
        url: Profiles,
        token: token
    ).then((value){
      print(value.data);
      profile = Profile.fromJson(value.data);
      emit(getprofileSucess());
    }).catchError((e){
      emit(getprofileError());
    });
  }
  void LOGOUT() {
    emit(logoutLoading());
    DioHelper.postData(
        url: Logout,
        token: token,
        data: {
          "fcm_token" : token
        }
    ).then((value){
      print(value.data);
      logOut = LogOut.fromJson(value.data);
      emit(logoutSucess());
    }).catchError((e){
      emit(logoutError());
    });
  }
}