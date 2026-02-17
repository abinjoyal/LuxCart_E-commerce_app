import 'package:flutter/material.dart';
import 'abi_1.dart';
import 'add_cart_page.dart';
import 'buynow_page.dart';
import 'cart_page.dart';
import 'dashboard.dart';

class ProductDetailScreen extends StatefulWidget {
  final String mainImage;
  final Color backgroundColor;
  final String productName;
  final String productprice;
  final String size;
  final String decoration;
  final bool issize;

  // ignore: non_constant_identifier_names
  final String ProductNameSize;
  final List<String> viewimage;
  final List<String> image;
  const ProductDetailScreen({
    super.key,
    required this.mainImage,
    required this.image,
    required this.backgroundColor,
    required this.productName,
    required this.productprice,
    required this.size,
    required this.decoration,
    required this.issize,
    // ignore: non_constant_identifier_names
    required this.viewimage,
    // ignore: non_constant_identifier_names
    required this.ProductNameSize,
    required bool showSideImages,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  int selectedIndex = 0;

  final List<Color> colors = [
    Colors.orange,
    Colors.black,
    Colors.lightBlueAccent,
    Colors.grey,
  ];

  int selectedSizeIndex = 0;
  final List<String> size = ["XS", "S", "M", "L", "XL", "XXL", "3XL"];

  int selectedImageIndex = 0;
  bool showSideImages = false;
  late final List<String> image = [widget.mainImage, ...widget.viewimage];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  //margin: const EdgeInsets.only(bottom: 20),
                  height: 560,
                  decoration: BoxDecoration(
                    color: widget.backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showSideImages = !showSideImages;
                          });
                        },

                        child: Center(
                          child: Image.asset(
                            widget.image[selectedImageIndex],
                            height: 400,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 10,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              size: 18,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        right: 10,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(
                              FavoriteData.isFavorite(widget.mainImage)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: FavoriteData.isFavorite(widget.mainImage)
                                  ? Colors.red
                                  : Colors.black,
                              size: 18,
                            ),
                            onPressed: () {
                              setState(() {
                                FavoriteData.toggleFavorite(
                                  FavoriteItem(
                                    image: widget.mainImage,
                                    name: widget.productName,
                                    price: widget.productprice,
                                  ),
                                );
                              });
                            },
                          ),
                        ),
                      ),

                      if (showSideImages)
                        Positioned(
                          right: 16,
                          top: 120,
                          child: Column(
                            children: List.generate(image.length, (index) {
                              final bool isSelected =
                                  index == selectedImageIndex;

                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedImageIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: isSelected
                                        ? Border.all(
                                            color: Colors.orange,
                                            width: 2,
                                          )
                                        : null,
                                  ),
                                  child: Image.asset(
                                    image[index],
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      Positioned(
                        top: 55,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Text(
                            "Details",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),
                Container(
                  // margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(12),
                  height: 500,
                  //padding: const EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.grey.shade300, width: 1.2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.productName,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (quantity > 1) {
                                        quantity--;
                                      }
                                    });
                                  },

                                  child: CircleAvatar(
                                    radius: 22,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.remove,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 6),
                                  child: Text(
                                    quantity.toString().padLeft(2, '0'),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                  child: CircleAvatar(
                                    radius: 22,
                                    backgroundColor: Colors.orange,
                                    child: Icon(
                                      Icons.add,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 24),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "From: ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),

                          Text(
                            widget.productprice,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),

                          SizedBox(width: 135),
                          Row(
                            children: List.generate(colors.length, (index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },

                                child: Container(
                                  margin: const EdgeInsets.only(left: 2),
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: selectedIndex == index
                                        ? Border.all(
                                            color: Colors.orange,
                                            width: 2,
                                          )
                                        : null,
                                  ),
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: colors[index],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.size,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          widget.issize == false
                              ? Row(
                                  children: List.generate(size.length, (index) {
                                    final bool isSelected =
                                        selectedSizeIndex == index;
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedSizeIndex = index;
                                        });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          right: 10,
                                        ),
                                        height: 40,
                                        width: 45,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: isSelected
                                              ? const Color.fromARGB(
                                                  246,
                                                  240,
                                                  135,
                                                  36,
                                                )
                                              : Colors.transparent,
                                          border: Border.all(
                                            color: isSelected
                                                ? const Color.fromARGB(
                                                    246,
                                                    240,
                                                    135,
                                                    36,
                                                  )
                                                : Colors.grey.shade300,
                                            width: isSelected ? 2 : 1,
                                          ),
                                        ),
                                        child: Text(
                                          size[index],
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: isSelected
                                                ? Colors.black
                                                : Colors.grey,
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                )
                              : SizedBox(),
                        ],
                      ),

                      SizedBox(height: 18),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 9),
                      Row(
                        //crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            widget.decoration,
                            style: TextStyle(fontSize: 13.8, height: 1.4),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: Container(
              height: 80,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                // color: Colors.white.withOpacity(0.95),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      CartData.addToCart(
                        CartItem(
                          image: widget.mainImage,
                          name: widget.productName,
                          size: size[selectedSizeIndex],
                          price:
                              double.tryParse(
                                widget.productprice.replaceAll(
                                  RegExp(r'[^\d.]'),
                                  '',
                                ),
                              ) ??
                              0,
                          qty: quantity,
                          prices: widget.productprice,
                        ),
                      );
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          // ⏱ Auto close after 1 second
                          Future.delayed(const Duration(seconds: 1), () {
                            // ignore: use_build_context_synchronously
                            if (Navigator.canPop(context)) {
                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);

                              Navigator.pushAndRemoveUntil(
                                // ignore: use_build_context_synchronously
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      const Dashboard(currentindex: 1),
                                ),
                                (route) => false,
                              );
                            }
                          });

                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 60,
                                ),

                                const SizedBox(height: 12),

                                const Text(
                                  "Added to cart successfully",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                      );

                      // showModalBottomSheet(
                      //   context: context,
                      //   isScrollControlled: true,
                      //   backgroundColor: Colors.transparent,
                      //   builder: (_) => AddCartPage(
                      //     mainImage: widget.mainImage,
                      //     productName: size[selectedSizeIndex],
                      //     productitemname: widget.productName,
                      //     pricevalue: widget.productprice,
                      //     productbackground: widget.backgroundColor,
                      //     productprice: widget.productprice,
                      //     issize: widget.issize,
                      //   ),
                      // );
                    },

                    child: Container(
                      height: 60,
                      width: 180,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),

                      child: Text(
                        "Add to cart",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckoutPage(
                            productName: size[selectedSizeIndex],
                            price: widget.productprice,
                            mainImage: widget.mainImage,
                            productitemname: widget.productName,
                            issize: widget.issize,
                            backgroundColor: widget.backgroundColor,
                            pricevalue: widget.productprice,
                            productprice: widget.productprice,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 60,
                      width: 160,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(26),
                      ),
                      child: Text(
                        "Buy Now",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
