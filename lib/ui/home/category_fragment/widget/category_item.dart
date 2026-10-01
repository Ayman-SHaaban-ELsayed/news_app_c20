import 'package:flutter/material.dart';
import 'package:news_app_c20/api/model/category/category.dart';
import 'package:news_app_c20/l10n/app_localizations.dart';
import 'package:news_app_c20/providers/app_language_provider.dart';
import 'package:news_app_c20/utlis/app_colors.dart';
import 'package:news_app_c20/utlis/size_utils.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category, required this.index});

  final int index;
  final Category category;

  @override
  Widget build(BuildContext context) {
    var langProvider = Provider.of<AppLanguageProvider>(context);
    var width = context.width;
    var height = context.height;
    var isEven = (index % 2 == 0);
    var isArabic = langProvider.appLanguage == 'ar';
    return Stack(
      alignment: isEven
          ? AlignmentDirectional.bottomEnd
          : AlignmentDirectional.bottomStart,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Transform.flip(
            flipX: isArabic,
            child: Image.asset(category.imagePath),
          ),
        ),
        Column(
          children: [
            Text(category.title, style: Theme.of(context).textTheme.bodyLarge),
            SizedBox(height: height * .05),
            Container(
              padding: EdgeInsetsDirectional.only(
                start:isEven ? width * 0.04 : 0,
                end: !isEven ? width * 0.04 : 0 ,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: width * .04,
                vertical: height * .02,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: AppColors.greyColor,
              ),
              child: Row(
                spacing: width * .04,
                mainAxisSize: MainAxisSize.min,
                textDirection:!isArabic? (isEven ? TextDirection.ltr : TextDirection.rtl):(isEven ? TextDirection.rtl : TextDirection.ltr),
                children: [
                   Text(
                    AppLocalizations.of(context)!.view_alls,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Icon(
                      isEven
                          ? Icons.arrow_forward_ios_outlined
                          : Icons.arrow_back_ios_outlined,
                      size: 25,
                      color: Theme.of(context).splashColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
