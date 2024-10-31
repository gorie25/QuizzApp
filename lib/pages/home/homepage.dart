import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quizzmobileapp/apps/routes/router_name.dart';
import 'package:quizzmobileapp/apps/utils/const.dart';
import 'package:quizzmobileapp/pages/home/widgets/home_dropdown.dart';
import 'package:quizzmobileapp/pages/home/widgets/home_title.dart';
import 'package:quizzmobileapp/providers/category_provider.dart';
import 'package:quizzmobileapp/widgets/background_custom.dart';
import 'package:quizzmobileapp/widgets/button_custom.dart';


class Homepage extends StatelessWidget {
  const Homepage({super.key});
  
  @override
  Widget build(BuildContext context) {

   return Scaffold(
    body: Stack( 
        children: [
                 const BackgroundCustom(),
              Positioned.fill(
                  child:  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [  

                              const HomeTitle(),
                              const HomeDropdown(),
                             SizedBox(height: getHeight(context) * 0.06),
                             ButttonCustom(title: 'Start',
                              onTap: () {

                                // Nếu chưa chọn dươc ngôn ngữ thì không thể chuyển trang 
                                 if(context.read<CategoryProvider>().idLanguageChoose != null) {
                                   context.goNamed(RoutersName.categoryName);
                                 }
                                }, )










                      ],))

            ,)
               


        ],

    ),
   );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: (AppBar(
  //       title: const Text('Home Page'),
  //     )),
  //     body: Center(child:  ElevatedButton(
  //       onPressed: () {
  //           context.goNamed(RoutersName.categoryName);
  //       },
  //       child: const Text(' Change page Category'),)),
  //   );
  // } 


    

}