import 'package:flutter/material.dart';
import 'package:first_practice/view/home/home_view.dart';
import 'package:first_practice/view/home/food/food_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomeView(),
    const Center(child: Text("Food", style: TextStyle(fontSize: 30))),
    const Center(child: Text("Instamart", style: TextStyle(fontSize: 30))),
    const Center(child: Text("Dineout", style: TextStyle(fontSize: 30))),
    const Center(child: Text("Reorder", style: TextStyle(fontSize: 30))),
  ];

  void _onItemTap(int index) {
    if (index == 1) {
      // Navigate to a new screen with its own bottom navigation
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FoodNavigation()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: 'Food'),
          BottomNavigationBarItem(icon: Icon(Icons.dining), label: 'Instamart'),
          BottomNavigationBarItem(
            icon: Icon(Icons.dinner_dining),
            label: 'Dineout',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.reorder), label: 'Reorder'),
        ],
      ),
    );
  }
}

// ✅ Separate page with its own bottom navigation
class FoodNavigation extends StatefulWidget {
  const FoodNavigation({super.key});

  @override
  State<FoodNavigation> createState() => _FoodNavigationState();
}

class _FoodNavigationState extends State<FoodNavigation> {
  int _foodIndex = 0;

  final List<Widget> _foodTabs = [
    // const Center(child: Text('🍔 Food', style: TextStyle(fontSize: 24))),
    const Food(),

    const Center(child: Text('🍔 Bolt', style: TextStyle(fontSize: 24))),
    const Center(child: Text('📝 Eatlist', style: TextStyle(fontSize: 24))),
    const Center(child: Text('💪 HighProtein', style: TextStyle(fontSize: 24))),
    const Center(child: Text('🔁 Reorder', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Section"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // 👈 Go back to main navigation
          },
        ),
      ),
      body: _foodTabs[_foodIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _foodIndex,
        onTap: (int index) {
          setState(() {
            _foodIndex = index;
          });
        },
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank_outlined),
            label: 'Food',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.flash_on), label: 'Bolt'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Eatlist'),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'HighProtein',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.refresh), label: 'Reorder'),
        ],
      ),
    );
  }
}
