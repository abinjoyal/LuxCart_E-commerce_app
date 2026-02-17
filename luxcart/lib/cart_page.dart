import 'package:flutter/material.dart';
import 'abi_1.dart';
import 'product_detail_screen.dart';
import 'favorite_data.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text("My Cart"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              //boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$${CartData.totalPrice().toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: CartData.cartItems.isEmpty
          ? const Center(child: Text("Your cart is empty"))
          : Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 6,
                          mainAxisSpacing: 6,
                        ),
                    itemCount: CartData.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = CartData.cartItems[index];

                      return Container(
                        height: 600,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: Colors.grey.shade300),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.orange.shade100,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    item.image,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 8),

                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                item.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            Text(
                              "Size: ${item.size}",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),

                            const SizedBox(height: 6),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item.prices,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      CartData.removeAt(index);
                                    });
                                  },
                                  child: const Icon(Icons.cancel_outlined),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // Container(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 28,
                //     vertical: 40,
                //   ),
                //   decoration: const BoxDecoration(
                //     color: Colors.white,
                //     boxShadow: [
                //       BoxShadow(color: Colors.black12, blurRadius: 6),
                //     ],
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       const Text(
                //         "Total",
                //         style: TextStyle(
                //           fontSize: 18,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //       Text(
                //         "\$${CartData.totalPrice().toStringAsFixed(2)}",
                //         style: const TextStyle(
                //           fontSize: 18,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.orange,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
    );
  }
}

class CartItem {
  final String image;
  final String name;
  final String size;
  final double price;
  final String prices;
  int qty;

  CartItem({
    required this.image,
    required this.name,
    required this.size,
    required this.price,
    this.qty = 1,
    required this.prices,
  });
}

class CartData {
  static List<CartItem> cartItems = [];

  static void addToCart(CartItem item) {
    final index = cartItems.indexWhere(
      (e) => e.image == item.image && e.size == item.size,
    );

    if (index != -1) {
      cartItems[index].qty += item.qty;
    } else {
      cartItems.add(item);
    }
  }

  static void removeAt(int index) {
    cartItems.removeAt(index);
  }

  static double totalPrice() {
    return cartItems.fold(0, (sum, item) => sum + item.price * item.qty);
  }
}
