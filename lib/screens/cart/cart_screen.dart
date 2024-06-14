import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/Cart.dart';
import 'components/cart_card.dart';
import 'components/check_out_card.dart';



// Demo data for our cart
Future<List<Cart>> fetchDemoCarts() async{
    List<int> inputList = [];
    var a = await demoProducts;
    List<Cart> demoCarts = [];
    // Get a reference to the Firestore database
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Reference to your collection
    CollectionReference collectionRef = firestore.collection(FirebaseAuth.instance.currentUser?.uid ?? "");

    // Query to check if any document has 'id' equal to 2
    QuerySnapshot querySnapshot = await collectionRef.get();
    
    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        // Access document data using documentSnapshot.data()
        Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
        // Print the data
        inputList.add(data['item']);
        
      }
      Map<int, int> countMap = {};
      for (int number in inputList) {
        if (countMap.containsKey(number)) {
          countMap[number] = countMap[number]! + 1;
        } else {
          countMap[number] = 1;
        }
      }
      List<List<int>> resultList = countMap.entries.map((entry) => [entry.key, entry.value]).toList();
      for (List<int> i in resultList){
        
        demoCarts.add(Cart(product: a[findIndexById(a,i[0])], numOfItem: i[1]));
        print(i[0]);
      }
      
      return demoCarts;
    
  }
  int findIndexById(List<Product> a,int z) {
    for (int index = 0; index < a.length; index++) {
      Product j = a[index];
      if (j.id == z) {
        return index;
      }
    }
    // Return -1 or handle case where id 3 is not found
    return -1; // or any other appropriate value
  }

class CartScreen extends StatefulWidget {
  static String routeName = "/cart";

  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Future<List<Cart>> _demoCartsFuture;

  @override
  void initState() {
    super.initState();
    _demoCartsFuture = fetchDemoCarts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Column(
          children: [
            const Text(
              "Your Cart",
              style: TextStyle(color: Colors.black),
            ),
            FutureBuilder<List<Cart>>(
              future: _demoCartsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Text(
                    "${snapshot.data!.length} items",
                    style: Theme.of(context).textTheme.bodySmall,
                  );
                }
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<Cart>>(
        future: _demoCartsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Dismissible(
                    key: Key(snapshot.data![index].product.id.toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      setState(() {
                        snapshot.data!.removeAt(index);
                      });
                    },
                    background: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE6E6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          const Spacer(),
                          SvgPicture.asset("assets/icons/Trash.svg"),
                        ],
                      ),
                    ),
                    child: CartCard(cart: snapshot.data![index]),
                  ),
                ),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: const CheckoutCard(),
    );
  }
}
