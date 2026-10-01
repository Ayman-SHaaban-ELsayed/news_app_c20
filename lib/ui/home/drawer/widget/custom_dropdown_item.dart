import 'package:flutter/material.dart';
import 'package:news_app_c20/utlis/app_colors.dart';
import 'package:news_app_c20/utlis/app_styles.dart';
import 'package:news_app_c20/utlis/size_utils.dart';

class CustomDropdownItem extends StatelessWidget {
  final String text;
  final ValueChanged<String?> onChanged;
  final List<DropdownMenuItem<String>> items;

  const CustomDropdownItem({
    super.key,
    required this.text,
    required this.onChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * .04),
      margin: EdgeInsets.symmetric(horizontal: width * .04),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.whiteColor, width: 2),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          items: items,
          onChanged: onChanged,
          value: text,
          icon: Icon(
            Icons.arrow_drop_down_outlined,
            size: 25,
            color: AppColors.whiteColor,
          ),
          dropdownColor: AppColors.blackColor,
          style: AppStyles.medium20White,
          isExpanded: true,
        ),
      ),

      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      // Text(text, style: AppStyles.medium20White),
      // IconButton(
      //   onPressed: onPerssed,
      //   icon: Icon(
      //     Icons.arrow_drop_down_outlined,
      //     size: 25,
      //     color: AppColors.whiteColor,
      //   ),
      // ),
      // ],
      // )
    );
  }
}
