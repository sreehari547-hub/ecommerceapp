import 'package:ecommerceapp/data/AppData.dart';
import 'package:ecommerceapp/home/Homepage.dart';
import 'package:ecommerceapp/pages/Favorites.dart';
import 'package:ecommerceapp/pages/profile.dart';
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
    final appData = context.watch<AppData>();
    final cart = appData.cart;

    void showCheckoutBottomSheet(BuildContext context) {
  final appData = AppData.instance;
  final cart = appData.getCartItems();
  double discount = 0;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          final totalPrice = cart.fold<double>(
            0,
            (previousValue, product) => previousValue + product.price,
          );
          final discountedPrice = totalPrice - discount;

          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: const EdgeInsets.all(16),
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                children: [
                  const Text(
                    "Purchase Summary",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final product = cart[index];
                        return ListTile(
                          leading: Image.network(product.imageUrl,
                              width: 50, height: 50, fit: BoxFit.cover),
                          title: Text(product.name),
                          trailing: Text('₹${product.price}'),
                        );
                      },
                    ),
                  ),
                  const Divider(),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Enter discount amount",
                      prefixIcon: Icon(Icons.local_offer),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        discount = double.tryParse(value) ?? 0;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "₹$discountedPrice",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      appData.clearCart();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Purchase successful!")),
                      );
                      Navigator.pop(context); 
                    },
                    child: const Text("Purchase"),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

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
                    onPressed:  cart.isEmpty ? null : () => showCheckoutBottomSheet(context),
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