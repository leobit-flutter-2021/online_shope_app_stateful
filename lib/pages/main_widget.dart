import 'package:flutter/material.dart';
import 'package:online_shop_app/pages/store/cart_page.dart';
import 'package:online_shop_app/pages/home_page/home_page.dart';
import 'package:provider/provider.dart';
import '../state.dart';
import 'account_page/account_page.dart';
import 'settings_page.dart';

class FullHomePage extends StatelessWidget {
  const FullHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(0),
      body: const HomePage(),
      bottomNavigationBar: getBottomNavBar(0, context),
    );
  }
}

class FullCartPage extends StatelessWidget {
  const FullCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(1),
      body: const CartPage(),
      bottomNavigationBar: getBottomNavBar(1, context),
    );
  }
}

class FullAccountPage extends StatelessWidget {
  const FullAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(2),
      body: const AccountPage(),
      bottomNavigationBar: getBottomNavBar(2, context),
    );
  }
}

class FullSettingsPage extends StatelessWidget {
  const FullSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(3),
      body: const SettingsPage(),
      bottomNavigationBar: getBottomNavBar(3, context),
    );
  }
}

getAppBar(int currentScreenIndex) {
  switch (currentScreenIndex) {
    case 1:
      return PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: Consumer<ColorModeState>(
          builder: (context, cart, child) {
            return AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: cart.getBackgrundColor(),
              title: Center(
                child: Text(
                  "CART",
                  style: TextStyle(
                      color: cart.getItemColor(),
                      fontSize: 26,
                      fontWeight: FontWeight.normal),
                ),
              ),
            );
          },
        ),
      );

    case 2:
      return PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: Consumer<ColorModeState>(
          builder: (context, cart, child) {
            return AppBar(
              elevation: 0.8,
              automaticallyImplyLeading: false,
              backgroundColor: cart.getBackgrundColor(),
              title: Center(
                child: Text(
                  "ACCOUNT",
                  style: TextStyle(
                      color: cart.getItemColor(),
                      fontSize: 26,
                      fontWeight: FontWeight.normal),
                ),
              ),
            );
          },
        ),
      );
    case 3:
      return PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: Consumer<ColorModeState>(
          builder: (context, cart, child) {
            return AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: cart.getBackgrundColor(),
              title: Center(
                child: Text(
                  "SETTINGS",
                  style: TextStyle(
                      color: cart.getItemColor(),
                      fontSize: 26,
                      fontWeight: FontWeight.normal),
                ),
              ),
            );
          },
        ),
      );

    default:
      return null;
  }
}

Widget getBottomNavBar(currentScreenIndex, context) {
  List navBarItems = [
    {"icon": Icons.home, "size": 32.0},
    {"icon": Icons.shopping_cart, "size": 32.0},
    {"icon": Icons.person, "size": 32.0},
    {"icon": Icons.settings, "size": 32.0}
  ];

  List pages = [
    const FullHomePage(),
    const FullCartPage(),
    const FullAccountPage(),
    const FullSettingsPage()
  ];

  return Consumer<ColorModeState>(builder: (context, cart, child) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
          color: cart.getBackgrundColor(),
          border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.2)))),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(navBarItems.length, (index) {
              return IconButton(
                  icon: Icon(
                    navBarItems[index]['icon'],
                    size: navBarItems[index]['size'],
                    color: currentScreenIndex == index
                        ? Colors.amberAccent.shade700
                        : cart.getItemColor(),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => pages[index]),
                    );
                  });
            })),
      ),
    );
  });
}
