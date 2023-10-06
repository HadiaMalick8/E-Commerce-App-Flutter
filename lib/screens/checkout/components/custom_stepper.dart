import 'package:flutter/material.dart';

import '../../../controllers/checkout_controllers.dart';
import '../../../providers/cart_provider.dart';
import '../../../providers/checkout_provider.dart';
import 'order_summary.dart';

class CustomStepper extends StatelessWidget {
  final CheckoutProvider checkoutProvider;
  final CheckoutControllers controllers;
  final CartProvider cartProvider;

  const CustomStepper({
    super.key,
    required this.checkoutProvider,
    required this.controllers,
    required this.cartProvider,
  });

  List<Widget> generateFormFields(
      List<TextEditingController> controllers, List<String> labels) {
    return List.generate(controllers.length, (index) {
      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: TextFormField(
          controller: controllers[index],
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: labels[index],
          ),
        ),
      );
    });
  }

  List<Step> generateSteps(CheckoutProvider checkoutProvider) {
    final shippingFields = generateFormFields(
      [
        controllers.firstNameController,
        controllers.lastNameController,
        controllers.addressController,
        controllers.cityController,
        controllers.postCodeController,
      ],
      ['First Name', 'Last Name', 'Address', 'City', 'Post Code'],
    );

    final paymentFields = generateFormFields(
      [
        controllers.creditCardNumberController,
        controllers.cardholdersNameController,
      ],
      ['Credit Card Number', "Cardholder's Name"],
    );

    return [
      Step(
        state: checkoutProvider.currentStep > 0
            ? StepState.complete
            : StepState.indexed,
        isActive: checkoutProvider.currentStep >= 0,
        title: const Text('Shipping Information'),
        content: Column(
          children: shippingFields,
        ),
      ),
      Step(
        state: checkoutProvider.currentStep > 1
            ? StepState.complete
            : StepState.indexed,
        isActive: checkoutProvider.currentStep >= 1,
        title: const Text('Payment Information'),
        content: Column(
          children: paymentFields,
        ),
      ),
      Step(
        isActive: checkoutProvider.currentStep >= 2,
        title: const Text('Order Confirmation'),
        content: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Shipping Information:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              OrderSummary(
                firstNameController: controllers.firstNameController,
                lastNameController: controllers.lastNameController,
                addressController: controllers.addressController,
                postCodeController: controllers.postCodeController,
                cityController: controllers.cityController,
              ),
              const SizedBox(height: 16),
              const Text(
                'Payment Information:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              OrderSummary(
                creditCardNumberController:
                    controllers.creditCardNumberController,
                cardholdersNameController:
                    controllers.cardholdersNameController,
              ),
              const SizedBox(height: 16),
              const Text(
                'Items in Cart:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              for (var cartItem in cartProvider.cartItems)
                Text('${cartItem.product.name} x ${cartItem.quantity}'),
              const SizedBox(height: 16),
              const Text(
                'Total Amount:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text('\$${cartProvider.calculateTotalAmount().toString()}'),
            ],
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stepper(
        type: StepperType.vertical,
        steps: generateSteps(checkoutProvider),
        currentStep: checkoutProvider.currentStep,
        onStepContinue: () => checkoutProvider.goToNextStep(),
        onStepCancel: () => checkoutProvider.goToPreviousStep(),
        controlsBuilder: checkoutProvider.buildControls,
      ),
    );
  }
}
