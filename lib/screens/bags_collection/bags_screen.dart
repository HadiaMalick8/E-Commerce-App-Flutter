import 'package:flutter/material.dart';

import '../../components/common_layout.dart';
import 'components/bag_screen_content.dart';

class BagsScreen extends StatelessWidget {
  const BagsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      title: 'Bags Collection',
      body: BagScreenContent(),
    );
  }
}
