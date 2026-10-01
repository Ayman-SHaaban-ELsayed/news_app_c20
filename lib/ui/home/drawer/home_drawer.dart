import 'package:flutter/material.dart';
import 'package:news_app_c20/l10n/app_localizations.dart';
import 'package:news_app_c20/providers/app_language_provider.dart';
import 'package:news_app_c20/providers/app_theme_provider.dart';
import 'package:news_app_c20/ui/home/drawer/widget/custom_dropdown_item.dart';
import 'package:news_app_c20/ui/home/drawer/widget/divider_item.dart';
import 'package:news_app_c20/ui/home/drawer/widget/drawer_item.dart';
import 'package:news_app_c20/utlis/app_assets.dart';
import 'package:news_app_c20/utlis/app_colors.dart';
import 'package:news_app_c20/utlis/app_styles.dart';
import 'package:news_app_c20/utlis/size_utils.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.onDrawerClick});

  final VoidCallback onDrawerClick;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var width = context.width;
    var height = context.height;
    return Column(
      spacing: height * .02,
      children: [
        Container(
          width: double.infinity,
          height: height * .2,
          color: AppColors.whiteColor,
          child: Center(
            child: Text(
              AppLocalizations.of(context)!.app_name,
              style: AppStyles.bold24Black,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            //todo go to home
        onDrawerClick();
          },
          child: DrawerItem(
            iconName: AppAssets.homeIcon,
            text: AppLocalizations.of(context)!.go_to_home,
          ),
        ),
        DividerItem(),
        DrawerItem(
          iconName: AppAssets.themeIcon,
          text: AppLocalizations.of(context)!.theme,
        ),
        //todo bottom sheet or: DropDown Bottom
        CustomDropdownItem(
          text: themeProvider.isDark()
              ? AppLocalizations.of(context)!.dark
              : AppLocalizations.of(context)!.light,
          items: [
            DropdownMenuItem(
              value: AppLocalizations.of(context)!.dark,
              child: Text(AppLocalizations.of(context)!.dark),
            ),
            DropdownMenuItem(
              value: AppLocalizations.of(context)!.light,
              child: Text(AppLocalizations.of(context)!.light),
            ),
          ],
          onChanged: (newValue) {
            if (newValue != null) {
              if (newValue == AppLocalizations.of(context)!.dark) {
                themeProvider.changeTheme(ThemeMode.dark);
              } else {
                themeProvider.changeTheme(ThemeMode.light);
              }
            }
          },
        ),
        DividerItem(),
        DrawerItem(
          iconName: AppAssets.languageIcon,
          text: AppLocalizations.of(context)!.language,
        ),
        //todo bottom sheet or: DropDown Bottom
        CustomDropdownItem(
          text: languageProvider.appLanguage == 'en'
              ? AppLocalizations.of(context)!.english
              : AppLocalizations.of(context)!.arabic,
          items: [
            DropdownMenuItem(
              value: AppLocalizations.of(context)!.english,
              child: Text(AppLocalizations.of(context)!.english),
            ),
            DropdownMenuItem(
              value: AppLocalizations.of(context)!.arabic,
              child: Text(AppLocalizations.of(context)!.arabic),
            ),
          ],
          onChanged: (newValue) {
            if (newValue != null) {
              if (newValue == AppLocalizations.of(context)!.english) {
                languageProvider.changeLanguage("en");
              } else {
                languageProvider.changeLanguage("ar");
              }
            }
          },
        ),
      ],
    );
  }
}
