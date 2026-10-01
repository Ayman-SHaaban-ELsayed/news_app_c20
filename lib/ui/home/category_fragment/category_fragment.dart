import 'package:flutter/material.dart';
import 'package:news_app_c20/api/model/category/category.dart';
import 'package:news_app_c20/l10n/app_localizations.dart';
import 'package:news_app_c20/providers/app_theme_provider.dart';
import 'package:news_app_c20/ui/home/category_fragment/widget/category_item.dart';
import 'package:news_app_c20/utlis/size_utils.dart';
import 'package:provider/provider.dart';

typedef OnCategoryItemClick = void Function(Category);

class CategoryFragment extends StatelessWidget {
  CategoryFragment({super.key, required this.onCategoryItemClick});

  final OnCategoryItemClick onCategoryItemClick;
  List<Category> categoriesList = [];

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var width = context.width;
    var height = context.height;
    categoriesList = Category.getCategoriesList(themeProvider.isDark(),context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * .02,
      ),
      child: Column(
        spacing: height * .02,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.good_morning,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //todo calling callback
                    onCategoryItemClick(categoriesList[index]);  },
                  child: CategoryItem(
                    category: categoriesList[index],
                    index: index,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: height * .02);
              },
              itemCount: categoriesList.length,
            ),
          ),
        ],
      ),
    );
  }
}
