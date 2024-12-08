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
      heightFactor: 1.5,
      child: Container(
        width: getWidth(context),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Add RichText widget to display whether the answer is correct or incorrect
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                textAlign:
                    TextAlign.center, // Căn giữa toàn bộ nội dung RichText
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Đáp án của bạn là ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: valueInput != data.answer ? 'Sai' : 'chính xác',
                      style: TextStyle(
                        color: valueInput == data.answer
                            ? Colors.green
                            : Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (valueInput != data.answer) ...[
                      TextSpan(
                        text: ', đáp án đúng là: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                   TextSpan(
                          text:
                              '\n\n'), 
                      TextSpan(
                          text:
                              '\t\t\t\t'), // Thêm khoảng trống tùy chọn nếu cần
                      TextSpan(
                        text: data.answer,
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    TextSpan(
                      text: '\n\n\n', // Khoảng trống xuống dòng
                    ),
                    TextSpan(
                      text: 'Xem video giải thích ở bên dưới',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 246, 4, 4),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
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
