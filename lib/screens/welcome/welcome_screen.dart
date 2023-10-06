import 'package:flutter/material.dart';

import '../../components/my_button.dart';
import '../../res/image_strings.dart';
import '../../res/text_strings.dart';
import '../home/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({
    Key? key,
    this.img,
    this.title,
    this.btnText,
    this.subTitle,
  }) : super(key: key);

  String? img = imgWelcome;
  String? title = titleWelcome;
  String? subTitle = subTitleWelcome;
  String? btnText = txtShopNow;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                img!,
                width: width * 0.7,
                height: height * 0.5,
              ),
              Text(
                title!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                subTitle!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //Shop Now Button
              MyButton(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                ),
                btnText: btnText!,
                screenName: 'Welcome',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
