import 'package:flutter/material.dart';
import 'favorite_data.dart';
import 'favorites_page.dart';
import 'notification_page.dart';
import 'product_detail_screen.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool showSideImages = false;
  int selectedCategoryIndex = 0;
  final List<String> categories = ["Trending", "Shoes", "bag", "Shirts"];
  late final List<List<String>> categoriesimage = [
    [
      "assets/img_3.png",
      "assets/img_4.png",
      "assets/img_5.png",
      "assets/img_6.png",
    ],
    [
      "assets/shoes_1.png",
      "assets/shoes_3.png",
      "assets/shoes_4.png",
      "assets/shoes_2.png",
    ],
    [
      "assets/bag_2.png",
      "assets/bag_3.png",
      "assets/bag_4.png",
      "assets/bag_5.png",
    ],
    [
      "assets/shirt_2.png",
      "assets/shirt_3.png",
      "assets/shirt_4.png",
      "assets/shirt_5.png",
    ],
  ];
  late final List<List<String>> categoriesprices = [
    ["\$100.00", "\$179.00", "\$140.00", "\$95.00"],
    ["\$129.00", "\$159.00", "\$109.00", "\$189.00"],
    ["\$189.00", "\$169.00", "\$109.00", "\$195.00"],
    ["\$149.00", "\$139.00", "\$119.00", "\$169.00"],
  ];
  late final List<List<String>> categoriesproductNames = [
    [
      "Men/s Black\nHoodie",
      "Men/s Grey\nHoodie",
      "Men/s Blue\nHoodie",
      "Men/s Brown\nHoodie",
    ],
    [
      "Men/s Running\nShoes",
      "Men/s Casual\nShoes",
      "Men/s Sneakers\nShoes",
      "Men/s Sports\nShoes",
    ],
    [
      "Men/s Office\nBag",
      "Men/s Travele\nBag",
      "Men/s Backpack\nBag",
      "Men/s Leather\nBag",
    ],
    [
      "Men/s Casuart\nShirt",
      "Men/s Forma\nShirt",
      "Men/s Denim\nShirt",
      "Men/s Cottont\nShirt",
    ],
  ];

  final List<String> categoriesprice = [
    "prise\n\$199.00",
    "prise\n\$189.00",
    "prise\n\$149.00",
    "prise\n\$139.00",
  ];

  late final List<List<String>> categoriesdescription = [
    [
      "Premium cotton hoodie with a soft inner lining. Perfect for \ndaily wear.",
      "Stylish hoodie with modern fit and breathable fabric.",
      "Comfortable hoodie suitable for all seasons.",
      "Classic hoodie design with durable stitching.",
    ],
    [
      "Lightweight running shoes with cushioned sole.",
      "Casual shoes designed for everyday comfort.",
      "Trendy sneakers with flexible grip.",
      "Durable sports shoes for active lifestyle.",
    ],
    [
      "Spacious office bag with multiple compartments.",
      "Strong travel bag with premium zip quality.",
      "Comfortable backpack with padded straps.",
      "Stylish leather bag with premium finish.",
    ],
    [
      "Soft cotton shirt for casual wear.",
      "Formal shirt with a clean modern look.",
      "Denim shirt with durable fabric.",
      "Breathable shirt suitable for all-day comfort.",
    ],
  ];
  late final List<Widget> page;

  @override
  void initState() {
    super.initState();
    page = [
      Trendingwidget(
        mainImage: 'assets/img_2.png',
        productName: "Men/s Pullover\nHoodie",
        backgroundColor: Colors.amber,
        extraImage: categoriesimage[0],
        price: categoriesprice[0],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(
                mainImage: 'assets/img_2.png',
                image: [
                  'assets/img_2.png',
                  "assets/hoodie_2.png",
                  "assets/hoodie_1.png",
                  "assets/hoodie_3.png",
                  "assets/hoodie_4.png",
                ],
                backgroundColor: Colors.amber,
                productName: "Men/s Pullover\nHoodie",
                productprice: "\$199.00",
                size: 'Select Size',
                decoration:
                    "Premium cotton blend hoodie designed for warmth and \ndurability.A versatile essential that pairs style with everyday \ncomfort.",
                issize: false,
                viewimage: [
                  'assets/hoodie_1.png',
                  'assets/hoodie_2.png',
                  'assets/hoodie_3.png',
                  'assets/hoodie_4.png',
                ],
                ProductNameSize: '',
                showSideImages: true,

                // viewbackground:Colors.amber,
                //isshoes: true,
              ),
            ),
          );
        },
        prices: categoriesprices[0],
        categoryIndex: 0,
        productNames: categoriesproductNames[0],
        description: categoriesdescription[0],
      ),

      Trendingwidget(
        mainImage: 'assets/shoes_5.png',
        productName: "Men/s Pullover\nShoes",
        backgroundColor: Colors.grey.shade400,
        extraImage: categoriesimage[1],
        price: categoriesprice[1],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(
                mainImage: 'assets/shoes_5.png',
                image: [
                  'assets/shoes_5.png',
                  'assets/shoes_a1.png',
                  'assets/shoes_a2.png',
                  'assets/shoes_a3.png',
                  'assets/shoes_a4.png',
                ],
                backgroundColor: Colors.grey.shade400,
                productName: "Men/s Pullover\nShoes",
                productprice: "\$129.00",
                size: 'Select Size',
                decoration:
                    'Comfortable everyday shoes with a stylish, modern design.\nTrendy look with all-day comfort and durability.',
                issize: false,
                viewimage: [
                  'assets/shoes_a1.png',
                  'assets/shoes_a2.png',
                  'assets/shoes_a3.png',
                  'assets/shoes_a4.png',
                ],
                ProductNameSize: '',
                showSideImages: true,
                // viewbackground:  Colors.grey.shade400,
                // isshoes: true,
              ),
            ),
          );
        },
        prices: categoriesprices[1],
        categoryIndex: 1,
        productNames: categoriesproductNames[1],
        description: categoriesdescription[1],
      ),
      Trendingwidget(
        mainImage: 'assets/bag_1.png',
        productName: "Men/s Pullover\nBag",
        backgroundColor: Colors.grey.shade400,
        extraImage: categoriesimage[2],
        price: categoriesprice[2],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(
                mainImage: 'assets/bag_1.png',
                image: [
                  'assets/bag_1.png',
                  'assets/bag_a1.png',
                  'assets/bag_a2.png',
                  'assets/bag_a3.png',
                  'assets/bag_a4.png',
                ],
                backgroundColor: Colors.grey.shade400,
                productName: "Men/s Pullover\nBag",
                productprice: "\$119.00",
                size: '',
                decoration:
                    'Lightweight, durable, and perfect for work or travel.Strong \nbuild with smart compartments for easy organization.',
                issize: true,
                viewimage: [
                  'assets/bag_a1.png',
                  'assets/bag_a2.png',
                  'assets/bag_a3.png',
                  'assets/bag_a4.png',
                ],
                ProductNameSize: '',
                showSideImages: true,

                // viewbackground:  Colors.grey.shade400,
                //isshoes: true,
              ),
            ),
          );
        },
        prices: categoriesprices[2],
        categoryIndex: 2,
        productNames: categoriesproductNames[2],
        description: categoriesdescription[2],
      ),
      Trendingwidget(
        mainImage: 'assets/shirt_1.png',
        productName: "Men/s Pullover\nShirts",
        backgroundColor: Colors.brown.shade200,
        extraImage: categoriesimage[3],
        price: categoriesprice[3],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(
                mainImage: 'assets/shirt_1.png',
                image: [
                  'assets/shirt_1.png',
                  'assets/shirt_a1.png',
                  'assets/shirt_a2.png',
                  'assets/shirt_a3.png',
                  'assets/shirt_a4.png',
                ],
                backgroundColor: Colors.brown.shade200,
                productName: "Men/s Pullover\nShirts",
                productprice: "\$109.00",
                size: 'Select Size',
                decoration:
                    'Modern design with breathable fabric for all-day wear.Light\nweight cotton with a smooth finish and timeless style.',
                issize: false,
                viewimage: [
                  'assets/shirt_a1.png',
                  'assets/shirt_a2.png',
                  'assets/shirt_a3.png',
                  'assets/shirt_a4.png',
                ],
                ProductNameSize: '',
                showSideImages: true,

                // viewbackground:Colors.brown.shade200,
                // isshoes: true,
              ),
            ),
          );
        },
        prices: categoriesprices[3],
        categoryIndex: 3,
        productNames: categoriesproductNames[3],
        description: categoriesdescription[3],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 281,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage('assets/icon.png'),
                  ),

                  const Text(
                    'TRENDORA',
                    style: TextStyle(
                      color: Color.fromARGB(255, 1, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NotificationPage(),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: Color(0xFFEFF1F4),
                          child: const Icon(Icons.shopping_basket_outlined),
                        ),
                      ),
                      const Positioned(
                        right: 2,
                        top: 2,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.black,
                          child: Text(
                            "8",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 6),
              const Text(
                "Hello Tavorian",
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),

              SizedBox(height: 4),
              const Text(
                "Fashion confidence and reveals beauty.",
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),

               const SizedBox(height: 15),
             Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 48,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFF0F3F6),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(Icons.search, color: Colors.black, size: 20),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search here...',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.tune, size: 20, color: Colors.white),
                                SizedBox(width: 6),
                                Text(
                                  'Filter',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: const Color.fromARGB(
                                      255,
                                      246,
                                      245,
                                      244,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(categories.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategoryIndex = index;
                        });
                      },
                      child: _CategoryChip(
                        categories[index],
                        selectedCategoryIndex == index,
                        () {
                          setState(() {
                            selectedCategoryIndex = index;
                          });
                        },
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),

      body: Stack(children: [page[selectedCategoryIndex]]),
    );
  }
}

