import 'package:flutter/material.dart';
import 'package:ecommerceapp/data/AppData.dart';
import 'package:ecommerceapp/products/product_list.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final Product product;

  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final appData = context.watch<AppData>();

    final isInCart = appData.cart.contains(product);
    final isInWishlist = appData.wishlist.contains(product);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name, overflow: TextOverflow.ellipsis),
        actions: [
          IconButton(
            icon: Icon(
              isInWishlist ? Icons.favorite : Icons.favorite_border,
              color: isInWishlist ? Colors.red : Colors.white,
            ),
            onPressed: () {
              setState(() {
                appData.toggleFavorite(product);
              });
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    product.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '₹${product.price}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 20),

              const Divider(),
              const SizedBox(height: 10),
              const Text(
                'Product Description:',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black54),
              ),
              const SizedBox(height: 8),
              const Text(
                "This is a high-quality product designed with attention to detail. "
                "Perfect for daily use and available at an unbeatable price.",
                style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.4),
              ),

              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isInCart ? Colors.red : Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  icon: Icon(
                    isInCart ? Icons.remove_shopping_cart : Icons.add_shopping_cart,
                    color: Colors.white,
                  ),
                  label: Text(
                    isInCart ? 'Remove from Cart' : 'Add to Cart',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    final data = context.read<AppData>();
                    if (isInCart) {
                      data.removeFromCart(product);
                    } else {
                      data.addToCart(product);
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          isInCart
                              ? '${product.name} removed from cart'
                              : '${product.name} added to cart',
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
