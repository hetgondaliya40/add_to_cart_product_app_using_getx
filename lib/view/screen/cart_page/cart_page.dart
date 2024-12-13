import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/product_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        centerTitle: true,
        backgroundColor: Colors.grey.withOpacity(0.4),
      ),
      body: Obx(() {
        if (controller.addToCartList.isEmpty) {
          return const Center(
            child: Text(
              "Your cart is empty!",
              style: TextStyle(fontSize: 18),
            ),
          );
        }
        return ListView.builder(
          itemCount: controller.addToCartList.length,
          itemBuilder: (context, index) {
            var item = controller.addToCartList[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                leading: Image.network(
                  item.thumbnail,
                  width: 75,
                  height: 75,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Price: \$${item.price}\nStock: ${item.stock}",
                  style: TextStyle(fontSize: 16),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    controller.removeFromCart(item: item);
                  },
                ),
              ),
            );
          },
        );
      }),
      bottomNavigationBar: Obx(() {
        return controller.addToCartList.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    controller.addToCartList.clear();
                  },
                  child: const Text("Clear Cart"),
                ))
            : const SizedBox.shrink();
      }),
    );
  }
}
