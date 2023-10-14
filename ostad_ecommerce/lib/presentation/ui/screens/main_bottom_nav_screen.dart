import 'package:flutter/material.dart';
import '/presentation/ui/screens/wish_list_screen.dart';
import '/presentation/ui/screens/category_list_screen.dart';
import '/presentation/ui/screens/home_screen.dart';
import '/presentation/ui/utility/app_colors.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    CategoryListScreen(),
    HomeScreen(),
    WishListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.blueGrey,
        showUnselectedLabels: true,
        elevation: 4,
        currentIndex: _selectedIndex,
        onTap: (int index){
          if(mounted){
            _selectedIndex = index;
            setState(() {});
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Wishlist"),
        ],
      ),
    );
  }
}
