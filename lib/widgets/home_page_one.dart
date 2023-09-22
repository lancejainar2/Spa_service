import 'package:flutter/material.dart';
import 'package:spa_service/utils/constants.dart';
import 'package:spa_service/widgets/page_indicator.dart';
import 'package:spa_service/widgets/thankyou_page.dart';

class HomePageOne extends StatefulWidget {
  final Function nextPage;
  final Function prevPage;

  HomePageOne({required this.nextPage, required this.prevPage});
  @override
  _HomePageOneState createState() => _HomePageOneState();
}

class _HomePageOneState extends State<HomePageOne> {
  final List options = [
    [
      {
        "name": "Facial",
        "icon": "assets/images/facial.png",
        "key": "mobile",
      },
      {
        "name": "Body Massage",
        "icon": "assets/images/massage2.png",
        "key": "tablet",
      },
    ],
    // Second
    [
      {
        "name": "Hair",
        "icon": "assets/images/hair-cutting (1).png",
        "key": "laptop",
      },
      {
        "name": "Nail",
        "icon": "assets/images/manicure (1).png",
        "key": "desktop",
      },
    ],
    // Third
    [
      {
        "name": "Hot Rock | Ventosa\nTherapy",
        "icon": "assets/images/spa (1).png",
        "key": "watch",
      },
      {
        "name": "Wax",
        "icon": "assets/images/wax (1).png",
        "key": "headphone",
      },
    ],
  ];

  String active = "";

  void setActiveFunc(String key) {
    setState(() {
      active = key;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double heightFromWhiteBg =
        size.height - 200.0 - Scaffold.of(context).appBarMaxHeight!.toDouble();
    return Container(
      height: size.height - kToolbarHeight,
      child: Stack(
        children: [
          Container(
            height: 200.0,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: FittedBox(
              child: Container(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Align(
                      alignment: Alignment.centerRight,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/profile.jpg"),
                      ),
                    ),
                    PageIndicator(activePage: 1),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Welcome to REALax SPA",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.77),
                        fontSize: 22.0,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      "Please pick your\ndesired Treatment",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 200.0,
            width: size.width,
            child: Container(
              height: heightFromWhiteBg,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
            ),
          ),
          Positioned(
            top: 200.0,
            height: heightFromWhiteBg,
            width: size.width,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  3,
                      (index) => Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: index == 2 ? 0 : 10.0),
                      child: Row(
                        children: [
                          serviceCard(options[index][0], active, setActiveFunc,
                              this.widget.nextPage),
                          const SizedBox(
                            width: 10.0,
                          ),
                          serviceCard(options[index][1], active, setActiveFunc,
                              this.widget.nextPage),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget serviceCard(Map item, String active, Function setActive, nextPage) {
  bool isActive = active == item["key"];
  return Expanded(
    child: GestureDetector(
      onTap: () {
        setActive(item["key"]);
        Future.delayed(const Duration(milliseconds: 350), () {
          nextPage();
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF59886B) : Constants.greyColor, // Set the color to the desired hex code
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              item["icon"], // Remove this line if not using SVG
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
                item["name"],
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                  color: isActive
                      ? Colors.white
                      : const Color.fromRGBO(20, 20, 20, 0.96),
                )
            )
          ],
        ),
      ),
    ),
  );
}
