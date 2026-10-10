import 'package:flutter/cupertino.dart';
import 'package:news_app_c20/l10n/app_localizations.dart';
import 'package:news_app_c20/utlis/app_assets.dart';

class Category {
  String id, title;
  String imagePath;

  static List<Category> getCategoriesList(bool isDark,BuildContext context) {
    return [
      Category(
        id: 'general',
        title:  AppLocalizations.of(context)!.general,
        imagePath: isDark
            ? AppAssets.generalLightImage
            : AppAssets.generalDarkImage,
      ),
      Category(
        id: 'business',
        title:  AppLocalizations.of(context)!.business ,
        imagePath: isDark
            ? AppAssets.businessLightImage
            : AppAssets.businessDarkImage,
      ),
      Category(
        id: 'sports',
        title:  AppLocalizations.of(context)!.sports ,
        imagePath: isDark
            ? AppAssets.sportsLightImage
            : AppAssets.sportsDarkImage,
      ),
      Category(
        id: 'technology',
        title:  AppLocalizations.of(context)!.technology ,
        imagePath: isDark
            ? AppAssets.technologyLightImage
            : AppAssets.technologyDarkImage,
      ),
      Category(
        id: 'science',
        title:  AppLocalizations.of(context)!.science ,
        imagePath: isDark
            ? AppAssets.scienceLightImage
            : AppAssets.scienceDarkImage,
      ),
      Category(
        id: 'health',
        title:   AppLocalizations.of(context)!.health ,
        imagePath: isDark
            ? AppAssets.healthLightImage
            : AppAssets.healthDarkImage,
      ),
      Category(
        id: 'entertainment',
        title: AppLocalizations.of(context)!.entertainment,
        imagePath: isDark
            ? AppAssets.entertainmentLightImage
            : AppAssets.entertainmentDarkImage,
      ),
    ];
  }

  Category({required this.id, required this.title, required this.imagePath});
}
