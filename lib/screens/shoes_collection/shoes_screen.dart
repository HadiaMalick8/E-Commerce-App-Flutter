import 'package:flutter/material.dart';
import 'package:shop_app/components/common_layout.dart';

import 'components/shoes_screen_content.dart';

class ShoesScreen extends StatelessWidget {
  const ShoesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      title: 'Shoes Collection',
      body: const ShoesScreenContent(),
    );
  }
}
