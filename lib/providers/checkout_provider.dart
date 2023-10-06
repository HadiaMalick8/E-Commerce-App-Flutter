import 'package:flutter/material.dart';

import '../components/my_button.dart';

class CheckoutProvider extends ChangeNotifier {
  int currentStep = 0;
  bool isCompleted = false;

  void goToNextStep() {
    if (currentStep < 2) {
      currentStep++;
      notifyListeners();
    } else {
      isCompleted = true;
      notifyListeners();
    }
  }

  void goToPreviousStep() {
    if (currentStep > 0) {
      currentStep--;
      notifyListeners();
    }
  }

  Widget buildControls(BuildContext context, ControlsDetails controlsDetails) {
    final isLastStep = currentStep == 2;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Expanded(
            child: MyButton(
              btnText: isLastStep ? 'Confirm' : 'Next',
              onTap: controlsDetails.onStepContinue,
              screenName: 'CheckOut',
            ),
          ),
          const SizedBox(width: 10,),
          if (currentStep != 0)
            Expanded(
              child: MyButton(
                btnText: 'Back',
                onTap: controlsDetails.onStepCancel,
                screenName: 'CheckOut',
              ),
            ),
        ],
      ),
    );
  }
}
