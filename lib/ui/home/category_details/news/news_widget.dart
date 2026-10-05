import 'package:flutter/material.dart';
import 'package:news_app_c20/api/model/sources/sources.dart';
import 'package:news_app_c20/l10n/app_localizations.dart';
import 'package:news_app_c20/ui/home/category_details/news/news_item.dart';
import 'package:news_app_c20/ui/home/category_details/news/news_view_model.dart';
import 'package:news_app_c20/ui/widgets/main_error_widget.dart';
import 'package:news_app_c20/ui/widgets/main_loading_widget.dart';
import 'package:news_app_c20/utlis/size_utils.dart';
import 'package:provider/provider.dart';

class NewsWidget extends StatefulWidget {
  final Sources source;

  const NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsViewModel viewModel = NewsViewModel();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    viewModel.getNewsBySourceID(widget.source.id ?? '');
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        viewModel.getNewsBySourceID(widget.source.id ?? '', isLoadMore: true);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsViewModel>(
        child:Container(),// Text("Hello", style: Theme.of(context).textTheme.headlineMedium),
        builder: (context, value, child) {
          //value ==ViewModel
          if (value.isLoading&& !value.isFetchingMore) {
            //todo LOading
            return MainLoadingWidget();
          } else if (value.errorMessage != null && value.newsList == null) {


            //من ناحية الكلاينت او السيرفر Todo
            return MainErrorWidget(
              errorMessage: value.errorMessage!,
              onPressed: () {
                viewModel.getNewsBySourceID(widget.source.id ?? '');
              },
            );
          } else if (viewModel.newsList == null) {
            return MainLoadingWidget();
          } else {
            //todo success
            var newsList = value.newsList ?? [];
            return newsList.isEmpty
                ? Center(
                    child: Text(
                      AppLocalizations.of(context)!.no_news_found,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  )
                : ListView.separated(
              controller: _scrollController,
              itemBuilder: (context, index) {
                if (index == newsList.length) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(context.height * 0.02),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return Column(
                        children: [
                          child!,
                          NewsItem(news: newsList[index]),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: context.height * 0.02);
                    },
              itemCount: newsList.length + (value.isFetchingMore ? 1 : 0), // newsList.length,
                  );
          }
        },
      ),
      //   , child: FutureBuilder(
      //   // future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
      //   future: DioManager.getNewsBySourceId(widget.source.id ?? ''),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       //todo loading
      //       return MainLoadingWidget();
      //     } else if (snapshot.hasError) {
      //       //todo error
      //       return MainErrorWidget(
      //         errorMessage: snapshot.error.toString(),
      //         onPressed: () {
      //           // ApiManager.getNewsBySourceId(widget.source.id ?? '');
      //           DioManager.getNewsBySourceId(widget.source.id ?? '');
      //           setState(() {});
      //         },
      //       );
      //     } else if (snapshot.data?.status != "ok") {
      //       //todo error =>server =>response
      //       return MainErrorWidget(
      //         errorMessage: snapshot.data!.message!,
      //         onPressed: () {
      //           // ApiManager.getNewsBySourceId(widget.source.id ?? '');
      //           DioManager.getNewsBySourceId(widget.source.id ?? '');
      //           setState(() {});
      //         },
      //       );
      //     } else {
      //       //todo server response is success
      //       var newsList = snapshot.data?.articles ?? [];
      //       return newsList.isEmpty
      //           ? Center(
      //         child: Text(
      //           AppLocalizations.of(context)!.no_news_found,
      //           style: Theme
      //               .of(context)
      //               .textTheme
      //               .headlineMedium,
      //         ),
      //       )
      //           : ListView.separated(
      //         itemBuilder: (context, index) {
      //           return NewsItem(news: newsList[index]);
      //         },
      //         separatorBuilder: (context, index) {
      //           return SizedBox(height: context.height * 0.02);
      //         },
      //         itemCount: 5, // newsList.length,
      //       );
      //     }
      //   },
      // ),
    );
  }
}
