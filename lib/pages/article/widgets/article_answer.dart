import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizzmobileapp/apps/utils/const.dart';
import 'package:quizzmobileapp/models/question_model.dart';
import 'package:quizzmobileapp/pages/article/widgets/article_youtube.dart';

Future<void> showAnswer(
    BuildContext context, String valueInput, Question data) {
  return showModalBottomSheet(
    context: context,
    builder: (context) => FractionallySizedBox(
      heightFactor: 0.8,
      child: Container(
        width: getWidth(context),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // Add RichText widget to display whether the answer is correct or incorrect
            Padding(
              padding: const EdgeInsets.all(8.0),

              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: valueInput != data.answer
                          ? 'Đáp án của bạn là đáp án sai, đáp án đúng là: '
                          : 'Đáp án của bạn là đáp án chính xác',
                      style: TextStyle(
                        color: valueInput == data.answer
                            ? Colors.green
                            : Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
        
                    TextSpan(
                      text: data.answer,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                                TextSpan(
                      text: '\n\n\n', // Khoảng trống xuống dòng
                    ),
                    TextSpan(
                      text: 'Xem video giải thích ở bên dưới',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 246, 4, 4),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            // Display the video explanation using ArticleYoutube
            ArticleYoutube(id: data.youtube_id_result),
          ],
        ),
      ),
    ),
  );
}
