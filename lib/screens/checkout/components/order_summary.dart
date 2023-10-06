import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  final TextEditingController? firstNameController;
  final TextEditingController? lastNameController;
  final TextEditingController? addressController;
  final TextEditingController? postCodeController;
  final TextEditingController? cityController;
  final TextEditingController? creditCardNumberController;
  final TextEditingController? cardholdersNameController;

  OrderSummary({
    this.firstNameController,
    this.lastNameController,
    this.addressController,
    this.postCodeController,
    this.cityController,
    this.creditCardNumberController,
    this.cardholdersNameController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (firstNameController != null)
          Text('First Name: ${firstNameController!.text}'),
        if (lastNameController != null)
          Text('Last Name: ${lastNameController!.text}'),
        if (addressController != null)
          Text('Address: ${addressController!.text}'),
        if (postCodeController != null)
          Text('Post Code: ${postCodeController!.text}'),
        if (cityController != null)
          Text('City: ${cityController!.text}'),
        if (creditCardNumberController != null)
          Text('Credit Card Number: ${creditCardNumberController!.text}'),
        if (cardholdersNameController != null)
          Text("Cardholder's Name: ${cardholdersNameController!.text}"),
        // Add other payment information fields here as needed
      ],
    );
  }
}
