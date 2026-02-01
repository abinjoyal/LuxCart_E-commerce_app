import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  final String productName;
  final String price;
  final String pricevalue;
  final String mainImage;
  final Color backgroundColor;
  final String productitemname;
  final String productprice;
  final bool issize;

  const CheckoutPage({
    super.key,
    required this.productName,
    required this.price,
    required this.mainImage,
    required this.productitemname,
    required this.issize,
    required this.backgroundColor,
    required this.pricevalue,
    required this.productprice,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int selectedPaymentIndex = 0;

  final List<String> paymentMethods = [
    "Google Pay",
    "Phone Pay",
    "Cash on Delivery",
    "Credit / Debit Card",
  ];

  final double deliveryFee = 16.0;
  double get subTotal {
    final cleaned = widget.productprice.replaceAll(RegExp(r'[^\d.]'), '');
    return double.tryParse(cleaned) ?? 0.0;
  }

  double get totalPrice => subTotal + deliveryFee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Buy Now"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: _cardDecoration(),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: widget.backgroundColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Image.asset(widget.mainImage, fit: BoxFit.contain),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productitemname,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        if (!widget.issize)
                          Text(
                            "Size ${widget.productName}",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(
                      ' ${widget.pricevalue}',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            _sectionTitle("Delivery Address"),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: _cardDecoration(),
              child: TextField(
                maxLines: 3,
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                   hintText: 'Address',
                  hintStyle: TextStyle(color: Colors.grey, height: 1.4),
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 18),
            _sectionTitle("Payment Method"),
            Column(
              children: List.generate(paymentMethods.length, (index) {
                final bool isSelected = selectedPaymentIndex == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedPaymentIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.orange.shade50 : Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: isSelected
                            ? Colors.orange
                            : Colors.grey.shade300,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.payment,
                          size: 20,
                          color: isSelected ? Colors.orange : Colors.grey,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          paymentMethods[index],
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),

            SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: _cardDecoration(),
              child: Column(
                children: [
                  _priceRow("Sub-total", subTotal),
                  _priceRow("Delivery Fee", deliveryFee),
                  const Divider(height: 20),
                  _priceRow("Total Price", totalPrice, isBold: true),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          height: 55,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Text(
            "Place Order",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

Widget _priceRow(String title, double value, {bool isBold = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: isBold ? Colors.black : Colors.grey,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          "\$${value.toStringAsFixed(2)}",
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    ),
  );
}
