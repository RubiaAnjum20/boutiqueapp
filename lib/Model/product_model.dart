import 'package:boutiqueapp/Utils/app_constants.dart';
import 'package:flutter/material.dart';

class ProductModel {
  final String image, title, description;
  final int price, size, id;
  

  ProductModel(      
      {required this.image,
      required this.title,
      required this.description,
      required this.price,
      required this.size,
      required this.id,
      });
}

List<ProductModel> products = [
  ProductModel(
      id: 1,
      title: "Autumn Love",
      price: 17500,
      size: 12,
      description: dummyText,
      image: "${AppConstants.dressImages}AutumnLove.jpg",
      ),
  ProductModel(
      id: 2,
      title: "Blue Lavender",
      price: 18000,
      size: 8,
      description: dummyText,
      image: "${AppConstants.dressImages}BlueLavender.jpg",
      ),
  ProductModel(
      id: 3,
      title: "Blue Moon",
      price: 18500,
      size: 10,
      description: dummyText,
      image: "${AppConstants.dressImages}BlueMoon.jpg",
      ),
  ProductModel(
      id: 4,
      title: "Coral Sparkle",
      price: 17000,
      size: 11,
      description: dummyText,
      image: "${AppConstants.dressImages}CoralSparkle.jpg",
      ),
  ProductModel(
      id: 5,
      title: "Festive Gold",
      price: 18500,
      size: 12,
      description: dummyText,
      image: "${AppConstants.dressImages}FestiveGold.jpg",
      ),
  ProductModel(
    id: 6,
    title: "Festive Star",
    price: 18500,
    size: 12,
    description: dummyText,
    image: "${AppConstants.dressImages}FestiveStar.jpg",
    
  ),
  ProductModel(
    id: 7,
    title: "Floral Blue",
    price: 18500,
    size: 12,
    description: dummyText,
    image: "${AppConstants.dressImages}FloralBlue.jpg",
    
  ),
  ProductModel(
    id: 8,
    title: "Floral Gold",
    price: 18500,
    size: 12,
    description: dummyText,
    image: "${AppConstants.dressImages}FloralGold.jpg",
    
  ),
   ProductModel(
    id: 9,
    title: "Floral Scent",
    price: 18500,
    size: 12,
    description: dummyText,
    image: "${AppConstants.dressImages}FloralScent.jpg",
    
  ),
  ProductModel(
    id: 10,
    title: "Golden Roses",
    price: 18500,
    size: 12,
    description: dummyText,
    image: "${AppConstants.dressImages}GoldenRoses.jpg",
    
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
