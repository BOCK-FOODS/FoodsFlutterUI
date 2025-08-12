import 'package:flutter/material.dart';

class Food extends StatefulWidget {
  const Food({super.key});

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  bool isMinRsSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Orange header
              Container(
                height: 260,
                decoration: const BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28),
                  ),
                ),
                child: Column(
                  children: [
                    _buildTopBar(),
                    _buildSearchBar(),
                    _buildFestivalBanner(),
                    // NOTE: Offers Row moved out for visibility
                  ],
                ),
              ),
              //_buildOffersRow(),
              _buildFilterTabs(),
              //const SizedBox(height: 20),
              _buildItemCards(),
              _buildCategoryHeader(),
              _buildCategoryScroll(),
              _buildCategory(),
              _buildItem(),
              _buildFilterChips(),
              _buildRestaurantList(),
              // Add placeholders for other widgets below as needed
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(Icons.location_on, color: Colors.white),
              SizedBox(width: 4),
              Text(
                "Harshitha N",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.keyboard_arrow_down, color: Colors.white),
            ],
          ),
          const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Colors.orange),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              height: 50,
              child: Row(
                children: const [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 8),
                  Text(
                    "Search for 'Pizza'",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.mic, color: Colors.orange),
          ),
          const SizedBox(width: 8),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: const [
                Text("VEG", style: TextStyle(color: Colors.green)),
                SizedBox(width: 4),
                Icon(Icons.check_box, color: Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFestivalBanner() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      //child: SizedBox(
      // height: 80,
      // child: Image.asset('assets/images/south_thali.jpg'),
      //child: Placeholder(),
      //),
    );
  }

  // Widget _buildOffersRow() {
  //   final offers = [
  //     // "Dishes From ₹29",
  //     //"Flat ₹125 OFF",
  //     //"Food In 10 Mins",
  //     //"Meals at ₹99",
  //   ];
  //   final icons = [Icons.flash_on, Icons.percent, Icons.bolt, Icons.star];

  //   return Container(
  //     //color: Colors.deepOrange,
  //     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: List.generate(
  //         offers.length,
  //         (index) => Column(
  //           children: [
  //             Icon(icons[index], color: Colors.white),
  //             const SizedBox(height: 4),
  //             Text(
  //               offers[index],
  //               style: const TextStyle(color: Colors.white, fontSize: 12),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildFilterTabs() {
    return Transform.translate(
      offset: const Offset(0, -10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isMinRsSelected = true;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              margin: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color: isMinRsSelected
                    ? const Color(0xFFFFE8C6)
                    : const Color(0xFFD6D6D6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'MIN Rs. 100 OFF',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: isMinRsSelected ? Colors.black : Colors.grey[800],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isMinRsSelected = false;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              margin: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color: !isMinRsSelected
                    ? const Color(0xFFFFE8C6)
                    : const Color(0xFFD6D6D6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '10 MINS DELIVERY',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: !isMinRsSelected ? Colors.black : Colors.grey[800],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildItemCards() {
  final items = [
    {
      "name": "Theobroma",
      "price": "₹49",
      "category": "Desserts",
      "image": "assets/category/1.png",
    },
    {
      "name": "Chaayos",
      "price": "₹104",
      "category": "Beverages",
      "image": "assets/category/2.png",
    },
    {
      "name": "CakeZone",
      "price": "₹69",
      "category": "Bakery",
      "image": "assets/category/3.png",
    },
    {
      "name": "Pizza Hut",
      "price": "₹149",
      "category": "Pizza",
      "image": "assets/category/4.png",
    },
    {
      "name": "KFC",
      "price": "₹199",
      "category": "Fried Chicken",
      "image": "assets/category/5.png",
    },
    {
      "name": "Burger King",
      "price": "₹89",
      "category": "Burgers",
      "image": "assets/category/6.png",
    },
    {
      "name": "Starbucks",
      "price": "₹129",
      "category": "Coffee",
      "image": "assets/category/7.png",
    },
  ];

  return SizedBox(
    height: 210,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          width: 140,
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 4)],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image with Heart Icon
              Stack(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          item['image'] ?? 'assets/default.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Heart Icon at top right
                  Positioned(
                    top: 6,
                    right: 6,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.favorite_border,
                        size: 18,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              // Card Content
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ITEMS AT ${item['price']}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      item['name'] ?? "",
                      style: const TextStyle(fontSize: 14),
                    ),
                    Text(
                      item['category'] ?? "",
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

Widget _buildCategoryHeader() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "What’s on your mind?",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget _buildCategoryScroll() {
  final categories = ["Biryani", "Pizza", "Burger", "Ice Cream", "Fries"];

  return SizedBox(
    height: 100,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(right: 12),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.orange[100],
                radius: 30,
                child: Icon(Icons.fastfood, color: Colors.orange),
              ),
              SizedBox(height: 4),
              Text(categories[index]),
            ],
          ),
        );
      },
    ),
  );
}

