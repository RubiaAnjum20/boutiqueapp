import 'package:boutiqueapp/Components/CustomImageContainer/custom_image_container.dart';
import 'package:boutiqueapp/Routes/app_navigation.dart';
import 'package:boutiqueapp/Routes/app_navigation_routes.dart';
import 'package:boutiqueapp/Utils/app_colors.dart';
import 'package:boutiqueapp/Utils/app_constants.dart';
import 'package:boutiqueapp/Widgets/CustomDrawer/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.lightPinkColor,
                  radius: 15,
                  child: IconButton(
                    onPressed: (){
                      AppNavigation.navigateTo(routeName: AppNavRoutes.search);
                    },
                     icon: Icon(
                    Icons.search,
                    size: 20,
                    color: AppColors.greyColor,
                  ),)
                ),
                Gap(3),
                CircleAvatar(
                  backgroundColor: AppColors.lightPinkColor,
                  radius: 15,
                  child: Icon(
                    Icons.shop,
                    size: 20,
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),
          ),
        ],
        backgroundColor: AppColors.pinkColor,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              CustomImageContainer(imageName: 'Group-38.png', onPress: (){
                AppNavigation.navigateTo(routeName: AppNavRoutes.mainScreen);
              },),
              Gap(3.h),
              CustomImageContainer(imageName: 'handembroidery.jpg', onPress: (){},)
            ],
          ),
        ),
      ),
    );
  }

  
}




