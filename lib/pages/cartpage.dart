import 'package:ecommerceapp/data/Appdata.dart';
import 'package:ecommerceapp/home/Homepage.dart';
import 'package:ecommerceapp/pages/CheckoutPage.dart';
import 'package:ecommerceapp/pages/Favorites.dart';
import 'package:ecommerceapp/pages/profile.dart';
import 'package:ecommerceapp/products/product_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cartpage extends StatefulWidget {
  
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {



  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppData>(context);
    final cart = appData.cart;

    

    return Scaffold(body: cart.isEmpty
          ? const Center(
              child: Text(
                'Your cart is empty!',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : SafeArea(
            child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final product = cart[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                product.imageUrl,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              product.name,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('₹${product.price}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                appData.removeFromCart(product);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          '${product.name} removed from cart')),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                   Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: cart.isEmpty
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CheckoutPage(),
                              ),
                            );
                          },
                    child: const Text("Proceed to Checkout"),
                  ),
                ),
              ],
            ),
          ),bottomNavigationBar: BottomNavigationBar(
  type: BottomNavigationBarType.fixed,
  currentIndex: 2, 
  onTap: (index) {
    if (index==0) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
    }
     if (index==1) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Favorites()));
    }
    else if(index==2){
       Navigator.push(context, MaterialPageRoute(builder: (context)=>Cartpage()));
    }
    else if(index==3){
       Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
    }
    
  },
  items: const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: "Cart"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  ],
  selectedItemColor: Colors.amber,
  unselectedItemColor: Colors.grey,
),);
  }
}