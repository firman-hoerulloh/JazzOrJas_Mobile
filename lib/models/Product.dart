import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Product>> getData() async {
  try {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance.collection('product').get();
    
    List<Product> products = querySnapshot.docs.map((doc) {
      var data = doc.data();
      return Product(
        id: data['id'] ?? '',
        images: data['images'] ?? '',
        title: data['title'] ?? '',
        price: data['price'] ?? 1,
        description: data['description'] ?? '',
        rating: data['rating'] ?? 1,
        isFavourite: data['favourite'] ?? false,
        isPopular: data['popular'] ?? false,
      );
    }).toList();
    
    return products;

  } catch (e) {
    print("Error fetching products: $e");
    return []; // Return an empty list in case of error
  }
}
Future<List<Product>> demoProducts = getData();

class Product {
  final int id;
  final String title, description;
  final String images;

  final int rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    this.rating = 0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products
//List<Product> demoProducts = getData() ;

// [
//   Product(
//     id: 1,
//     images: "https://firebasestorage.googleapis.com/v0/b/jazzorjas-4a781.appspot.com/o/product%2F1?alt=media&token=9800d2f8-949a-459c-a4a8-2ca155b4b19a",
    
//     title: "Blue Plaid Blazer",
//     price: 200000,
//     description: "Tingkatkan gaya Anda dengan Blazer Kotak-Kotak Biru yang berkelas. Blazer serbaguna ini sempurna untuk acara formal maupun santai, menawarkan desain yang abadi yang cocok dengan berbagai gaya busana.",
//     rating: 48,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 2,
//     images: "https://firebasestorage.googleapis.com/v0/b/jazzorjas-4a781.appspot.com/o/product%2F2?alt=media&token=30a93599-f47f-46e0-9690-a5c5a9865691",
//     title: "Green Blazer",
//     price: 250000,
//     description: "Buatlah pernyataan dengan Blazer Hijau yang elegan, sebuah potongan serbaguna yang menambahkan sentuhan kesopanan pada setiap paduan busana. Dibuat dengan perhatian terhadap detail dan bahan berkualitas, blazer ini menawarkan gaya dan kenyamanan untuk berbagai kesempatan.",
//     rating: 41,
//     isPopular: true,
//    ),];
  // Product(
  //   id: 3,
  //   images: [
  //     "https://firebasestorage.googleapis.com/v0/b/jazzorjas-4a781.appspot.com/o/product%2F3.png?alt=media&token=30a93599-f47f-46e0-9690-a5c5a9865691",
  //   ],

  //   title: "Red Blazer",
  //   price: 300.000,
  //   description: "Buat pernyataan berani dengan Blazer Merah yang abadi, suatu kebutuhan dalam lemari pakaian yang menunjukkan keyakinan dan gaya. Baik untuk acara formal maupun santai, blazer yang dirancang dengan sempurna ini menambahkan sentuhan kesopanan pada setiap gaya.",
  //   rating: 4.1,
  //   isFavourite: true,
  //   isPopular: true,
  // ),
  // Product(
  //   id: 4,
  //   images: [
  //     "https://firebasestorage.googleapis.com/v0/b/jazzorjas-4a781.appspot.com/o/product%2F4.png?alt=media&token=30a93599-f47f-46e0-9690-a5c5a9865691",
  //   ],

  //   title: "Striped Gray Blazer",
  //   price: 350.000,
  //   description: "Tambahkan sentuhan elegan pada gaya Anda dengan Blazer Garis-Garis Abu-abu. Blazer ini menawarkan kesan yang klasik namun tetap modern, cocok untuk berbagai kesempatan, baik itu formal maupun santai.",
  //   rating: 4.1,
  //   isFavourite: true,
  // ),
  // Product(
  //   id: 5,
  //   images: [
  //     "https://firebasestorage.googleapis.com/v0/b/jazzorjas-4a781.appspot.com/o/product%2F5.png?alt=media&token=30a93599-f47f-46e0-9690-a5c5a9865691",
  //   ],

  //   title: "Bright Blue Blazer",
  //   price: 300.000,
  //   description: "Buat pernyataan gaya yang mencolok dengan Blazer Biru Cerah ini. Blazer yang cerah ini akan menambahkan sentuhan keceriaan pada penampilan Anda, cocok untuk berbagai kesempatan, dari yang formal hingga santai.",
  //   rating: 4.1,
  //   isFavourite: true,
  // ),
  
///];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
