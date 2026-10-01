import 'package:flutter/material.dart';
import 'package:news_app_c20/utlis/app_colors.dart';
import 'package:news_app_c20/utlis/size_utils.dart';

class DividerItem extends StatelessWidget {
  const DividerItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    return Divider(
      color: AppColors.whiteColor,
      thickness: 2,
      indent: width * 0.06,
      endIndent: width * 0.06,
    );
  }
}
