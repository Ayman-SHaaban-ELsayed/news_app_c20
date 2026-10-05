import 'package:flutter/material.dart';
import 'package:news_app_c20/api/model/category/category.dart';
import 'package:news_app_c20/l10n/app_localizations.dart';
import 'package:news_app_c20/ui/home/category_details/category_details.dart';
import 'package:news_app_c20/ui/home/category_details/search/search_widget.dart';
import 'package:news_app_c20/ui/home/category_fragment/category_fragment.dart';
import 'package:news_app_c20/ui/home/drawer/home_drawer.dart';
import 'package:news_app_c20/utlis/app_colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory == null
              ? AppLocalizations.of(context)!.home
              : selectedCategory!.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: IconButton(
              onPressed: () {
                // الانتقال للشاشة المخصصة
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchScreen()),
                );
              },
              icon: const Icon(Icons.search, size: 32),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        child: HomeDrawer(onDrawerClick: onDrawerItemBackClicked),
      ),
      body: selectedCategory == null
          ? CategoryFragment(onCategoryItemClick: onCategoryItemClick)
          : CategoryDetails(category: selectedCategory!), // CategoryDetails(),
    );
  }

  Category? selectedCategory;

  void onCategoryItemClick(Category newCategory) {
    //new category =? selected by user
    selectedCategory = newCategory;
    setState(() {});
  }

  void onDrawerItemBackClicked() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
