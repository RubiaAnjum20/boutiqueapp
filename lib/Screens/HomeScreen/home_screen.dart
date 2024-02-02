import 'package:boutiqueapp/Utils/app_colors.dart';
import 'package:boutiqueapp/Utils/app_constants.dart';
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
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Home'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.lightPinkColor,
                  radius: 15,
                  child: Icon(
                    Icons.search,
                    size: 20,
                    color: AppColors.greyColor,
                  ),
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
        decoration: BoxDecoration(color: AppColors.lightPinkColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              CustomImageContainer(imageName: 'Group-38.png',),
              CustomImageContainer(imageName: 'handembroidery.jpg')
            ],
          ),
        ),
      ),
    );
  }
}

class CustomImageContainer extends StatelessWidget {
  final String imageName;
  const CustomImageContainer({
    required this.imageName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      decoration: BoxDecoration(
          color: AppColors.lightGreenColor,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
          fit: BoxFit.cover, 
              image: AssetImage(
                  '${AppConstants.assetImages}imageName'))),
    );
  }
}
