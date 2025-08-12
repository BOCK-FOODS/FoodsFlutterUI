import 'package:flutter/material.dart';
import 'package:first_practice/common/color_extension.dart';
import 'package:first_practice/common_widget/round_button.dart';
import 'package:first_practice/view/main_tabview/main_tab_view.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int selectPage = 0;
  PageController controller = PageController();

  List pageArr = [
    {
      "title": "Find Food You Love",
      "subtitle":
          "Discover the best foods from over 1,000\nrestaurants and fast delivery to your \ndoorstep",
      "image": "assets/img/delivery.png",
    },
    {
      "title": "Fast Delivery",
      "subtitle": "Fast food delivery to your home, office\nwherever you are",
      "image": "assets/img/delivery.png",
    },
    {
      "title": "Live Tracking",
      "subtitle":
          "Real time tracking of your food on the app\nonce you place the order",
      "image": "assets/img/delivery.png",
    },
  ];

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        selectPage = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // This handles PageView & scrollable content
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: pageArr.length,
                itemBuilder: (context, index) {
                  var pObj = pageArr[index] as Map? ?? {};
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        Image.asset(
                          pObj["image"].toString(),
                          width: media.width * 0.5,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 20),
                        // Dot indicators
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: pageArr.asMap().entries.map((entry) {
                            int dotIndex = entry.key;
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              height: 8,
                              width: dotIndex == index ? 20 : 8,
                              decoration: BoxDecoration(
                                color: dotIndex == index
                                    ? TColor.primary
                                    : TColor.placeholder,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          pObj["title"].toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          pObj["subtitle"].toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Bottom button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              child: RoundButton(
                title: selectPage >= 2 ? "Get Started" : "Next",
                onPressed: () {
                  if (selectPage >= 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (Context) => const MainTabView(),
                      ),
                    );
                  } else {
                    controller.animateToPage(
                      selectPage + 1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
