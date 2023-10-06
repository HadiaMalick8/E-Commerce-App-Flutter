import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({
    super.key,
    required this.onTap,
    required this.btnText,
    required this.screenName,
  });

  void Function()? onTap;
  final String btnText;
  final String screenName;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              btnText,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
            ),
            if (screenName == 'Welcome')
              const Row(
                children: [
                  SizedBox(width: 30),
                  Icon(Icons.arrow_forward_ios, color: Colors.white),
                ],
              ),
          ],
        ),
      ),
    );
  }
}