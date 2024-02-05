import 'package:boutiqueapp/Components/CustomTextFormField/custom_text_form_field.dart';
import 'package:boutiqueapp/Model/product_model.dart';
import 'package:boutiqueapp/Utils/app_colors.dart';
import 'package:boutiqueapp/Widgets/SearchItem/search_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Search extends StatelessWidget {
   Search({super.key, this.productModel});

  final ProductModel? productModel;
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        backgroundColor: AppColors.pinkColor,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListView(
            children: [
              ListTile(),
              Container(
                height: 7.h,
                child: CustomTextFormField(
                  hintText: 'Search',
                  suffixWidget: Icon(Icons.search),
                  
                ),
              ),
              Gap(3.h),
              SearchItem(),
              SearchItem()
            ],
          ),
        ),
      ),
    );
  }
}