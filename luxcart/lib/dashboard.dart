import 'package:flutter/material.dart';
import 'abi_1.dart';
import 'cart_page.dart';
import 'favorite_data.dart';
import 'profile_page.dart';

class Dashboard extends StatefulWidget {
  final int currentindex;
  const Dashboard({super.key, required this.currentindex});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectIndex = 0;
  @override
  void initState(){
    selectIndex=widget.currentindex;
    super.initState();
  }
  final List<Widget> screen = [
    MyWidget(),
    CartPage(),
    FavoritesPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screen[selectIndex],
          //Bottom Navigation bar
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white,
                //color: Colors.white.withOpacity(0.95),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectIndex = 0;
                      });
                    },
                    child: Icon(
                      selectIndex == 0 ? Icons.home_outlined : Icons.home_outlined,
                      color: selectIndex == 0 ? Colors.black : Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectIndex = 1;
                      });
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (_) => const CartPage(),
                      //   ),
                      // );
                    },
                    child: Icon(
                      selectIndex == 1
                          ? Icons.shopping_cart_outlined
                          : Icons.shopping_cart_outlined,
                      color: selectIndex == 1 ? Colors.black : Colors.grey,
                    ),
                  ),
                  //Icon(Icons.shopping_cart_outlined, color: Colors.grey),
                  //Icon(Icons.shopping_bag_outlined, color: Colors.grey),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectIndex = 2;
                      });
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (_) => const FavoritesPage(),
                      //   ),
                      // );
                    },
                    child: Icon(
                      selectIndex == 2
                          ? Icons.favorite_outline_outlined
                          : Icons.favorite_outline_outlined,
                      color: selectIndex == 2 ? Colors.black : Colors.grey,
                    ),
                  ),

                  //Icon(Icons.favorite_outline_outlined, color: Colors.grey),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectIndex = 3;
                      });
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (_) => const FavoritesPage(),
                      //   ),
                      // );
                    },
                    child: Icon(
                      selectIndex == 3 ? Icons.person : Icons.person_outlined,
                      color: selectIndex == 3 ? Colors.black : Colors.grey,
                    ),
                  ),
                  // Icon(Icons.person_outline, color: Colors.grey),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
