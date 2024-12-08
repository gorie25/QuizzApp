import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzmobileapp/apps/utils/const.dart';
import 'package:quizzmobileapp/models/question_model.dart';
import 'package:quizzmobileapp/providers/question_provider.dart';

class ArticleLoading extends StatelessWidget {
  const ArticleLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionProvider>(
      // Lắng nghe từ QuestionProvider và xây dựng giao diện dựa trên giá trị mới
      builder: (context, value, child) {
        int total = value.listData.length;
        
        return Column(
          children: [
            Container(
              height: getHeight(context) * 0.05,
              width: getWidth(context),
              child: Stack(
                children: [
                  // Thanh loading
                  LayoutBuilder(
                    builder: (context, constraints) {
                      double maxWidth = constraints.maxWidth;
                      double calculatedWidth = total > 0 
                        ? maxWidth * value.currentPage / total 
                        : 0;

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: calculatedWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff44A3AE),
                              Color(0xff33FBC9),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  // Text và Icon "Loading ..."
                  const Positioned.fill(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Loading ...', style: TextStyle(color: Colors.white)),
                          Icon(Icons.timelapse, color: Colors.white, size: 30),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Chỉ hiển thị RichText nếu listData không trống
            if (total > 0)
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(text: 'Question '),
                    TextSpan(text: value.currentPage.toString()),
                    const TextSpan(text: '/'),
                    TextSpan(text: total.toString()),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
