import 'package:add_to_cart_product_app_using_getx/view/screen/cart_page/cart_page.dart';
import 'package:add_to_cart_product_app_using_getx/view/screen/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      designSize: Size(width, height),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(
            name: '/',
            page: () => const HomePage(),
          ),
          GetPage(
            name: '/cart',
            page: () => const CartPage(),
          ),
        ],
      ),
    );
  }
}
