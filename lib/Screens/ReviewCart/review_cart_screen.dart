import 'package:boutiqueapp/Utils/app_colors.dart';
import 'package:flutter/material.dart';

class ReviewCartScreen extends StatelessWidget {
  const ReviewCartScreen
({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Cart'),
        backgroundColor: AppColors.pinkColor,
      ),
      body: ListView(
        children: [
          
        ],
      ),
    );
  }
}