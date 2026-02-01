// import 'package:flutter/material.dart';

// class AddCartPage extends StatefulWidget {
//   final String mainImage;
//   final String productName;
//   final String productitemname;
//   final String pricevalue;
//   final String productprice;
//   final bool issize;
//   final Color productbackground;

  

//   const AddCartPage({
//     super.key,
//     required this.mainImage,
//     required this.productName,
//     required this.productitemname,
//     required this.pricevalue,
//     required this.productbackground,
//     required this.productprice,
//     required this.issize,
    
//   });


//   @override
//   State<AddCartPage> createState() => _AddCartPageState();
// }

// class _AddCartPageState extends State<AddCartPage> {
//   int get selectedImageIndex => 0;
//   final double deliveryFee = 16.0;
  

//   double get subTotal {
//     final cleaned = widget.productprice.replaceAll(RegExp(r'[^\d.]'), '');
//     return double.tryParse(cleaned) ?? 0.0;
//   }

//   double get totalPrice => subTotal + deliveryFee;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
//             decoration: BoxDecoration(
//               color: Colors.grey.shade200,
//               borderRadius: BorderRadius.circular(22),
//             ),

//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "My Cart",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.shopping_bag_outlined,
//                         size: 16,
//                         color: Colors.black,
//                       ),
                      
//                       SizedBox(width: 6),
//                       Text(
//                         "Add To Checkout",
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 16),
//           Container(
//             padding: EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: Colors.grey.shade100,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Column(
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Row(
//                     children: [
//                       Container(
//                         height: 70,
//                         width: 70,
//                         decoration: BoxDecoration(
//                           color: widget.productbackground,
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         clipBehavior: Clip.hardEdge,
//                         child: Image.asset(
//                           widget.mainImage,
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                       SizedBox(width: 12),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               widget.productitemname,
//                               style: TextStyle(fontWeight: FontWeight.w600),
//                             ),

//                             SizedBox(height: 4),
//                             if (!widget.issize)
//                               Text(
//                                 "Size ${widget.productName}",
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 12,
//                           vertical: 10,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(14),
//                         ),
//                         child: Text(
//                           ' ${widget.pricevalue}',
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 16),
//                 Container(
//                   padding: EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(22),
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Colors.black12,
//                         blurRadius: 8,
//                         offset: Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     children: [
//                       _priceRow("Sub-total", subTotal),
//                       _priceRow("Delivery Fee", deliveryFee),
//                       const Divider(height: 20),
//                       _priceRow("Total Price", totalPrice, isBold: true),

//                       const SizedBox(height: 20),
//                       Container(
//                         height: 50,
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                           color: Colors.orange,
//                           borderRadius: BorderRadius.circular(25),
//                         ),
//                         child: Text(
//                           "Checkout",
//                           style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _priceRow(String title, double value, {bool isBold = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//               color: isBold ? Colors.black : Colors.grey,
//               fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
//             ),
//           ),
//           Text(
//             "\$${value.toStringAsFixed(2)}",
//             style: TextStyle(
//               fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
