import 'package:flutter/material.dart';
import 'package:spa_service/utils/constants.dart';
import 'package:spa_service/widgets/page_indicator.dart';
import 'package:spa_service/widgets/thankyou_page.dart';

class HomePageThree extends StatefulWidget {
  final Function? nextPage;
  final Function? prevPage;

  const HomePageThree({this.nextPage, this.prevPage});

  @override
  _HomePageThreeState createState() => _HomePageThreeState();
}

class _HomePageThreeState extends State<HomePageThree> {
  final List options = [
    {
      "name": "Nico Robin",
      "icon": "assets/images/employee1 (1).jpg",
      "key": "phone",
      "description": "5 years Experience, Therapist / Aestheticians"
    },
    {
      "name": "Nami D. Roger",
      "icon": "assets/images/employee2 (1).jpg",
      "key": "chat",
      "description": "3 years Experience, Therapist / Nail Technician",
    },
    {
      "name": "No Preference",
      "icon": "assets/images/therapist (1).png",
      "key": "repair",
      "description": "On-site Selection",
    },
  ];

  String active = "";

  void setActiveFunc(String key) {
    setState(() {
      active = key;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          PageIndicator(
            activePage: 3,
            darkMode: false,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            "Would you like to pick SPA Attendants now?",
            style: TextStyle(
              color: Constants.primaryColor,
              fontSize: 28.0,
              fontWeight: FontWeight.w600,
              height: 1.2,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Column(
                children: options.map((e) {
                  int index = options.indexOf(e);
                  return serviceCard(options[index], active, setActiveFunc);
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget serviceCard(Map item, String active, Function setActive) {
    bool isActive = active == item["key"];
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setActive(item["key"]);
          navigateToThankYouPage();
        },
        child: AnimatedContainer(
          margin: const EdgeInsets.only(bottom: 15.0),
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF283643) : Constants.greyColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  item["icon"],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item["name"],
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                      color: isActive
                          ? Colors.white
                          : const Color.fromRGBO(20, 20, 20, 0.96),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    item["description"],
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0,
                      color: isActive
                          ? Colors.white
                          : const Color.fromRGBO(20, 20, 20, 0.96),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void navigateToThankYouPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ThankYouPage()),
    );
  }
}
