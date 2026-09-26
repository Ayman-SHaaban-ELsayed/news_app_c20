import 'package:flutter/material.dart';
import 'package:news_app_c20/api/api_manager.dart';
import 'package:news_app_c20/ui/home/category_details/sources/source_tab.dart';
import 'package:news_app_c20/ui/widgets/main_error_widget.dart';
import 'package:news_app_c20/ui/widgets/main_loading_widget.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          //todo loading
          return MainLoadingWidget();
        } else if (snapshot.hasError) {
          //todo error handle
          return MainErrorWidget(
            errorMessage: snapshot.error.toString(),
            onPressed: () {
              ApiManager.getSources();
              setState(() {});
            },
          );
        } else if (snapshot.data?.status != 'ok') {
          //todo error response from server
          return MainErrorWidget(
            errorMessage: snapshot.data!.message!,
            onPressed: () {
              ApiManager.getSources();
              setState(() {});
            },
          );
        } else {
          //todo success response from server
          var sourceList = snapshot.data?.sources ?? [];
          return SourceTab(sourceList: sourceList);
        }
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
