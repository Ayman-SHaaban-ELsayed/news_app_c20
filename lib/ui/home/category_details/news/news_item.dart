import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app_c20/api/model/news/news.dart';
import 'package:news_app_c20/l10n/app_localizations.dart';
import 'package:news_app_c20/utlis/app_styles.dart';
import 'package:news_app_c20/utlis/size_utils.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;

    return Container(
      padding: EdgeInsets.all(width * .02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).splashColor, width: 2),
      ),
      margin: EdgeInsets.symmetric(horizontal: width * .04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: height * .02,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              // height:height*.25,
              imageUrl: news.urlToImage ?? '',
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text(news.title ?? '', style: Theme.of(context).textTheme.labelLarge),
          Row(
            children: [
              Expanded(
                child: Text(
                  '${AppLocalizations.of(context)!.by} : ${news.author}',
                  style: AppStyles.medium12Gray,
                ),
              ),
              Text(
                DateFormat('dd/MMM/yyyy')
                    .format(DateTime.parse(news.publishedAt ?? ''))
                    .toString(),
                style:AppStyles.medium12Gray,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
