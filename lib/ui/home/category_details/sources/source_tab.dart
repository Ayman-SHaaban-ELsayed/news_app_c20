import 'package:flutter/material.dart';
import 'package:news_app_c20/api/model/sources/sources.dart';
import 'package:news_app_c20/di/di.dart';
import 'package:news_app_c20/ui/home/category_details/news/cubit/cubit_news_view_model.dart';
import 'package:news_app_c20/ui/home/category_details/news/news_widget.dart';
import 'package:news_app_c20/ui/home/category_details/sources/source_name.dart';
import 'package:news_app_c20/utlis/app_colors.dart';
import 'package:news_app_c20/utlis/size_utils.dart';

class SourceTab extends StatefulWidget {
  List<Sources> sourceList;

  SourceTab({super.key, required this.sourceList});

  @override
  State<SourceTab> createState() => _SourceTabState();
}

class _SourceTabState extends State<SourceTab> {
  CubitNewsViewModel cubitNewsViewModel = CubitNewsViewModel(newsRepositoryContract: injectNewsRepository());

  int selectedIndex = 0;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     cubitNewsViewModel.getNewsBySourceId(widget.sourceList[selectedIndex].id!);
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    var height = context.height;
    return DefaultTabController(
      length: widget.sourceList.length,
      child: Column(
        spacing: height * 0.02,
        children: [
          TabBar(
            isScrollable: true,
            indicatorColor: Theme.of(context).splashColor,
            tabAlignment: TabAlignment.start,
            dividerColor: AppColors.transparentColor,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            tabs: widget.sourceList.map((source) {
              return SourceName(
                isSelected: selectedIndex == widget.sourceList.indexOf(source),
                source: source,
              );
            }).toList(),
          ),
          //ayman note: update when tap changes:
          Expanded(
            child: NewsWidget(
              key: ValueKey(widget.sourceList[selectedIndex].id),
              source: widget.sourceList[selectedIndex],
            ),
          ),
          // Expanded(child: NewsWidget(source: widget.sourceList[selectedIndex])),
        ],
      ),
    );
  }
}
