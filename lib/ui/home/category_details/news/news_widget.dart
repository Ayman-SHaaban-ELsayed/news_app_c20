import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c20/api/model/sources/sources.dart';
import 'package:news_app_c20/di/di.dart';
import 'package:news_app_c20/l10n/app_localizations.dart';
import 'package:news_app_c20/ui/home/category_details/news/cubit/cubit_news_states.dart';
import 'package:news_app_c20/ui/home/category_details/news/cubit/cubit_news_view_model.dart';
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
  CubitNewsViewModel cubitNewsViewModel = CubitNewsViewModel(newsRepositoryContract: injectNewsRepository());

  @override
  void initState() {
    // Note: implement initState
    super.initState();
    cubitNewsViewModel.getNewsBySourceId(widget.source.id ?? '');
  }

  @override
  void didUpdateWidget(covariant NewsWidget oldWidget) {
    //Note: update when tap changes:
    super.didUpdateWidget(oldWidget);
    if (oldWidget.source.id != widget.source.id) {
      cubitNewsViewModel.getNewsBySourceId(widget.source.id ?? '');
    }
  }

  Widget build(BuildContext context) {
    //Note: Consumer:
    return BlocConsumer(
      bloc: cubitNewsViewModel,
      buildWhen: (previous, current) {
        if (current is NewsInitialState) {
          return false;
        }
        return true;
      },
      listenWhen: (previous, current) {
        /*  Note:
             مثلا لو انا التست لودنج نفذ الlistener
             غير كدة نفذ البلدر
   */
        if (current is NewsLoadingState) {
          //Note يعنى اول مال استيت تبقى لودنج نفذ اللى فاللسنر
          return true;
        }
        return false;
      },
      listener: (context, state) {
        if (state is NewsLoadingState) {
          //Note: alert Dialog or Toast
        } else if (state is NewsErrorState) {
        } else if (state is NewsSuccessState) {
          //Note: toast alert snack  navigate
        }
      },
      builder: (context, state) {
        if (state is NewsErrorState) {
          return MainErrorWidget(
            errorMessage: state.errorMessage,
            onPressed: () {
              cubitNewsViewModel.getNewsBySourceId(widget.source.id! ?? '');
            },
          );
        } else if (state is NewsSuccessState) {
          var newsList = state.newsList;
          return newsList.isEmpty
              ? Center(
                  child: Text(
                    AppLocalizations.of(context)!.no_news_found,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return NewsItem(news: newsList[index]);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: context.height * 0.02);
                  },
                  itemCount: newsList.length, // newsList.length,
                );
        } else {
          return MainLoadingWidget();
        }
      },
    );
    //Note: BlocBuilder
    // return BlocBuilder<CubitNewsViewModel, CubitNewsStates>(
    //   bloc:cubitNewsViewModel,
    //   builder: (context, state) {
    //     if (state is NewsErrorState) {
    //       return MainErrorWidget(
    //         errorMessage: state.errorMessage,
    //         onPressed: () {
    //           cubitNewsViewModel.getNewsBySourceId(widget.source.id! ?? '');
    //         },
    //       );
    //     } else if (state is NewsSuccessState) {
    //       var newsList = state.newsList ;
    //             return newsList.isEmpty
    //                 ? Center(
    //                     child: Text(
    //                       AppLocalizations.of(context)!.no_news_found,
    //                       style: Theme.of(context).textTheme.headlineMedium,
    //                     ),
    //                   )
    //                 : ListView.separated(
    //                     itemBuilder: (context, index) {
    //                       return  NewsItem(news: newsList[index]);
    //                     },
    //                     separatorBuilder: (context, index) {
    //                       return SizedBox(height: context.height * 0.02);
    //                     },
    //                     itemCount:newsList.length,// newsList.length,
    //                   );
    //
    //
    //
    //
    //
    //
    //     } else {
    //       return MainLoadingWidget();
    //     }
    //   },
    // );
   /*

    */

    //Note : Provider:
    // return FutureBuilder(
    //   future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       //todo loading
    //       return MainLoadingWidget();
    //     } else if (snapshot.hasError) {
    //       //todo error
    //       return MainErrorWidget(
    //         errorMessage: snapshot.error.toString(),
    //         onPressed: () {
    //           ApiManager.getNewsBySourceId(widget.source.id ?? '');
    //           setState(() {});
    //         },
    //       );
    //     } else if (snapshot.data?.status != "ok") {
    //       //todo error =>server =>response
    //       return MainErrorWidget(
    //         errorMessage: snapshot.data!.message!,
    //         onPressed: () {
    //           ApiManager.getNewsBySourceId(widget.source.id ?? '');
    //           setState(() {});
    //         },
    //       );
    //     } else {
    //       //todo server response is success
    //       var newsList = snapshot.data?.articles ?? [];
    //       return newsList.isEmpty
    //           ? Center(
    //               child: Text(
    //                 AppLocalizations.of(context)!.no_news_found,
    //                 style: Theme.of(context).textTheme.headlineMedium,
    //               ),
    //             )
    //           : ListView.separated(
    //               itemBuilder: (context, index) {
    //                 return  NewsItem(news: newsList[index]);
    //               },
    //               separatorBuilder: (context, index) {
    //                 return SizedBox(height: context.height * 0.02);
    //               },
    //               itemCount:5,// newsList.length,
    //             );
    //     }
    //   },
    // );
  }
}
