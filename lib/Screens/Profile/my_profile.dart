import 'package:boutiqueapp/Providers/login_provider.dart';
import 'package:boutiqueapp/Utils/app_colors.dart';
import 'package:boutiqueapp/Utils/app_constants.dart';
import 'package:boutiqueapp/Utils/theme_provider.dart';
import 'package:boutiqueapp/Widgets/CustomDrawer/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.pinkColor,
        title: Text(
          'My Profile',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Consumer<LoginProvider>(builder: (context, loginProvider, child) {
        return Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 20.h,
                  color: AppColors.pinkColor,
                ),
                Container(
                  height: 30.h,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 250,
                            height: 80,
                            padding: EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Gap(2.h),
                                    Text(
                                        '${loginProvider.emailcontroller.text}')
                                  ],
                                ),
                                const CircleAvatar(
                                  radius: 15,
                                  backgroundColor: AppColors.lightGreenColor,
                                  child: CircleAvatar(
                                    radius: 12,
                                    child: Icon(
                                      Icons.edit,
                                      color: AppColors.magentaColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Provider.of<ThemeProvider>(context, listen: false)
                              .toggleTheme();
                        },
                        child: Text(
                          'Theme',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(24),
                            backgroundColor: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 40, left: 30),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: AppColors.greenColor,
                  backgroundImage:
                      AssetImage('${AppConstants.assetImages}logo.png'),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
