import 'package:flutter/material.dart';

import 'package:quizzmobileapp/models/question_model.dart';
import 'package:quizzmobileapp/repository/question_repo.dart';

class QuestionProvider extends ChangeNotifier{
  List<Question> listData = [];

  
  // chuyển đổi data từ dạng json sang dạng object
  Future<List<Question>> getQuestionList(int idTopic) async{
    List<Question> data = await QuestionRepository().getQuestion(idTopic);
    listData = data;
    return data;
  }

}