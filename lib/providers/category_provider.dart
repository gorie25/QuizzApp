import 'package:flutter/material.dart';

import 'package:quizzmobileapp/models/category_model.dart';
import 'package:quizzmobileapp/repository/category_repo.dart';

class CategoryProvider extends ChangeNotifier{
     //Cung cấp id chọn trong dropdown và danh sách các category theo ngôn ngữ đó
  int? idLanguageChoose;
  List<CategoryModel> listLanguage = [];

  //Lấy danh sách ngôn ngữ
  Future<void> getListLanguage() async{
        List<CategoryModel> data = await CategoryRepository().getLanguage(); // Lấy dữ liệu từ api
        listLanguage = data; // Gán dữ liệu vào listLanguage
        notifyListeners();  // Lắng nghe sự thay đổi cập nhật lại UI
  }
  
   void setIdLanguageChoose(int id){
      idLanguageChoose = id;
      notifyListeners();
   }


  Future<List<CategoryModel>>getListTopic( ) async{
    List<CategoryModel> data = await CategoryRepository().getTopic(idLanguageChoose as int);
    return data;
  }
}