Widget _buildCategory() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "More on Bock",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget _buildItem() {
  final items = [
    {"image": "assets/images/1.png"},
    {"image": "assets/images/2.png"},
    {"image": "assets/images/3.png"},
    {"image": "assets/images/4.png"},
    {"image": "assets/images/5.png"},
    {"image": "assets/images/6.png"},
    {"image": "assets/images/7.png"},
    {"image": "assets/images/8.png"},
  ];
  return SizedBox(
    height: 100,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        // final item = items[index];
        return Container(
          width: 80,
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 4)],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Replace with actual image
              Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  image: DecorationImage(
                    image: AssetImage('assets/images/8.png'), // Add image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start),
              ),
            ],
          ),
        );
      },
    ),
  );
}

Widget _buildFilterChips() {
  final List<Map<String, dynamic>> filters = [
    {"label": "Filter", "icon": Icons.filter_list},
    {"label": "Sort by", "icon": Icons.swap_vert},
    {"label": "Food in 10 mins", "icon": Icons.flash_on},
    {"label": "Cuisines", "icon": Icons.restaurant},
  ];

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((filter) {
          return Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 6),
                Text(
                  filter['label']!,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
                if (filter['label'] == "Sort by")
                  const Icon(Icons.keyboard_arrow_down, size: 16),
              ],
            ),
          );
        }).toList(),
      ),
    ),
  );
}

Widget _buildRestaurantList() {
  final restaurants = [
    {
      "name": "Meghana Foods",
      "image": "https://source.unsplash.com/800x600/?biryani",
      "rating": 4.3,
      "cuisine": "Biryani, North Indian, Chinese",
      "time": "30 mins",
    },
    {
      "name": "Empire Restaurant",
      "image": "https://source.unsplash.com/800x600/?indian-food",
      "rating": 4.2,
      "cuisine": "South Indian, Grill, Fast Food",
      "time": "25 mins",
    },
    {
      "name": "KFC",
      "image": "https://source.unsplash.com/800x600/?kfc",
      "rating": 4.1,
      "cuisine": "Fried Chicken, Burger",
      "time": "20 mins",
    },
    {
      "name": "Truffles",
      "image": "https://source.unsplash.com/800x600/?burger",
      "rating": 4.4,
      "cuisine": "Burgers, Italian, Desserts",
      "time": "28 mins",
    },
    {
      "name": "McDonald's",
      "image": "https://source.unsplash.com/800x600/?mcdonalds",
      "rating": 4.0,
      "cuisine": "Fast Food, Burgers, Beverages",
      "time": "22 mins",
    },
  ];

  return ListView.builder(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(), // Let parent scroll view handle it
    itemCount: restaurants.length,
    itemBuilder: (context, index) {
      final restaurant = restaurants[index];
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                restaurant['image'] as String,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant['name'] as String,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    restaurant['cuisine'] as String,
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      const SizedBox(width: 4),
                      Text("${restaurant['rating']}"),
                      const SizedBox(width: 10),
                      Text("•"),
                      const SizedBox(width: 10),
                      Text(restaurant['time'] as String),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
