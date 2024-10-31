import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quizzmobileapp/apps/routes/router_name.dart';
import 'package:quizzmobileapp/models/category_model.dart';
import 'package:quizzmobileapp/providers/category_provider.dart';
import 'package:quizzmobileapp/widgets/background_custom.dart';



class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       extendBodyBehindAppBar: true, // Đẩy body lên dưới appBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Nền trong suốt
        elevation: 0, // Xóa bóng dưới AppBar
        title: const Text('Categories', style: TextStyle(color: Colors.white)), // Thay đổi màu chữ nếu cần
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
        SafeArea(
            child: FutureBuilder(
                future: context.read<CategoryProvider>().getListTopic(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<CategoryModel> data = snapshot.data as List<CategoryModel>;
                    //Để render dữ liệu ra màn hình từ Gridview thì sử dụng GridView.builder  
                    return Padding (
                      padding: const EdgeInsets.all(30),
                       child: GridView.builder(
                        // padding: EdgeInsets.symmetric(
                        // horizontal: context.paddingCustom(context)),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 2 / 1),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(  // Các ô trong gridview
                          onTap: () {  //đến bản Article và truyền dữ liệu
                        context.goNamed(RoutersName.articleName, extra: {
                            'id': data[index].id,
                            "name": data[index].name
                          });
                          },
                          child: Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              // Lấy màu từ bảng màu của flutter
                              color: Colors.primaries[index],
                            
                              ),
                                child:  Align(
                                  child: Text(
                                    data[index].name,
                                    style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                          )
                        );
                      },
                      itemCount: data.length,
                    ));
                  } else {
                    return Container(
                      child: const Center(
                        child: Text('No Data'),
                      ),
                    );
                  }
                }
            )
        )
      ],
    ));
  }
}
