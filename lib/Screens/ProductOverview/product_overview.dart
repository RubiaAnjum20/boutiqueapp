import 'package:boutiqueapp/Components/AddToCart/add_to_cart.dart';
import 'package:boutiqueapp/Components/CounterWithFavButton/counter_with_fav_btn.dart';
import 'package:boutiqueapp/Model/product_model.dart';
import 'package:boutiqueapp/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductOverview extends StatelessWidget {
  final ProductModel product;
  const ProductOverview({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Hero(
                    tag: product.id,
                    child: Image.asset(
                      product.image,
                      height: 40.h,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: AppColors.lightGreenColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${product.title}',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    color: AppColors.magentaColor,
                                    fontWeight: FontWeight.bold),
                          ),
                          Text('${product.price}'),
                          const Text(
                            'Our \‘Blue Lavender\’ kurta features floral hand-embroidery in fresh shades of purple & green details with crochet edging. A soft and soothing colour palette inspired by Spring flowers and petals. . A versatile kurta you can wear everyday or accessorise with your favourite jewellery & heels,  to add a touch of glamour!',
                            textAlign: TextAlign.justify,
                          ),
                          Gap(2.h),
                          CounterWithFavBtn(),
                          Gap(2.h),
                          AddToCart(product: product)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
