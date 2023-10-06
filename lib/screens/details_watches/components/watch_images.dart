import 'package:flutter/material.dart';

import '../../../models/watches.dart';

class WatchImages extends StatelessWidget {
  WatchImages({Key? key, required this.watches}) : super(key: key);

  Watches watches;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Expanded(
          child: PageView.builder(
            itemCount: watches.imgPaths.length,
            itemBuilder: (context, index) {
              return Image.asset(
                watches.imgPaths[index],
                fit: BoxFit.contain,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(watches.desc),
        ),
      ],
    );
  }
}
