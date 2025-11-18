import 'package:ecommerceapp/data/AppData.dart';
import 'package:ecommerceapp/products/product_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppData>(context);
    final cart = appData.cart;

    
    final totalPrice = cart.fold<double>(
      0,
      (previousValue, product) => previousValue + product.price,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: cart.isEmpty
          ? const Center(child: Text("Your cart is empty"))
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final product = cart[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 5),
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
                            title: Text(product.name),
                            subtitle: Text('₹${product.price}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                appData.removeFromCart(product);
                                
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('${product.name} removed from cart'),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Total: ₹$totalPrice',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Checkout successful!')),
                      );
                    },
                    child: const Text("Proceed to Payment"),
                  ),
                ],
              ),
            ),
    );
  }
}