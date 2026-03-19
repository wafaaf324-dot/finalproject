
import 'package:finalproject/cart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'category.dart';
import 'cart.dart';
import 'book_details.dart';

class Book {
  final String title;
  final String author;
  final String description;
  final String imageUrl;
  final double price;
  final double rating;

  Book({
    required this.title,
    required this.author,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.rating,
  });
}
void main(){
  runApp(const MaterialApp(debugShowCheckedModeBanner: false ,));
}

class home_page extends StatelessWidget {
   home_page({Key?key}):super(key:key);
  final List<String >vendor =[
    "assets/image/Frame (12).png",
    "assets/image/Group.png",
    "assets/image/Frame (13).png",
    "assets/image/Frame (14).png"
  ];

  @override
  Widget build(BuildContext context) {
    List<Book> booksList = [
      Book(
        title: "The Kite Runner",
        author: "Khaled Hosseini",
        description: "A beautiful story of friendship and redemption in Afghanistan.",
        imageUrl: "assets/image/Frame (1).png",
        price: 39.99,
        rating: 4.5,
      ),
      Book(
        title: "The Kite Runner",
        author: "Khaled Hosseini",
        description: "A beautiful story of friendship and redemption in Afghanistan.",
        imageUrl: "assets/image/Frame (2).png",
        price: 14.99,
        rating: 4.0,
      ),
      Book(
        title: "The Kite Runner",
        author: "Khaled Hosseini",
        description: "A beautiful story of friendship and redemption in Afghanistan.",
        imageUrl: "assets/image/Frame (3).png",
        price: 29.99,
        rating: 4.2,
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.search, color: Colors.black),
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.notifications_none, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildSpecialOffer(),
            const SizedBox(height: 25),
            _buildSectionHeader("Top of Week"),
            const SizedBox(height: 15),
            _buildTopOfWeekList(booksList),
            const SizedBox(height: 25),
            _buildSectionHeader("Best Vendors"),
            const SizedBox(height: 15),
            _buildVendorsList(),
            const SizedBox(height: 25),
            _buildSectionHeader("Authors"),
            const SizedBox(height: 15),
            _buildAuthorsList(),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );}
          else if(index==1){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const category()),);
          }
          else if(index==2){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => cart()),);
          }
        },
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category_outlined), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildSpecialOffer() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Special Offer",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const Text("Discount 25%", style: TextStyle(color: Colors.black54)),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5C54D4),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text("Order Now", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
           Image.asset("assets/image/im1.png")
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const Text("See all", style: TextStyle(color: Colors.deepPurple, fontSize: 14)),
      ],
    );
  }
  Widget _buildTopOfWeekList(List<Book> list) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          final book = list[index];
          return GestureDetector(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>book_details(book: book)));},
           child:Container( width: 140,
            margin: const EdgeInsets.only(right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                     width: 140,
                    margin: const EdgeInsets.only(right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(15),
                        child: Image.asset(book.imageUrl,fit: BoxFit.cover,width:double.infinity,),))
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text("The Kite Runner",
                    maxLines: 1, style: TextStyle(fontWeight: FontWeight.bold)),
                const Text("\$14.99",
                    style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
              ],
            ),
           ),  );
        },
      ),
    );
  }

  Widget _buildVendorsList() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:vendor.length,
        itemBuilder: (context, index) {
          return Container(
            width: 70,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(image: AssetImage(vendor[index]),
                  fit:BoxFit.cover, )
            ),
            child: const Center(child: Icon(Icons.storefront, color: Colors.orange)),
          );
        },
      ),
    );
  }

  Widget _buildAuthorsList() {
    List <String> authorImage =[
"assets/image/Frame (4).png",
      "assets/image/Frame (5).png",
      "assets/image/Image (1).png",
    ];
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Column(
              children: [
                 CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage(authorImage[index]),
                  child: Icon(Icons.person, color: Colors.white, size: 40),
                ),
                const SizedBox(height: 8),
                const Text("Name", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                const Text("Writer", style: TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
          );
        },
      ),
    );
  }
}