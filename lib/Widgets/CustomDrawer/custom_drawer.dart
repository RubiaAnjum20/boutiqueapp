import 'package:boutiqueapp/Components/DrawerItem/drawer_item.dart';
import 'package:boutiqueapp/Routes/app_navigation.dart';
import 'package:boutiqueapp/Routes/app_navigation_routes.dart';
import 'package:boutiqueapp/Utils/app_colors.dart';
import 'package:boutiqueapp/Utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: ListView(
        children: [
          DrawerHeader(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 43,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: AppColors.greenColor,
                      child: Image.asset('${AppConstants.assetImages}logo.png'),
                    ),
                  ),
                ],
              ),
              Text('Anjum\'s Boutique ')
            ],
          ),
          ),
          CustomListTile(icon: Icons.home_outlined,
          title: 'Home',
          onTap: (){
            AppNavigation.navigateTo(routeName: AppNavRoutes.homeScreen);
          },),
         // Divider(),
          CustomListTile(icon: Icons.shopify_outlined,
          title: 'Review Cart',
          onTap: (){
            AppNavigation.navigateTo(routeName: AppNavRoutes.reviewCartScreen);
          },),
          CustomListTile(icon: Icons.person_outline, title: 'My Profile', onTap: (){
            AppNavigation.navigateTo(routeName: AppNavRoutes.myProfile);
          }),
          CustomListTile(icon: Icons.notifications_outlined, title: 'Notification', onTap: (){}),
          CustomListTile(icon: Icons.rate_review_outlined, title: 'Rating & Review', onTap: (){}),
          CustomListTile(icon: Icons.favorite_outlined, title: 'Wishlist', onTap: (){}),
          CustomListTile(icon: Icons.copy_outlined, title: 'Complaint', onTap: (){}),
          CustomListTile(icon: Icons.question_answer_outlined, title: 'FAQs', onTap: (){}),
          CustomListTile(icon: Icons.logout, title: 'Logout', onTap: () async{ 
            await FirebaseAuth.instance.signOut();
           AppNavigation.pushAndKillAll(routeName: AppNavRoutes.loginScreen);
          })
        ],
      ),
    );
  }
}