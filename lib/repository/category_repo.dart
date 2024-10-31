import 'dart:convert';
import 'package:http/http.dart' as http;  
import 'package:quizzmobileapp/models/category_model.dart';

class CategoryRepository {

    Future<List<CategoryModel>> getLanguage() async{

         const url='https://apiforlearning.zendvn.com/api/v2/category_programming_quiz?limit=20&page=1';
    final response = await http.get(Uri.parse(url));
    List data = jsonDecode(response.body)['data'];
    List<CategoryModel> categories = List<CategoryModel>.from(
        data.map((e) => CategoryModel.fromJson(jsonEncode(e))).toList());
    return categories;
    
    
    } 

        //Đầu vào là id của ngôn ngữ, trả về danh sách các chủ đề theo ngôn ngữ đó  
    Future<List<CategoryModel>> getTopic(int id) async {
        final url = 'https://apiforlearning.zendvn.com/api/v2/category_programming_quiz/$id/topics';
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
            List data = jsonDecode(response.body)['data'];
            List<CategoryModel> categories = List<CategoryModel>.from(
                data.map((e) => CategoryModel.fromJson(jsonEncode(e))).toList());
            return categories;
        } else {
            throw Exception('Failed to load topics');
        }
    }

}


