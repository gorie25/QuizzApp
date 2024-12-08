import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizzmobileapp/apps/routes/router_name.dart';
import 'package:quizzmobileapp/pages/article/article_page.dart';
import 'package:quizzmobileapp/pages/category/category_page.dart';
import 'package:quizzmobileapp/pages/home/homepage.dart';

class RouterConfigCustom {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: RoutersName.homeName,
        path: RoutersPath.homePath,
        builder: (BuildContext context, GoRouterState state) {
          return const Homepage();
        },
        routes: <RouteBase>[
          GoRoute(
            name: RoutersName.categoryName,
            path: RoutersPath.categoryPath,
            builder: (BuildContext context, GoRouterState state) {
              return const CategoryPage();
            },
            routes: <RouteBase>[
              GoRoute(
                name: RoutersName.articleName,
                path: RoutersPath.articlePath,
                builder: (BuildContext context, GoRouterState state) {
                  // Dữ liệu idTopic và name sẽ được truyền qua state.extra
                  Map data = state.extra as Map;
                  int id = data['id'];
                  String name = data['name'];

                  return ArticlePage(idTopic: id, name: name);
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}