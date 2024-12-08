import 'package:flutter/material.dart';

import 'package:quizzmobileapp/models/question_model.dart';
import 'package:quizzmobileapp/repository/question_repo.dart';

class QuestionProvider extends ChangeNotifier{
  List<Question> listData = [];
int currentPage = 1;
  void setNumberPage (int page)
  {
    currentPage = page+1;
    notifyListeners();
  }
  // chuyển đổi data từ dạng json sang dạng object
  Future<List<Question>> getQuestionList(int idTopic) async{
    List<Question> data = await QuestionRepository().getQuestion(idTopic);
    //set lại thanh loading =0
    setNumberPage(0);
    listData = data;
    return data;
  }

}