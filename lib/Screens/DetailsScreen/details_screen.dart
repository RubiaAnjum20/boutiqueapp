import 'package:boutiqueapp/Components/AddToCart/add_to_cart.dart';
import 'package:boutiqueapp/Components/ColorAndSize/color_and_size.dart';
import 'package:boutiqueapp/Components/CounterWithFavButton/counter_with_fav_btn.dart';
import 'package:boutiqueapp/Components/Description/description.dart';
import 'package:boutiqueapp/Components/ProductWithTitleImage/product_title_with_image.dart';
import 'package:boutiqueapp/Model/product.dart';
import 'package:boutiqueapp/Utils/app_colors.dart';
import 'package:boutiqueapp/Utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      // each product have a color
      backgroundColor: AppColors.lightPinkColor,
      appBar: AppBar(
        backgroundColor: product.color,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset("assets/icons/search.svg"),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/cart.svg"),
            onPressed: () {},
          ),
          SizedBox(width: AppConstants.kDefaultPadding/ 2)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: AppConstants.kDefaultPadding,
                      right: AppConstants.kDefaultPadding,
                    ),
                    // height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        ColorAndSize(product: product),
                        SizedBox(height: AppConstants.kDefaultPadding / 2),
                        Description(product: product),
                        SizedBox(height: AppConstants.kDefaultPadding / 2),
                        CounterWithFavBtn(),
                        SizedBox(height: AppConstants.kDefaultPadding / 2),
                        AddToCart(product: product)
                      ],
                    ),
                  ),
                  ProductTitleWithImage(product: product)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
