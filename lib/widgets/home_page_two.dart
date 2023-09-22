import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spa_service/utils/constants.dart';
import 'package:spa_service/widgets/home_page_three.dart';
import 'package:spa_service/widgets/input_widget.dart';
import 'package:spa_service/widgets/page_indicator.dart';
import 'package:spa_service/animations/FadeAnimation.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePageTwo extends StatefulWidget {
  final Function nextPage;
  final Function prevPage;

  HomePageTwo({required this.nextPage, required this.prevPage});

  @override
  _HomePageTwoState createState() => _HomePageTwoState();
}

class _HomePageTwoState extends State<HomePageTwo> {
  int _selectedDay = 2;
  int _selectedRepeat = 0;
  String _selectedHour = '13:30';

  ItemScrollController _scrollController = ItemScrollController();

  final List<dynamic> _days = [
    [1, 'Fri'],
    [2, 'Sat'],
    [3, 'Sun'],
    [4, 'Mon'],
    [5, 'Tue'],
    [6, 'Wed'],
    [7, 'Thu'],
    [8, 'Fri'],
    [9, 'Sat'],
    [10, 'Sun'],
    [11, 'Mon'],
    [12, 'Tue'],
    [13, 'Wed'],
    [14, 'Thu'],
    [15, 'Fri'],
    [16, 'Sat'],
    [17, 'Sun'],
    [18, 'Mon'],
    [19, 'Tue'],
    [20, 'Wed'],
    [21, 'Thu'],
    [22, 'Fri'],
    [23, 'Sat'],
    [24, 'Sun'],
    [25, 'Mon'],
    [26, 'Tue'],
    [27, 'Wed'],
    [28, 'Thu'],
    [29, 'Fri'],
    [30, 'Sat'],
    [31, 'Sun']
  ];

  final List<String> _hours = <String>[
    '10:00am',
    '10:30am',
    '11:00am',
    '11:30am',
    '12:00pm',
    '12:30pm',
    '01:00pm',
    '01:30pm',
    '02:00pm',
    '02:30pm',
    '03:00pm',
    '03:30pm',
    '04:00pm',
    '4:30pm',

  ];

  final List<String> _repeat = [
    '1 person',
    '2 persons',
    '3 persons',
    '4 persons',
    '5 or more'
  ];

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      _scrollController.scrollTo(
        index: 24,
        duration: const Duration(seconds: 3),
        curve: Curves.easeInOut,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePageThree(),
              ),
            );
          },
          child: const Icon(Icons.arrow_forward_ios),
        ),
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverToBoxAdapter(
                    child: FadeAnimation(
                      1,
                      Padding(
                        padding:
                        const EdgeInsets.only(top: 120.0, right: 20.0, left: 20.0),
                        child: Text(
                          'Select Date \nand Time',
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.grey.shade900,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ))
              ];
            },
            body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    FadeAnimation(
                        1,
                        Row(
                          children: [
                            const Text("September 2023"),
                            const Spacer(),
                            IconButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_drop_down_circle_outlined,
                                color: Colors.grey.shade700,
                              ),
                            )
                          ],
                        )),
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border:
                        Border.all(width: 1.5, color: Colors.grey.shade200),
                      ),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _days.length,
                          itemBuilder: (BuildContext context, int index) {
                            return FadeAnimation(
                                (1 + index) / 6,
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedDay = _days[index][0];
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    width: 62,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: _selectedDay == _days[index][0]
                                          ? Colors.greenAccent.shade100
                                          .withOpacity(0.5)
                                          : Colors.greenAccent.withOpacity(0),
                                      border: Border.all(
                                        color: _selectedDay == _days[index][0]
                                            ? Colors.green
                                            : Colors.white.withOpacity(0),
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          _days[index][0].toString(),
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          _days[index][1],
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                          }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                        1.2,
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(
                                width: 1.5, color: Colors.grey.shade200),
                          ),
                          child: ScrollablePositionedList.builder(
                              itemScrollController: _scrollController,
                              scrollDirection: Axis.horizontal,
                              itemCount: _hours.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedHour = _hours[index];
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: _selectedHour == _hours[index]
                                          ? Colors.greenAccent.shade100
                                          .withOpacity(0.5)
                                          : Colors.greenAccent.withOpacity(0),
                                      border: Border.all(
                                        color: _selectedHour == _hours[index]
                                            ? Colors.green
                                            : Colors.white.withOpacity(0),
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          _hours[index],
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        )),
                    const SizedBox(
                      height: 40,
                    ),
                    FadeAnimation(
                        1.2,
                        const Text(
                          "Number of Clients",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _repeat.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedRepeat = index;
                                });
                              },
                              child: FadeAnimation(
                                  (1.2 + index) / 4,
                                  Container(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: _selectedRepeat == index
                                          ? Colors.green.shade400
                                          : Colors.grey.shade100,
                                    ),
                                    margin: const EdgeInsets.only(right: 20),
                                    child: Center(
                                        child: Text(
                                          _repeat[index],
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: _selectedRepeat == index
                                                  ? Colors.white
                                                  : Colors.grey.shade800),
                                        )),
                                  )),
                            );
                          },
                        )),
                  ],
                ))));
  }
}

