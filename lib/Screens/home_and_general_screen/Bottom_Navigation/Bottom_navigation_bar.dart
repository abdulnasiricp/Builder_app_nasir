import 'package:buildapp/Screens/home_and_general_screen/Account/account.dart';
import 'package:buildapp/Screens/home_and_general_screen/Bottom_Navigation/dishboard.dart';
import 'package:buildapp/Screens/home_and_general_screen/bids/create_bids.dart';
import 'package:buildapp/Screens/home_and_general_screen/bids/favorites.dart';
import 'package:buildapp/Screens/home_and_general_screen/bids/my_bids.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);
  _BottomNavigationBarScreenState createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int currentTab = 0;
  final List<Widget> screens = [
    Dashboard(),
    MyBids(),
    Account(),
  ];
  final PageStorageBucket backet = PageStorageBucket();
  Widget currentScreen = Dashboard();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(child: currentScreen, bucket: backet),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.to(CreateBids());
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
            color: Colors.deepPurple,
            height: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = Dashboard();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color: currentTab == 0 ? Colors.blue : Colors.white,
                          ),
                          Text(
                            "Home",
                            style: TextStyle(
                              color:
                                  currentTab == 0 ? Colors.blue : Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = MyBids();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.work,
                            color: currentTab == 1 ? Colors.blue : Colors.white,
                          ),
                          Text(
                            "My Bids",
                            style: TextStyle(
                              color:
                                  currentTab == 1 ? Colors.blue : Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = Favorites();
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite,
                            color: currentTab == 2 ? Colors.blue : Colors.white,
                          ),
                          Text(
                            "Favorites",
                            style: TextStyle(
                              color:
                                  currentTab == 2 ? Colors.blue : Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = Account();
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_box,
                            color: currentTab == 3 ? Colors.blue : Colors.white,
                          ),
                          Text(
                            "Account",
                            style: TextStyle(
                              color:
                                  currentTab == 3 ? Colors.blue : Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
