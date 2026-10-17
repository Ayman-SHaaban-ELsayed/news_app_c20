
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_c20/api/model/api_constants.dart';
import 'package:news_app_c20/api/model/category/category.dart';
import 'package:news_app_c20/api/retrofit/model/api_services.dart';
import 'package:news_app_c20/ui/home/category_details/sources/source_tab.dart';
import 'package:news_app_c20/ui/widgets/main_error_widget.dart';
import 'package:news_app_c20/ui/widgets/main_loading_widget.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key, required this.category});

  final Category category;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  // SourceViewModel viewModel = SourceViewModel();
@override
  // void initState() {
  //   // TODO: implement initState
  //   viewModel.getSources(widget.category.id);
  // super.initState();
  // }
  @override
  Widget build(BuildContext context) {

      //todo without MVVM :
      return   FutureBuilder(
        // future: ApiManager.getSources(widget.category.id),
        future: ApiServices(Dio()).getSources(ApiConstants.apiKey,widget.category.id),
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
                ApiServices(Dio()).getSources(ApiConstants.apiKey,widget.category.id);
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
                ApiServices(Dio()).getSources(ApiConstants.apiKey,widget.category.id);
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
