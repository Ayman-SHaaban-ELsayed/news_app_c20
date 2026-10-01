import 'package:flutter/material.dart';
import 'package:news_app_c20/utlis/app_styles.dart';

import '../../../../utlis/size_utils.dart';

class DrawerItem extends StatelessWidget {
  final String iconName;
  final String text;

  const DrawerItem({super.key, required this.iconName, required this.text});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Row(
        spacing: width * .02,
        children: [
          Image.asset(iconName),
          Text(text, style: AppStyles.bold20White),
        ],
      ),
    );
  }
}
