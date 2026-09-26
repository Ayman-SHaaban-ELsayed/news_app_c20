import 'package:flutter/material.dart';
import 'package:news_app_c20/l10n/app_localizations.dart';
import 'package:news_app_c20/utlis/app_colors.dart';
import 'package:news_app_c20/utlis/size_utils.dart';

class MainErrorWidget extends StatelessWidget {
  const MainErrorWidget({
    super.key,
    required this.errorMessage,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    return Column(
      spacing: height * 0.04,
      children: [
        Text(errorMessage, style: Theme.of(context).textTheme.labelLarge),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.greyColor),
          onPressed: onPressed,
          child: Text(
            AppLocalizations.of(context)!.try_again,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
