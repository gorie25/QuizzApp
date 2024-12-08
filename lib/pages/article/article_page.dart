import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizzmobileapp/apps/utils/const.dart';
import 'package:quizzmobileapp/pages/article/widgets/article_box.dart';
import 'package:quizzmobileapp/pages/article/widgets/article_loading.dart';
import 'package:quizzmobileapp/widgets/background_custom.dart';



class ArticlePage extends StatelessWidget {
  int idTopic;
  String name;  
  ArticlePage({super.key, required this.idTopic, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  extendBodyBehindAppBar: true, // Đẩy body lên dưới appBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Nền trong suốt
        elevation: 0, // Xóa bóng dưới AppBar
        title: Text(name, style: const TextStyle(color: Colors.white)), // Thay đổi màu chữ nếu cần
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // Đổi màu icon nếu cần
          onPressed: () {
        context.pop();
          },
        ),
      ),
      body: Stack(
        children: [
        Container(
      width: double.infinity,
      height: double.infinity,
      child: BackgroundCustom(),
    ),
          SafeArea(child: Padding(
            padding: EdgeInsets.symmetric(horizontal: paddingCustom(context)),  
            child: SingleChildScrollView (
              child: Column(
                children: [
                  // SizedBox(height: getHeight(context)*0.05),
                   const ArticleLoading(),
                   SizedBox(height: getHeight(context)*0.05),
                  ArticleBox(idTopic: idTopic),
                ],
              ),
            ))) 
        ],
      ),
    );
  }
}
