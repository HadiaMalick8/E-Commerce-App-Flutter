import 'package:flutter/material.dart';

class CheckoutControllers {

  CheckoutControllers();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController postCodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController creditCardNumberController = TextEditingController();
  final TextEditingController cardholdersNameController = TextEditingController();

  // Constructor for disposing controllers when no longer needed
  CheckoutControllers.dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    postCodeController.dispose();
    cityController.dispose();
    creditCardNumberController.dispose();
    cardholdersNameController.dispose();
  }
}
