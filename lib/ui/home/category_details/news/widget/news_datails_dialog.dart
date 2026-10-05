import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_c20/api/model/news/news.dart';
import 'package:news_app_c20/ui/widgets/main_loading_widget.dart';
import 'package:news_app_c20/utlis/size_utils.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'package:url_launcher/url_launcher.dart';

class NewsDetailsDialog extends StatelessWidget {
  final News news;

  const NewsDetailsDialog({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;

    return Dialog(
      alignment: AlignmentGeometry.bottomCenter,
      insetPadding: EdgeInsets.symmetric(horizontal: width * .04),
      child: Container(
        padding: EdgeInsets.all(width * .03),
        decoration: BoxDecoration(
          color: Theme.of(context).splashColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).splashColor, width: 2),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(8),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? '',
                progressIndicatorBuilder: (context, url, progress) {
                  return MainLoadingWidget();
                },
              ),
            ),
            SizedBox(height: height * .02),
            Text(
              news.content ?? news.description ?? '',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: height * .03),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: EdgeInsets.symmetric(vertical: height * .015),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () async {
                  //todo OUT
                  // launchUrl(Uri.parse(news.url ?? ''));
                  //todo IN  + MANIFEST
                  final url = Uri.parse(news.url ?? '');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.inAppWebView);
                  }
                },
                child: Text(
                  'View Full Article',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
