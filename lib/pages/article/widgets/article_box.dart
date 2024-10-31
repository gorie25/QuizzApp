import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/themes/a11y-dark.dart';
import 'package:provider/provider.dart';
import 'package:quizzmobileapp/apps/utils/const.dart';
import 'package:quizzmobileapp/apps/utils/parse_html.dart';
import 'package:quizzmobileapp/models/question_model.dart';
import 'package:quizzmobileapp/pages/article/widgets/article_answer.dart';
import 'package:quizzmobileapp/providers/question_provider.dart';
import 'package:quizzmobileapp/widgets/button_custom.dart';


class ArticleBox extends StatefulWidget {
  final int idTopic;
  const ArticleBox({super.key, required this.idTopic});

  ///Stateful widget nên cần một class state để quản lí state của widget này
  State<ArticleBox> createState() => _ArticleBoxState();
}

class _ArticleBoxState extends State<ArticleBox> {
  @override
  Widget build(BuildContext context) {
    // Khởi tạo PageController
    final PageController pageController = PageController();
    String valueInput = '';

    return FutureBuilder(
      future: context.read<QuestionProvider>().getQuestionList(widget.idTopic),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Question> data = snapshot.data as List<Question>;
          return ExpandablePageView.builder(
            controller: pageController,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: SizedBox(
                  //height: 450, // Chiều cao cụ thể cho ListView
                  child: ListView(
                    shrinkWrap: true, // chiem vua du chieu cao
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      // Thêm nội dung cho danh sách
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          data[index].title ?? 'No Title',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: getHeight(context) * 0.02),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: HighlightView(
                          parseHtmlString(data[index].question),
                          language: 'dart',
                          theme: a11yDarkTheme,
                          padding: const EdgeInsets.all(12),
                          textStyle: const TextStyle(
                            fontSize: 16, // Tăng kích thước chữ để dễ đọc hơn
                            fontFamily: 'Lexend',
                            color: Colors.white,
                            height: 1.5, // Điều chỉnh khoảng cách giữa các dòng
                            fontWeight: FontWeight.w400, // Đặt độ đậm font
                            shadows: [
                              Shadow(
                                offset: Offset(0, 2),
                                blurRadius: 4,
                                color: Colors
                                    .black26, // Hiệu ứng đổ bóng để tăng độ nổi bật
                              ),
                            ],
                          ),
                        ),
                      ),

                     SizedBox(height: getHeight(context) * 0.02),
                     // Tạo trường nhập dữ liệu
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(

                          //Khi nhap vao thi lay gia tri valueInput
                        onChanged: (value) => valueInput = value,
                        decoration: InputDecoration(
                          hintText: 'Điền đáp án',
                          // labelText: 'Điền đáp án', // Nhãn cho trường văn bản
                          fillColor: Color.fromARGB(255, 148, 238, 238),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        ),
                      ),
                                    
                                    SizedBox(height: getHeight(context) * 0.02),
                                    // Tạo nút kiểm tra 
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: ButttonCustom(title: 'Nộp đáp ``',
                           onTap: ()
                          { 
                            // Khi nhấn vào nút kiểm tra thì hiển thị kết quả
                            showAnswer(context, valueInput, data[index]);
                          },
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return Container(
            child: Center(
              child: Text('No Data'),
            ),
          );
        }
      },
    );
  }
}
