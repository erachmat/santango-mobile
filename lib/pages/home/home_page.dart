import 'package:dapurgo/colors.dart';
import 'package:dapurgo/pages/account/account_page.dart';
import 'package:dapurgo/pages/auth/sign_up_page.dart';
import 'package:dapurgo/pages/cart/cart_history.dart';
import 'package:dapurgo/pages/home/main_food_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  // late PersistentTabController _controller;

  List pages = [
    MainFoodPage (),
    // SignUpPage(),
    CartHistory(),
    AccountPage()
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = PersistentTabController(initialIndex: 0);
  // }

  // List<Widget> _buildScreens() {
  //   return [
  //     MainFoodPage (),
  //     Container(child: Center(child: Text("Next Page"))),
  //     CartHistory(),
  //     Container(child: Center(child: Text("Next Next Next Page"))),
  //   ];
  // }

  // List<PersistentBottomNavBarItem> _navBarsItems() {
  //   return [
  //     PersistentBottomNavBarItem(
  //         icon: Icon(CupertinoIcons.home),
  //         title: ("Home"),
  //         activeColorPrimary: CupertinoColors.activeBlue,
  //         inactiveColorPrimary: CupertinoColors.systemGrey),
  //     PersistentBottomNavBarItem(
  //         icon: Icon(CupertinoIcons.archivebox_fill),
  //         title: ("History"),
  //         activeColorPrimary: CupertinoColors.activeBlue,
  //         inactiveColorPrimary: CupertinoColors.systemGrey),
  //     PersistentBottomNavBarItem(
  //         icon: Icon(CupertinoIcons.cart_fill),
  //         title: ("Cart"),
  //         activeColorPrimary: CupertinoColors.activeBlue,
  //         inactiveColorPrimary: CupertinoColors.systemGrey),
  //     PersistentBottomNavBarItem(
  //         icon: Icon(CupertinoIcons.person),
  //         title: ("Profile"),
  //         activeColorPrimary: CupertinoColors.activeBlue,
  //         inactiveColorPrimary: CupertinoColors.systemGrey)
  //   ];
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return PersistentTabView(context,
  //       controller: _controller,
  //       screens: _buildScreens(),
  //       items: _navBarsItems(),
  //       confineInSafeArea: true,
  //       backgroundColor: Colors.white,
  //       handleAndroidBackButtonPress: true,
  //       resizeToAvoidBottomInset: true,
  //       stateManagement: true,
  //       hideNavigationBarWhenKeyboardShows: true,
  //       decoration: NavBarDecoration(
  //         borderRadius: BorderRadius.circular(10.0),
  //         colorBehindNavBar: Colors.white
  //       ),
  //       popAllScreensOnTapOfSelectedTab: true,
  //       popActionScreens: PopActionScreensType.all,
  //       itemAnimationProperties: ItemAnimationProperties(
  //         duration: Duration(milliseconds: 200),
  //         curve: Curves.ease
  //       ),
  //     screenTransitionAnimation: ScreenTransitionAnimation(
  //       animateTabTransition: true,
  //       curve: Curves.ease,
  //       duration: Duration(milliseconds: 200)
  //     ),
  //     navBarStyle: NavBarStyle.style1,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColor.mainColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedFontSize: 0.0,

        selectedFontSize: 0.0,
        currentIndex: _selectedIndex,
        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),
            label: "home"
          ),
          // BottomNavigationBarItem(icon: Icon(Icons.archive),
          //     label: "history"
          // ),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),
              label: "cart"
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person),
              label: "profile"
          ),
        ],
      ),
    );
  }
}
