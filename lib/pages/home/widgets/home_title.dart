import 'package:flutter/material.dart';
import 'package:quizzmobileapp/apps/utils/const.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});


  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
           children: [
              const Text('Welcome to Quiz App', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),
              SizedBox(height: getHeight(context) * 0.02),

              const Text('Let\'s start the quiz of Goriee', style: TextStyle(fontSize: 20, color: Colors.white),),
              SizedBox(height: getHeight(context) * 0.06),
           ],
    );
  }
}