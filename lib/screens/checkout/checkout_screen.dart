import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/welcome/welcome_screen.dart';

import '../../../providers/checkout_provider.dart';
import '../../controllers/checkout_controllers.dart';
import '../../providers/cart_provider.dart';
import '../../res/image_strings.dart';
import '../../res/text_strings.dart';
import 'components/custom_stepper.dart';

class CheckOutScreen extends StatelessWidget {
  CheckOutScreen({super.key, required this.cartProvider});

  final CheckoutControllers controllers = CheckoutControllers();
  final CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    final checkoutProvider = Provider.of<CheckoutProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Check Out',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: checkoutProvider.isCompleted
          ? WelcomeScreen(
              title: titleThankYouScreen,
              btnText: txtBackToHome,
              img: imgThankYou,
              subTitle: subtitleThankYouScreen,
            )
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: CustomStepper(
                checkoutProvider: checkoutProvider,
                controllers: controllers,
                cartProvider: cartProvider,
              ),
            ),
    );
  }
}
