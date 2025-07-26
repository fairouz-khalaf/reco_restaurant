import 'package:flutter/material.dart';
import 'package:reco_restaurant/core/routing/named_router.dart';
import 'package:reco_restaurant/features/auth/login/views/login_view.dart';
import 'package:reco_restaurant/features/auth/sign_up/views/sign_up_view.dart';
import 'package:reco_restaurant/features/categories/views/add_category.dart';
import 'package:reco_restaurant/features/home/views/home_view.dart';
import 'package:reco_restaurant/features/meals/views/add_meal.dart';
import 'package:reco_restaurant/features/meals/views/view_meals.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginView());

      case Routes.signup:
        return MaterialPageRoute(builder: (_) => const SignUpView());

      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeView());

      case Routes.addCategory:
        final args = settings.arguments as Map<String, dynamic>?;

        return MaterialPageRoute(
          builder:
              (_) => AddCategoryView(
                isEdit: args?['isEdit'] ?? false,
                categoryId: args?['categoryId'],
                initialCategoryName: args?['initialCategoryName'],
              ),
        );

      case Routes.addMeal:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder:
              (_) => AddMealView(
                isEdit: args['isEdit'] ?? false,
                categoryId: args['categoryId'],
                mealData: args['mealData'],
              ),
        );

      case Routes.viewMealsByCategory:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder:
              (_) => ViewMealsByCategory(
                categoryId: args['categoryId'],
                categoryName: args['categoryName'],
                price: args['price'] ?? '0.0',
              ),
        );

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
