import 'package:boutiqueapp/Model/product.dart';
import 'package:boutiqueapp/Routes/app_navigation.dart';
import 'package:boutiqueapp/Routes/app_navigation_routes.dart';
import 'package:boutiqueapp/Screens/DetailsScreen/details_screen.dart';
import 'package:boutiqueapp/Utils/app_colors.dart';
import 'package:boutiqueapp/Utils/app_constants.dart';
import 'package:boutiqueapp/Widgets/ItemCard/item_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.pinkColor,
        elevation: 0,
        leading: IconButton(     
          icon: Icon(Icons.logout),
          onPressed: () async{
           await FirebaseAuth.instance.signOut();
           AppNavigation.pushAndKillAll(routeName: AppNavRoutes.loginScreen);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              colorFilter: ColorFilter.mode(AppColors.blackTextColor, BlendMode.srcIn),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/cart.svg",
              colorFilter: ColorFilter.mode(AppColors.kTextColor, BlendMode.srcIn),
            ),
            onPressed: () {},
          ),
          SizedBox(width: AppConstants.kDefaultPadding / 2)
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.lightPinkColor
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppConstants.kDefaultPadding),
              child: Text(
                "Women",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppConstants.kDefaultPadding),
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: AppConstants.kDefaultPadding,
                    crossAxisSpacing: AppConstants.kDefaultPadding,
                    childAspectRatio: 0.60,
                  ),
                  itemBuilder: (context, index) => ItemCard(
                    product: products[index],
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          product: products[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}