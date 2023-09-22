import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:spa_service/utils/constants.dart';
import 'package:spa_service/widgets/home_page_one.dart';
import 'package:spa_service/widgets/home_page_three.dart';
import 'package:spa_service/widgets/home_page_two.dart';

class RequestServiceFlow extends StatefulWidget {
  @override
  _RequestServiceFlowState createState() => _RequestServiceFlowState();
}

class _RequestServiceFlowState extends State<RequestServiceFlow> {
  int current = 0;

  void nextPage() {
    setState(() {
      current += 1;
    });
  }

  void prevPage() {
    setState(() {
      current -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      HomePageOne(nextPage: nextPage, prevPage: prevPage),
      HomePageTwo(nextPage: nextPage, prevPage: prevPage),
      HomePageThree(nextPage: nextPage, prevPage: prevPage),
    ];

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: current > 0
            ? GestureDetector(
          onTap: () {
            this.prevPage();
          },
          child: const Icon(FlutterIcons.keyboard_backspace_mdi),
        )
            : null,
        iconTheme: IconThemeData(
          color: Constants.primaryColor,
        ),
      ),
      backgroundColor: current == 0 ? Constants.primaryColor : Colors.white,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: pages[current],
      ),
    );
  }
}
