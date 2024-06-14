import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

import 'package:shop_app/components/toast.dart';
import 'package:shop_app/constants.dart';


void showCustomDialogDelete(BuildContext context) {
  String? item;

  Future DeleteProduct() async {
    try {
      await FirebaseFirestore.instance.collection('product').doc(item).delete();
    }on FirebaseException catch (e){
      showToast(message: e.message.toString());
    }
  }
  Future<List> _fetchProducts() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('product').get();

      List<dynamic> products = querySnapshot.docs.map((doc) {
        var data = doc.data();
        return data['id'].toString();
      }).toList();
      return products;
    } catch (e) {
      print("Error fetching products: $e");
      return [];
    }
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return FutureBuilder<List>(
        future: _fetchProducts(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<dynamic> products = snapshot.data!;
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return AlertDialog(
                  scrollable: true,
                  backgroundColor: Colors.black,
                  title: const Text(
                    "Delete",
                    style: TextStyle(color: Colors.white),
                  ),
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      child: Column(
                        children: [
                          DropdownButton<String>(
                             
                            items: products.map((dynamic product) {
                              return DropdownMenuItem<String>(
                                value: product.toString(),
                                child: Text(product.toString(),style: TextStyle(fontSize: 16,color: Colors.red),),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              item = value;
                            },
                            // Set a default value if needed
                            value: products.isNotEmpty ? products[0] : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      child: const Text("Submit"),
                      onPressed: () {
                        if(item == null){
                          showToast(message: "Must clik item");
                        }else{
                          DeleteProduct();
                          
                          showToast(message: "Product with id ${item} deleted");
                        }
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
      );
    },
  );
}
