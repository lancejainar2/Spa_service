import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:spa_service/pages/request_service_flow.dart';
import 'package:spa_service/utils/helper.dart';
import 'package:spa_service/widgets/input_widget.dart';
import 'package:spa_service/widgets/primary_button.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          InputWidget(
            hintText: "Email",
            suffixIcon: FlutterIcons.mail_oct,
          ),
          const SizedBox(
            height: 15.0,
          ),
          InputWidget(
            hintText: "Password",
            suffixIcon: FlutterIcons.lock_oct,
            obscureText: true,
          ),
          const SizedBox(
            height: 25.0,
          ),
          PrimaryButton(
            text: "Login",
            onPressed: () {
              Helper.nextPage(context, RequestServiceFlow());
            },
          )
        ],
      ),
    );
  }
}
