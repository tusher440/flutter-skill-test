import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import '../category_provider/cart_provider.dart';
import '../category_provider/category_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'cart_page_2.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with TickerProviderStateMixin {
  void initState() {
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    productProvider.getdata();

    // TODO: implement initState
    super.initState();
    // _fetchData();
  }

  List _get = [];

  List images = [
    "facebook.png",
    "instragram.jpeg",
    "massenger.png",
    "massenger.png",
    "massenger.png",
  ];

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    TabController _tabController = TabController(length: 5, vsync: this);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "MARENGOO",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage2()));
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                        size: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      isScrollable: true,
                      labelPadding: EdgeInsets.only(left: 14, right: 11),
                      controller: _tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(
                          text: "NEW IN",
                        ),
                        Tab(
                          text: "MENS",
                        ),
                        Tab(
                          text: "WOMENS",
                        ),
                        Tab(
                          text: "KIDS",
                        ),
                        Tab(
                          text: "ACCESSORIES",
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  width: double.maxFinite,
                  height: 300,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (_, index) {
                            return Container(
                              height: 300,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage("img/" + images[index]),
                                  )),
                            );
                          }),
                      ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: productProvider.data_list.length,
                          itemExtent: 120,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CartPage2()));
                                    },
                                    child: Container(
                                      height: 200,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: productProvider.data_list.length != null
                                              ? NetworkImage(productProvider
                                                  .data_list[index]['image']
                                                  .toString())
                                              : NetworkImage(
                                                  'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg',
                                                ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${productProvider.data_list![index]["title"]}", //categoryList.categoryName.toString(),
                                    style: TextStyle(color: Colors.black),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            );
                          }),
                      ListView.builder(
                          itemCount: 3,
                          itemBuilder: (_, index) {
                            return Container(
                              height: 300,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage("img/" + images[index]),
                                  )),
                            );
                          }),
                      ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (_, index) {
                            return Container(
                              height: 300,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage("img/" + images[index]),
                                  )),
                            );
                          }),
                      ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (_, index) {
                            return Container(
                              height: 300,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage("img/" + images[index]),
                                  )),
                            );
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 6,
          child: Container(
              height: 60,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 100,
                          onPressed: () {
                            setState(() {
                              // Navigator.pushAndRemoveUntil(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => BottomNavBar(
                              //           currentTab: 0,
                              //           currentScreen: HomeScreen(),
                              //         )),
                              //         (route) => false);
                              //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 0,currentScreen: Home_Page(),)));
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.home,
                                color: Colors
                                    .purple, //currentTab == 0 ? Colors.amber,//: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 100,
                          onPressed: () {
                            setState(() {
                              // Navigator.pushAndRemoveUntil(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => BottomNavBar(
                              //           currentTab: 1,
                              //           currentScreen: MyWishList(),
                              //         )),
                              //         (route) => false);
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.search_outlined,
                                color: Colors
                                    .grey, //currentTab == 1 ? Colors.amber : Colors.grey,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),

                    // Right Tab bar icons

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 100,
                          onPressed: () {
                            setState(() {
                              // Navigator.pushAndRemoveUntil(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => BottomNavBar(
                              //           currentTab: 2,
                              //           currentScreen: HistoryScreen(),
                              //         )),
                              //         (route) => false);
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.favorite_border,
                                color: Colors
                                    .grey, //currentTab == 2 ? Colors.amber: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                        MaterialButton(
                            minWidth: 80,
                            onPressed: () {
                              setState(() {
                                // Navigator.pushAndRemoveUntil(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => BottomNavBar(
                                //           currentTab: 3,
                                //           currentScreen: ProfileScreen(),
                                //         )),
                                //         (route) => false);
                              });
                            },
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                   Icon(
                                    Icons.account_circle,
                                    color: Colors
                                        .grey, //currentTab == 3 ? Colors.amber : Colors.grey,
                                  ),

                                ]))
                      ],
                    ),
                  ])),
        ),
      ),
    );
  }
}
