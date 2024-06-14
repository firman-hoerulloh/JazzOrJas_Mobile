import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Product.dart';

class Cart {
  final Product product;
  final int numOfItem;
  
  Cart({required this.product, required this.numOfItem});
}


// Demo data for our cart

