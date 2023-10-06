import 'package:flutter/material.dart';

import '../../components/common_layout.dart';
import 'components/watches_screen_content.dart';

class WatchesScreen extends StatelessWidget {
  const WatchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
        title: 'Shoes Collection',
        body: const WatchesScreenContent()
    );
  }
}
