import 'package:flutter/material.dart';
import 'package:spa_service/pages/request_service_flow.dart';
import 'package:spa_service/utils/helper.dart';
import 'package:spa_service/widgets/primary_button.dart';

class ThankYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
        const Color(0xFF59886B), // Set the app bar color to #283643
        automaticallyImplyLeading: false, // Remove back button
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/like.png', // Replace with your image path
              width: 250,
              height: 250,
            ),
            const SizedBox(height: 5.0),
            const Text(
              'Thank You!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: 20.0), // Adjust the margin as needed
              child: const Center(
                child: Text(
                  "Your appointment is currently being processed. Please wait for 3-5 minutes. You'll receive a notification when it's ready.",
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.center, // Align the text to the center
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
                width: 300.0, // Set the desired width
                height: 60.0, // Set the desired height
                child: PrimaryButton(
                  text: "Home",
                  onPressed: () {
                    Helper.nextPage(context, RequestServiceFlow());
                  },
                ))
          ],
        ),
      ),
    );
  }
}
