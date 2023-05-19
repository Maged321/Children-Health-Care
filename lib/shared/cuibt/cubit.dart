

import 'package:bloc/bloc.dart';
import 'package:childern_health_care/models/articles_model.dart';
import 'package:childern_health_care/models/homemodel.dart';
import 'package:childern_health_care/models/pregrancymodel.dart';
import 'package:childern_health_care/models/vidoe_model.dart';
import 'package:childern_health_care/shared/cuibt/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/catModel.dart';
import '../../models/register_model.dart';
import '../../models/subtitles_video_model.dart';
import '../components/constants.dart';
import '../network/local/cache_helper.dart';
import '../network/remote/dio_helper.dart';
import '../network/remote/end-point.dart';

class ChildernCubit extends Cubit<ChildernStates> {

  ChildernCubit() :super(ChildernGetUserInitialiState());

  static ChildernCubit get(context) => BlocProvider.of(context);


  List<HomeModel> listData = [];

  void getHomeData() async {
    emit(ChildernGetHomeDataLoadingState());

    var res = await DioHelper.getData(
      url: Home,
    );
    res.data.forEach((elemment) =>
        listData.add(HomeModel.fromJson(elemment)));
    listData.removeAt(listData.length - 1);
    emit(ChildernGetHomeDataSucccessState());
  }

  PregrancyModel? preModel;
  Future<void> getPregrancyData ({
    required int secId
  }) async {
    try {
      emit(ChildernGetPregrancyDataLoadingState());
      final res = await DioHelper.getData(
        url: GET_Pregrancy,
        query: {'section': secId},
      );
      preModel = PregrancyModel.fromJson(res.data);
      emit(ChildernGetPregrancyDataSucccessState());
    }catch(error){
      print(error.toString());
      emit(ChildernGetPregrancyDataErrorState(error.toString()));
    }
  }


  Subsection_Model? catModel;
  Future<void> getCat ({
    required int secId
  }) async {
    try {
      emit(ChildernGetCategoryDataLoadingState());
      final res = await DioHelper.getData(
        url: CatModel,
        query: {'subsection': secId},
      );
      catModel = Subsection_Model.fromJson(res.data);
      emit(ChildernGetCategoryDataSucccessState());
    }catch(error){
      print(error.toString());
      emit(ChildernGetCategoryDataErrorState(error.toString()));
    }
  }

  Articles_Model? artModel;
  void getArticlesData({
  required int catID,
})async{
    try{
      emit(ChildernGetArticlesDataLoadingState());
      final response = await DioHelper.getData(
        url: Article,
        query: {'category':catID},
      );
      artModel=Articles_Model.fromJson(response.data);
      emit(ChildernGetArticlesDataSucccessState());
      artModel!.articles!.forEach((element) {
        print(element.title);
      });
    }catch(error){
      print(error.toString());
      emit(ChildernGetArticlesDataErrorState(error.toString()));
    }

  }
  List<Vidoes_Model> vidModel=[];
  void getVidoesData()async{
    emit(ChildernGetVidoesDataLoadingState());
    var response = await DioHelper.getData(
      url: Vidoes,
    );
    response.data.forEach((elemment) =>
        vidModel.add(Vidoes_Model.fromJson(elemment)));
     print(vidModel[0].videoName);
    emit(ChildernGetVidoesDataSucccessState());

  }
  List<Subtitles_Video_Model> subTitVidModel=[];
  void getSubTitVidoesData()async{
    emit(ChildernGetVidoesDataLoadingState());
    var response = await DioHelper.getData(
      url: SubTitVideo,
    );
    response.data.forEach((elemment) =>
        subTitVidModel.add(Subtitles_Video_Model.fromJson(elemment)));
    emit(ChildernGetVidoesDataSucccessState());

  }



  UserModel? model;
  void getUserData(){
    emit(ChildernGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uid)
        .get().then((value){
      print(value.toString());
      // model=UserModel.fromJson(value.data()!);

      emit(ChildernGetUserSucccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(ChildernGetUserErrorState(error));
    });
  }

  bool isDark = false;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeDarkState());
    }
    else {
      isDark = !isDark;
      CacheHelper.saveData(key: 'isDark', value: isDark)
          .then((value) {
        emit(AppChangeModeDarkState());
      });
    }
  }
}