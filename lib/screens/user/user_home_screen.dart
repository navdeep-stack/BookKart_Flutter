import 'package:book/screens/user/cart_screen.dart';
import 'package:book/screens/user/category_list_page.dart';
import 'package:book/screens/user/favourite_screen.dart';
import 'package:book/screens/user/my_profile.dart';
import 'package:book/screens/user/user_orders_screen.dart';
import 'package:book/widgets/_common/custom_appbar.dart';
import 'package:flutter/material.dart';

class UserHomeScreen extends StatelessWidget {
  UserHomeScreen({Key? key}) : super(key: key);
  final ValueNotifier selectedIndex = ValueNotifier(0);
  final List<Widget> _screens = [
    const CategoryListPage(),
    FavouriteScreen(),
    const CartScreen(),
    const UserOrders(),
    const MyProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(
        showAddButton: false,
        showLogout: false,
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: selectedIndex,
        builder: (BuildContext context, dynamic value, Widget? child) {
          return BottomNavigationBar(
            selectedItemColor: Theme.of(context).primaryColor,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            onTap: (v) {
              selectedIndex.value = v;
            },
            currentIndex: value,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "",
              ),
            ],
          );
        },
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedIndex,
        builder: (BuildContext context, dynamic value, Widget? child) {
          return _screens[value];
        },
      ),
    );
  }
}
