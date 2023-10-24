import 'package:flutter/material.dart';
import 'package:project_coffee/ui/pages/home_page/home_main_page/home_main_page.dart';
import 'package:project_coffee/ui/pages/order_page/product_list_page/product_list_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeMainPage(),
          Center(child: Text("PayPage")),
          ProductListPage(),
          Center(child: Text("Shop")),
          Center(child: Text("Other")),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.lightGreen,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Pay"),
          BottomNavigationBarItem(icon: Icon(Icons.coffee), label: "Order"),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.comment), label: "Other")
        ],
      ),
    );
  }
}
