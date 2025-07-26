import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reco_restaurant/core/routing/named_router.dart';
import 'package:reco_restaurant/core/routing/named_router_impl.dart';
import 'package:reco_restaurant/core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const RecoRestaurantApp());
}

class RecoRestaurantApp extends StatelessWidget {
  const RecoRestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter();

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          onGenerateRoute: router.generateRoute,
          initialRoute:
              FirebaseAuth.instance.currentUser != null
                  ? Routes.home
                  : Routes.login,
        );
      },
    );
  }
}
