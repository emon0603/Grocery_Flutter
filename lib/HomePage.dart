import 'package:flutter/material.dart';

// Example pages
import 'Pages/CartPage.dart';
import 'Pages/DashBoard.dart';
import 'Pages/Explore.dart';
import 'Pages/FavouritePage.dart';
import 'Pages/ProfilePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Pages for each tab
  final List<Widget> _pages = [
    const DashBoard(),
    const Explore(),
    const CartPage(),
    const FavouritePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Show current page
      body: _pages[_selectedIndex],

      // Bottom Navigation Bar with rounded top corners
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,      // ripple off
            highlightColor: Colors.transparent,   // highlight off
          ),
          child: BottomNavigationBar(
            elevation: 5,
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed, // animation off
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.black,
            selectedIconTheme: const IconThemeData(size: 28),
            unselectedIconTheme: const IconThemeData(size: 24),
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },

            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("images/icons/ic_home.png"),
                  size: 24,
                  color: Colors.black,
                ),
                activeIcon: ImageIcon(
                  AssetImage("images/icons/ic_home.png"),
                  color: Colors.green,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("images/icons/ic_search.png"),
                  size: 24,
                  color: Colors.black,
                ),
                activeIcon: ImageIcon(
                  AssetImage("images/icons/ic_search.png"),
                  color: Colors.green,
                ),
                label: "Explore",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("images/icons/ic_cart.png"),
                  size: 24,
                  color: Colors.black,
                ),
                activeIcon: ImageIcon(
                  AssetImage("images/icons/ic_cart.png"),
                  color: Colors.green,
                ),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("images/icons/ic_favourite.png"),
                  size: 24,
                  color: Colors.black,
                ),
                activeIcon: ImageIcon(
                  AssetImage("images/icons/ic_favourite.png"),
                  color: Colors.green,
                ),
                label: "Favourite",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("images/icons/ic_account.png"),
                  size: 24,
                  color: Colors.black,
                ),
                activeIcon: ImageIcon(
                  AssetImage("images/icons/ic_account.png"),
                  color: Colors.green,
                ),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
