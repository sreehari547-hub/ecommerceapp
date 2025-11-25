import 'package:ecommerceapp/data/AppData.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/products/product_list.dart';
import 'package:provider/provider.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    final allProducts = categories.expand((cat) => cat.products).toList();
    final appData = context.watch<AppData>();
    final cart = appData.cart;
    final wishlist = appData.wishlist;

    return Scaffold(
      appBar: AppBar(title: const Text("All Products")),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: allProducts.length,
          itemBuilder: (context, index) {
            final product = allProducts[index];
            final isInCart = cart.contains(product);
            final isInWishlist = wishlist.contains(product);

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
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
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        isInCart ? Icons.shopping_cart : Icons.add_shopping_cart,
                        color: isInCart ? Colors.green : Colors.blue,
                      ),
                      onPressed: () {
                        final data = context.read<AppData>();
                        if (isInCart) {
                          data.removeFromCart(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${product.name} removed from cart')),
                          );
                        } else {
                          data.addToCart(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${product.name} added to cart')),
                          );
                        }
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        isInWishlist ? Icons.favorite : Icons.favorite_border,
                        color: isInWishlist ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        final data = context.read<AppData>();
                        data.toggleFavorite(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              isInWishlist
                                  ? '${product.name} removed from wishlist'
                                  : '${product.name} added to wishlist',
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}