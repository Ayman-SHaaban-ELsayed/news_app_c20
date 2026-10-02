import 'package:flutter/material.dart';
import 'package:news_app_c20/api/api_manager.dart';
import 'package:news_app_c20/api/dio/dio_manager.dart';
import 'package:news_app_c20/api/model/sources/sources.dart';
import 'package:news_app_c20/l10n/app_localizations.dart';
import 'package:news_app_c20/ui/home/category_details/news/news_item.dart';
import 'package:news_app_c20/ui/widgets/main_error_widget.dart';
import 'package:news_app_c20/ui/widgets/main_loading_widget.dart';
import 'package:news_app_c20/utlis/size_utils.dart';

class NewsWidget extends StatefulWidget {
  final Sources source;

  const NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
      future: DioManager.getNewsBySourceId(widget.source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          //todo loading
          return MainLoadingWidget();
        } else if (snapshot.hasError) {
          //todo error
          return MainErrorWidget(
            errorMessage: snapshot.error.toString(),
            onPressed: () {
              // ApiManager.getNewsBySourceId(widget.source.id ?? '');
              DioManager.getNewsBySourceId(widget.source.id ?? '');
              setState(() {});
            },
          );
        } else if (snapshot.data?.status != "ok") {
          //todo error =>server =>response
          return MainErrorWidget(
            errorMessage: snapshot.data!.message!,
            onPressed: () {
              // ApiManager.getNewsBySourceId(widget.source.id ?? '');
              DioManager.getNewsBySourceId(widget.source.id ?? '');
              setState(() {});
            },
          );
        } else {
          //todo server response is success
          var newsList = snapshot.data?.articles ?? [];
          return newsList.isEmpty
              ? Center(
                  child: Text(
                    AppLocalizations.of(context)!.no_news_found,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return  NewsItem(news: newsList[index]);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: context.height * 0.02);
                  },
                  itemCount:5,// newsList.length,
                );
        }
      },
    );
  }
}
