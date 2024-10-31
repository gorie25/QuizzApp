import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzmobileapp/apps/routes/routers.dart';


import 'package:quizzmobileapp/providers/category_provider.dart';
import 'package:quizzmobileapp/providers/question_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(  // Dùng hai provider Category và Question
      providers: [      // Vừa vào ứng dụng là lấy danh sách ngôn ngữ 
          ChangeNotifierProvider(create: 
          (_)=>  CategoryProvider()..getListLanguage(),  //Đổ dữ liệu vào context
          
          ),
          ChangeNotifierProvider(create: (_)=> QuestionProvider(),) //Đổ dữ liệu vào context 
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          useMaterial3: true,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.black),
          ),
        ),
        routerConfig: RouterConfigCustom.router, // Ensure RouterConfigCustom is defined and imported
      ),
    );
  }
}