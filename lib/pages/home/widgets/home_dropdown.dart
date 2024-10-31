import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzmobileapp/models/category_model.dart';
import 'package:quizzmobileapp/providers/category_provider.dart';


class HomeDropdown extends StatelessWidget {
  const HomeDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> listLanguage =
        context.watch<CategoryProvider>().listLanguage;

    return DropdownButton(
      //Giá trị lấy từ CategoryProvider
      value: context.watch<CategoryProvider>().idLanguageChoose,
      hint: const Text(
        'Chọn ngôn ngữ của bạn',
        style: TextStyle(color: Colors.white70),
      ),
      isExpanded: true,
      style: const TextStyle(
        color: Colors.grey,
      ),
      items: listLanguage.map((CategoryModel value) {
        return DropdownMenuItem(
          //mỗi Menu Item sẽ lọc theo id, show ra tên là name của id đó
          value: value.id,
          child: Text(
            value.name,
          ),
        );
      }).toList(),
      onChanged: (value) {
        //Khi chọn ngôn ngữ thì sẽ lưu lại id ngôn ngữ đã chọn
        context.read<CategoryProvider>().setIdLanguageChoose(value as int);
      },
    );
  }
}
