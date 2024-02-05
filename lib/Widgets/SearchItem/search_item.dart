import 'package:boutiqueapp/Utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(
          height: 10.h,
          child: Center(
            child: Image.asset('${AppConstants.dressImages}BlueLavender.jpg'),
          ),
        )),
        Expanded(child: Container(
          height: 12.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text('Product Name', style:  Theme.of(context).textTheme.bodyMedium,),
                  Text('Price', style:  Theme.of(context).textTheme.bodyMedium,)
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 15),
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 5.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Row(
                  children: [
                    Expanded(child: Text('Quantity', style:  Theme.of(context).textTheme.bodyMedium))
                  ],
                ),
              )
            ],
          ),
        )),
        Expanded(child: Container(
          height: 10.h,
        )),
      ],
    );
  }
}