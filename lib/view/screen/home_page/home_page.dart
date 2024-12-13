import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/product_controller.dart';
import '../cart_page/cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => Get.to(
              () => CartPage(),
            ),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Obx(
                  () => Icon(
                    controller.addToCartList.isEmpty
                        ? Icons.shopping_cart_outlined
                        : Icons.shopping_cart,
                    size: 35.sp,
                  ),
                ),
                CircleAvatar(
                  radius: 8.sp,
                  backgroundColor: Colors.red,
                  child: Transform.translate(
                      offset: const Offset(0, -2),
                      child: Obx(
                        () => Text(
                          "${controller.addToCartList.length}",
                          style: TextStyle(
                            fontSize: 14.sp,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
        ],
        backgroundColor: Colors.white.withOpacity(0.1),
      ),
      backgroundColor: Colors.white.withOpacity(0.8),
      body: (controller.productList.isNotEmpty)
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) {
                var item = controller.productList[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 120.h,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: NetworkImage(item.thumbnail),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          item.title.toString().split(" ").join(" "),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "\$ ${item.price}",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${item.warrantyInformation}",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            controller.addToCartProduct(item: item);
                          },
                          child: const Text("Add to Cart"),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: controller.productList.length,
            )
          : const Center(
              child: CircularProgressIndicator(
                strokeWidth: 5,
                color: Colors.black,
              ),
            ),
    );
  }
}
