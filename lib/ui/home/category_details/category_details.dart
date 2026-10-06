import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c20/api/model/category/category.dart';
import 'package:news_app_c20/ui/home/category_details/news/cubit/cubit_news_view_model.dart';
import 'package:news_app_c20/ui/home/category_details/sources/cubit/cubit_source_states.dart';
import 'package:news_app_c20/ui/home/category_details/sources/cubit/cubit_source_view_model.dart';
import 'package:news_app_c20/ui/home/category_details/sources/source_tab.dart';
import 'package:news_app_c20/ui/widgets/main_error_widget.dart';
import 'package:news_app_c20/ui/widgets/main_loading_widget.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key, required this.category});

  final Category category;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CubitSourceViewModel cubitSourceViewModel = CubitSourceViewModel();
  CubitNewsViewModel cubitNewsViewModel = CubitNewsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubitSourceViewModel.getSources(widget.category.id);

  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     cubitNewsViewModel.getNewsBySourceId(widget.sourceList[selectedIndex].id!);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    //note: block: CubitSourceViewModel  , states :
    return BlocBuilder<CubitSourceViewModel, CubitSourceStates>(
      bloc: cubitSourceViewModel,
      //note: ===> or wrap by BBlockBuilder if more than widget use the same bloc
      builder: (context, state) {
        if (state is SourceSuccessState) {
          //       //todo success response from server
          var sourceList = state.sourcesList ?? [];
          return SourceTab(sourceList: sourceList);
        } else if (state is SourceErrorState) {
          //NOTE: ERROR
          return MainErrorWidget(
            errorMessage: state.errorMessage.toString(),
            onPressed: () {
              cubitSourceViewModel.getSources(widget.category.id);
            },
          );
        } else {
          //NOTE:  loading
          return MainLoadingWidget();
        }
      },
    );
    // return FutureBuilder(
    //   future: ApiManager.getSources(widget.category.id),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       //todo loading
    //       return MainLoadingWidget();
    //     } else if (snapshot.hasError) {
    //       //todo error handle
    //       return MainErrorWidget(
    //         errorMessage: snapshot.error.toString(),
    //         onPressed: () {
    //           ApiManager.getSources(widget.category.id);
    //           setState(() {});
    //         },
    //       );
    //     } else if (snapshot.data?.status != 'ok') {
    //       //todo error response from server
    //       return MainErrorWidget(
    //         errorMessage: snapshot.data!.message!,
    //         onPressed: () {
    //           ApiManager.getSources(widget.category.id);
    //           setState(() {});
    //         },
    //       );
    //     } else {
    //       //todo success response from server
    //       var sourceList = snapshot.data?.sources ?? [];
    //       return SourceTab(sourceList: sourceList);
    //     }
    //   },
    // );
  }
}

//ListView.builder(
//             itemBuilder: (context, index) {
//               return Text(
//                 sourceList[index].name ?? '',
//                 style: Theme.of(context).textTheme.labelLarge,
//               );
//             },
//             itemCount: sourceList.length,
//           );
