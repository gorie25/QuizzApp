import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizzmobileapp/pages/article/widgets/article_box.dart';
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
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          const BackgroundCustom(),
          // Center(
          //   child: ElevatedButton(
          //     onPressed: () {
          //       context.goNamed(RoutersName.categoryName);
          //     },
          //     child: const Text('Go to Category Page'),
          //   ),
          // ),
          SafeArea(child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),  
            child: Column(
              children: [
                ArticleBox(idTopic: idTopic),
              ],
            ))) 
        ],
      ),
    );
  }
}
