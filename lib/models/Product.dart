import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/1.png",
    ],
    colors: [
      const Color(0xFF000D2B),
    ],
    title: "Blue Plaid Blazer",
    price: 200.000,
    description: "Tingkatkan gaya Anda dengan Blazer Kotak-Kotak Biru yang berkelas. Blazer serbaguna ini sempurna untuk acara formal maupun santai, menawarkan desain yang abadi yang cocok dengan berbagai gaya busana.",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/2.png",
    ],
    colors: [
      const Color(0xFF0F3132),
    ],
    title: "Green Blazer",
    price: 250.000,
    description: "Buatlah pernyataan dengan Blazer Hijau yang elegan, sebuah potongan serbaguna yang menambahkan sentuhan kesopanan pada setiap paduan busana. Dibuat dengan perhatian terhadap detail dan bahan berkualitas, blazer ini menawarkan gaya dan kenyamanan untuk berbagai kesempatan.",
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/3.png",
    ],
    colors: [
      const Color(0xFF38131B),
    ],
    title: "Red Blazer",
    price: 300.000,
    description: "Buat pernyataan berani dengan Blazer Merah yang abadi, suatu kebutuhan dalam lemari pakaian yang menunjukkan keyakinan dan gaya. Baik untuk acara formal maupun santai, blazer yang dirancang dengan sempurna ini menambahkan sentuhan kesopanan pada setiap gaya.",
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/4.png",
    ],
    colors: [
      const Color(0xFF322D2A)
    ],
    title: "Striped Gray Blazer",
    price: 350.000,
    description: "Tambahkan sentuhan elegan pada gaya Anda dengan Blazer Garis-Garis Abu-abu. Blazer ini menawarkan kesan yang klasik namun tetap modern, cocok untuk berbagai kesempatan, baik itu formal maupun santai.",
    rating: 4.1,
    isFavourite: true,
  ),
  Product(
    id: 5,
    images: [
      "assets/images/5.png",
    ],
    colors: [
      const Color(0xFF1E3C6B),
    ],
    title: "Bright Blue Blazer",
    price: 300.000,
    description: "Buat pernyataan gaya yang mencolok dengan Blazer Biru Cerah ini. Blazer yang cerah ini akan menambahkan sentuhan keceriaan pada penampilan Anda, cocok untuk berbagai kesempatan, dari yang formal hingga santai.",
    rating: 4.1,
    isFavourite: true,
  ),
  
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
