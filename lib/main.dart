import 'package:flutter/material.dart';

void main() {
  runApp(JazzOrJasApp());
}

class JazzOrJasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JazzOrJas',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        fontFamily: 'Poppins',
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JazzOrJas'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('JazzOrJas'),
              decoration: BoxDecoration(color: Colors.brown),
            ),
            ListTile(title: Text('Beranda'), onTap: () {}),
            ListTile(title: Text('Tentang Kami'), onTap: () {}),
            ListTile(title: Text('Produk'), onTap: () {}),
            ListTile(title: Text('Kontak'), onTap: () {}),
            ListTile(title: Text('Register'), onTap: () {}),
          ],
        ),
      ),
      body: ListView(
        children: [
          HeroSection(),
          AboutSection(),
          ProductsSection(),
          ContactSection(),
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/hero-bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Harmoni Dalam Setiap Jahitan',
              style: TextStyle(fontSize: 36, color: Colors.white),
            ),
            Text(
              'Harmoni yang sempurna memberikan pengalaman berpakaian yang elegan dan memuaskan, setiap jahitan memberikan kesempurnaan dan kepercayaan diri kepada pemakainya.',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Tentang Kami', style: TextStyle(fontSize: 24)),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Image.asset('assets/about-img.jpg', fit: BoxFit.cover),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  'JazzOrJas menggunakan bahan berkualitas tinggi dan teknik jahitan yang presisi. Setiap produk dibuat dengan standar kualitas yang tinggi, sehingga Anda dapat yakin bahwa Anda mendapatkan produk yang tahan lama dan berkualitas.\n'
                  'JazzOrJas menawarkan koleksi stelan jas yang tidak hanya elegan, tetapi juga sesuai dengan tren mode terkini. Dari gaya klasik hingga yang lebih modern, Anda akan menemukan pilihan yang sesuai dengan preferensi dan gaya Anda.',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProductsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Produk Kami', style: TextStyle(fontSize: 24)),
          SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              ProductCard(
                title: 'Blue Plaid Blazer',
                image: 'assets/products/1.jpg',
                price: 'Rp 200.000',
              ),
              ProductCard(
                title: 'Green Blazer',
                image: 'assets/products/2.jpg',
                price: 'Rp 250.000',
              ),
              ProductCard(
                title: 'Red Blazer',
                image: 'assets/products/3.jpg',
                price: 'Rp 300.000',
              ),
              ProductCard(
                title: 'Striped Gray Blazer',
                image: 'assets/products/4.jpg',
                price: 'Rp 350.000',
              ),
              ProductCard(
                title: 'Bright Blue Blazer',
                image: 'assets/products/5.jpg',
                price: 'Rp 300.000',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String image;
  final String price;

  ProductCard({required this.title, required this.image, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(image),
              Positioned(
                top: 0,
                right: 0,
                child: Row(
                  children: [
                    IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
                    IconButton(icon: Icon(Icons.remove_red_eye), onPressed: () {}),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(title),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
            ],
          ),
          Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Kontak Kami', style: TextStyle(fontSize: 24)),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    InputField(icon: Icons.person, hint: 'Name'),
                    InputField(icon: Icons.mail, hint: 'Email'),
                    InputField(icon: Icons.phone, hint: 'No HP'),
                    InputField(icon: Icons.message, hint: 'Pesan', isTextArea: true),
                    SizedBox(height: 16), // Menambahkan jarak antara input field dan tombol
                    ElevatedButton(
                      onPressed: () {
                        // Tambahkan fungsi untuk mengirim pesan di sini
                      },
                      child: Text('Kirim Pesan'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class InputField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final bool isTextArea;

  InputField({required this.icon, required this.hint, this.isTextArea = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon),
          SizedBox(width: 8),
          Expanded(
            child: isTextArea
                ? TextField(
              decoration: InputDecoration(hintText: hint),
              maxLines: 4,
            )
                : TextField(
              decoration: InputDecoration(hintText: hint),
            ),
          ),
        ],
      ),
    );
  }
}



