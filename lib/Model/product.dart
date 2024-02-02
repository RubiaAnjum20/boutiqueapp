import 'package:boutiqueapp/Utils/app_constants.dart';
import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;

  Product(
      {required this.image,
      required this.title,
      required this.description,
      required this.price,
      required this.size,
      required this.id,
      required this.color});
}

List<Product> products = [
  Product(
      id: 1,
      title: "Autumn Love",
      price: 17500,
      size: 12,
      description: dummyText,
      image: "${AppConstants.dressImages}AutumnLove.jpg",
      color: Color(0xFFffffff)),
  Product(
      id: 2,
      title: "Blue Lavender",
      price: 18000,
      size: 8,
      description: dummyText,
      image: "${AppConstants.dressImages}BlueLavender.jpg",
      color: Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Blue Moon",
      price: 18500,
      size: 10,
      description: dummyText,
      image: "${AppConstants.dressImages}BlueMoon.jpg",
      color: Color(0xFF989493)),
  Product(
      id: 4,
      title: "Coral Sparkle",
      price: 17000,
      size: 11,
      description: dummyText,
      image: "${AppConstants.dressImages}CoralSparkle.jpg",
      color: Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "Festive Gold",
      price: 18500,
      size: 12,
      description: dummyText,
      image: "${AppConstants.dressImages}FestiveGold.jpg",
      color: Color(0xFFFB7883)),
  Product(
    id: 6,
    title: "Festive Star",
    price: 18500,
    size: 12,
    description: dummyText,
    image: "${AppConstants.dressImages}FestiveStar.jpg",
    color: Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
