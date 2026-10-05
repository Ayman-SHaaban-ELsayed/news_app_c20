import 'package:flutter/material.dart';
import 'package:news_app_c20/ui/home/category_details/news/news_item.dart';
import 'package:news_app_c20/ui/home/category_details/search/search_view_model.dart';
import 'package:news_app_c20/ui/widgets/main_error_widget.dart';
import 'package:news_app_c20/ui/widgets/main_loading_widget.dart';
import 'package:provider/provider.dart';
import 'package:news_app_c20/utlis/size_utils.dart';
import 'package:news_app_c20/utlis/app_colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchViewModel viewModel = SearchViewModel();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // مراقبة كتابة المستخدم لإظهار/إخفاء علامة الإغلاق
    _searchController.addListener(() {
      setState(() {});
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        viewModel.searchNews(_searchController.text, isLoadMore: true);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Search", style: theme.textTheme.headlineMedium),
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              controller: _searchController,
              // لون النص المكتوب يتبع الثيم (أبيض في الداكن، أسود في الفاتح)
              style: theme.textTheme.labelLarge,
              onChanged: (value) {
                viewModel.searchNews(value);
              },
              decoration: InputDecoration(
                filled: true,
                 fillColor: theme.scaffoldBackgroundColor,
                hintText: "Search",
                 hintStyle: theme.textTheme.labelLarge?.copyWith(
                  color: AppColors.greyColor,
                ),
                 prefixIcon: Icon(
                  Icons.search,
                  color: theme.appBarTheme.iconTheme?.color,
                ),
                 suffixIcon: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: theme.appBarTheme.iconTheme?.color,
                  ),
                  onPressed: () {
                    _searchController.clear();
                    viewModel.newsList = [];
                    viewModel.searchNews('');
                  },
                ),
                 border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: theme.appBarTheme.iconTheme?.color ?? AppColors.blackColor,
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: theme.appBarTheme.iconTheme?.color ?? AppColors.blackColor,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: theme.appBarTheme.iconTheme?.color ?? AppColors.blackColor,
                    width: 1.5,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          Expanded(
            child: _buildSearchResults(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<SearchViewModel>(
        builder: (context, value, child) {
          if (value.isLoading && !value.isFetchingMore) {
            return const MainLoadingWidget();
          } else if (value.errorMessage != null && value.newsList == null) {
            return MainErrorWidget(
              errorMessage: value.errorMessage!,
              onPressed: () {
                viewModel.searchNews(_searchController.text);
              },
            );
          } else if (value.newsList == null || value.newsList!.isEmpty) {
            return const SizedBox();
          } else {
            return ListView.separated(
              controller: _scrollController,
              itemBuilder: (context, index) {
                if (index == value.newsList!.length) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(context.height * 0.02),
                      child: CircularProgressIndicator(
                        color: Theme.of(context).splashColor,
                      ),
                    ),
                  );
                }
                return NewsItem(news: value.newsList![index]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: context.height * 0.02);
              },
              itemCount: value.newsList!.length + (value.isFetchingMore ? 1 : 0),
            );
          }
        },
      ),
    );
  }
}