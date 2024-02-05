import 'package:boutiqueapp/Model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier{

  List<ProductModel> product =[];
  // ProductModel productModel;

  fetchDressesData() async{
    QuerySnapshot data = await FirebaseFirestore.instance.collection('collectionPath').get();

    data.docs.forEach((element) { 
      // productModel = ProductModel(

      // );
    });
  }

  static saveDress(String imageName, imageTitle, uid, productDescription, price) async {
    await FirebaseFirestore.instance
        .collection('StitchedDresses')
        .doc(uid)
        .set({ 'imageName': imageName,'imageTitle': imageTitle, 'price': price, 'productDescription': productDescription});
  }
}