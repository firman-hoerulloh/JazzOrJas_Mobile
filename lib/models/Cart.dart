import 'Product.dart';

class Cart {
  final Product product;
  final int numOfItem;
  
  Cart({required this.product, required this.numOfItem});
}

// Demo data for our cart

List<Cart> demoCarts = [
  Cart(product: Product(
    id: 1,
    images: "https://firebasestorage.googleapis.com/v0/b/jazzorjas-4a781.appspot.com/o/product%2F1?alt=media&token=9800d2f8-949a-459c-a4a8-2ca155b4b19a",
    
    title: "Blue Plaid Blazer",
    price: 200000,
    description: "Tingkatkan gaya Anda dengan Blazer Kotak-Kotak Biru yang berkelas. Blazer serbaguna ini sempurna untuk acara formal maupun santai, menawarkan desain yang abadi yang cocok dengan berbagai gaya busana.",
    rating: 48,
    isFavourite: true,
    isPopular: true,
  ), numOfItem: 2),
  Cart(product: Product(
    id: 1,
    images: "https://firebasestorage.googleapis.com/v0/b/jazzorjas-4a781.appspot.com/o/product%2F1?alt=media&token=9800d2f8-949a-459c-a4a8-2ca155b4b19a",
    
    title: "Blue Plaid Blazer",
    price: 200000,
    description: "Tingkatkan gaya Anda dengan Blazer Kotak-Kotak Biru yang berkelas. Blazer serbaguna ini sempurna untuk acara formal maupun santai, menawarkan desain yang abadi yang cocok dengan berbagai gaya busana.",
    rating: 48,
    isFavourite: true,
    isPopular: true,
  ), numOfItem: 1),
  Cart(product: Product(
    id: 1,
    images: "https://firebasestorage.googleapis.com/v0/b/jazzorjas-4a781.appspot.com/o/product%2F1?alt=media&token=9800d2f8-949a-459c-a4a8-2ca155b4b19a",
    
    title: "Blue Plaid Blazer",
    price: 200000,
    description: "Tingkatkan gaya Anda dengan Blazer Kotak-Kotak Biru yang berkelas. Blazer serbaguna ini sempurna untuk acara formal maupun santai, menawarkan desain yang abadi yang cocok dengan berbagai gaya busana.",
    rating: 48,
    isFavourite: true,
    isPopular: true,
  ), numOfItem: 1),
];
