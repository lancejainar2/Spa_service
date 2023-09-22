import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spa_service/utils/constants.dart';

class PageIndicator extends StatelessWidget {
  final int activePage;
  final bool darkMode;
  PageIndicator({required this.activePage, this.darkMode = true});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        3,
            (index) => Container(
          width: ScreenUtil().setWidth(9.0),
          height: ScreenUtil().setHeight(9.0),
          margin: const EdgeInsets.only(right: 10.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: darkMode
                ? (Colors.white
                .withOpacity(index == (activePage - 1) ? 1 : 0.56))
                : (index == (activePage - 1)
                ? Constants.primaryColor
                : const Color.fromRGBO(151, 154, 155, 1)),
          ),
        ),
      ),
    );
  }
}