class FavoritesData {}

class Trendingwidget extends StatefulWidget {
  final String mainImage;
  final String productName;
  final Color backgroundColor;
  final List<String> extraImage;
  final String price;
  final VoidCallback onTap;
  final List<String> productNames;
  final List<String> prices;
  final int categoryIndex;
  final List<String> description;
  const Trendingwidget({
    super.key,
    required this.mainImage,
    required this.productName,
    required this.backgroundColor,
    required this.extraImage,
    required this.price,
    required this.onTap,
    required this.prices,
    required this.categoryIndex,
    required this.productNames,
    required this.description,

    //bool isFavorite = false,
  });

  // ignore: recursive_getters

  @override
  State<Trendingwidget> createState() => _Trendingwidget();
}

class _Trendingwidget extends State<Trendingwidget> {
  bool isFavorite = false;
  bool showSideImages = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Container(
                      height: 230,
                      decoration: BoxDecoration(
                        color: widget.backgroundColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Image.asset(
                          widget.mainImage,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          final item = FavoriteItem(
                            image: widget.mainImage,
                            name: widget.productName,
                            price: widget.price,
                          );

                          final index = FavoriteData.favorites.indexWhere(
                            (e) => e.image == widget.mainImage,
                          );

                          if (index >= 0) {
                            FavoriteData.favorites.removeAt(index);
                          } else {
                            FavoriteData.favorites.add(item);
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 250, 249, 249),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.elliptical(10, 10),
                            topRight: Radius.elliptical(6, 6),
                          ),
                        ),
                        child: Icon(
                          FavoriteData.isFavorite(widget.mainImage)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: FavoriteData.isFavorite(widget.mainImage)
                              ? Colors.red
                              : Colors.black,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF1F4),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productName,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // SizedBox(height: 4),
                        // Text(
                        //   "Comfortable & stylish",
                        //   style: TextStyle(fontSize: 12),
                        //   ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.price,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18),

              Row(
                children: [
                  _imageCard(
                    imagePath: widget.extraImage[0],
                    productName: widget.productNames[0],
                    prices: widget.prices[0],
                    description: widget.description[0],
                    onTap: () {},
                    showSideImages: false,
                  ),

                  SizedBox(width: 12),
                  _imageCard(
                    imagePath: widget.extraImage[1],
                    productName: widget.productNames[1],
                    prices: widget.prices[1],
                    description: widget.description[1],
                    onTap: () {},
                    showSideImages: false,
                  ),
                ],
              ),

              SizedBox(height: 1),

              Row(
                children: [
                  _imageCard(
                    imagePath: widget.extraImage[2],
                    productName: widget.productNames[2],
                    prices: widget.prices[2],
                    description: widget.description[2],
                    onTap: () {},
                    showSideImages: false,
                  ),

                  SizedBox(width: 12),
                  _imageCard(
                    imagePath: widget.extraImage[3],
                    productName: widget.productNames[3],
                    prices: widget.prices[3],
                    description: widget.description[3],
                    onTap: () {},
                    showSideImages: false,
                  ),
                ],
              ),
              SizedBox(height: 88),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageCard({
    required String imagePath,
    required VoidCallback onTap,
    required String prices,
    required String productName,
    required String description,
    required bool showSideImages,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailScreen(
              mainImage: imagePath,
              image: [imagePath, ...widget.extraImage],
              backgroundColor: widget.backgroundColor,
              productName: productName,
              productprice: prices,
              size: "Select Size",
              decoration: description,
              issize: false,
              showSideImages: true,
              ProductNameSize: "",
              viewimage: widget.extraImage,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F7F9),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.grey.shade300, width: 1.2),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
              width: 180,
              height: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),

            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                // onTap: () {
                //   // setState(() {
                //   //   isFavorite =!isFavorite;
                //   // });
                // },
                onTap: () {
                  setState(() {
                    final item = FavoriteItem(
                      image: imagePath,
                      name: productName,
                      price: prices,
                    );

                    final index = FavoriteData.favorites.indexWhere(
                      (e) => e.image == imagePath,
                    );

                    if (index >= 0) {
                      FavoriteData.favorites.removeAt(index);
                    } else {
                      FavoriteData.favorites.add(item);
                    }
                  });
                },

                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(10, 10),
                      topRight: Radius.elliptical(6, 6),
                    ),
                  ),
                  child: Icon(
                    //  isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                    //  color: isFavorite ? Colors.red : Colors.black,
                    // Icons.favorite_border_outlined,
                    // color: Color.fromARGB(255, 28, 28, 26),
                    // size: 18,
                    FavoriteData.isFavorite(imagePath)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: FavoriteData.isFavorite(imagePath)
                        ? Colors.red
                        : Colors.black,
                    size: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;
  const _CategoryChip(this.text, this.selected, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(9),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: selected ? Colors.orange : Colors.grey.shade100,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
class FavoriteItem {
  final String image;
  final String price;
  final String name;

  FavoriteItem({
    required this.image,
    required this.price,
    required this.name,
  });
}

class FavoriteData {
  static final List<FavoriteItem> favorites = [];

  static bool isFavorite(String image) {
    return favorites.any((item) => item.image == image);
  }

  static void toggleFavorite(FavoriteItem item) {
    if (isFavorite(item.image)) {
      favorites.removeWhere((e) => e.image == item.image);
    } else {
      favorites.add(item);
    }
  }

  static void removeAt(int index) {
    favorites.removeAt(index);
  }
}


