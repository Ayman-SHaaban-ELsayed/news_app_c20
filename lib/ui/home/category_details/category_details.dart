import 'package:flutter/material.dart';
import 'package:news_app_c20/api/dio/dio_manager.dart';
import 'package:news_app_c20/api/model/category/category.dart';
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
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // future: ApiManager.getSources(widget.category.id),
      future: DioManager.getSources(widget.category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          //todo loading
          return MainLoadingWidget();
        } else if (snapshot.hasError) {
          //todo error handle
          return MainErrorWidget(
            errorMessage: snapshot.error.toString(),
            onPressed: () {
              // ApiManager.getSources(widget.category.id);
              DioManager.getSources(widget.category.id);
              setState(() {});
            },
          );
        } else if (snapshot.hasData == true) {
          var sourceList = snapshot.data?.sources ?? [];
          return SourceTab(sourceList: sourceList);
        }
        //fixme only in http not in dio and use hasData instead   as an option 1 to show server
        //message other than 200errors
        else if (snapshot.data?.status != 'ok') {
          //todo error response from server
          return MainErrorWidget(
            errorMessage: snapshot.data!.message!,
            onPressed: () {
              // ApiManager.getSources(widget.category.id);
              DioManager.getSources(widget.category.id);
              setState(() {});
            },
          );
        } else {
          //todo success response from server
          var sourceList = snapshot.data?.sources ?? [];
          return SourceTab(sourceList: sourceList);
        }
        //end fixme
        ///////
      },
    );
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
