import 'package:ecommerceapp/data/AppData.dart';
import 'package:ecommerceapp/home/Homepage.dart';
import 'package:ecommerceapp/pages/cartpage.dart';
import 'package:ecommerceapp/pages/profile.dart';
import 'package:ecommerceapp/products/product_list.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorites extends StatefulWidget {
  
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}



class _FavoritesState extends State<Favorites> {



void addToCart(Product product) {
   final cart = Provider.of<AppData>(context).cart;
  if (!cart.contains(product)) {
    setState(() {
      cart.add(product);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${product.name} added to cart')),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${product.name} is already in cart')),
    );
  }
}



  @override
  Widget build(BuildContext context) {
     final appData = Provider.of<AppData>(context);
    final wishlist = appData.getWishlistItems();
    
    return Scaffold(body: wishlist.isEmpty
        ? const Center(
            child: Text(
              'No favorites yet!',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          )
        : SafeArea(
          child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: wishlist.length,
              itemBuilder: (context, index) {
                final product = wishlist[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  elevation: 3,
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
                    trailing: Row(mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.add_shopping_cart, color: Colors.blue,size: 20,),
                          onPressed: () {
                            appData.addToCart(product);
                            ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${product.name} added to cart')),
                             );
                          }
                        ),
                        IconButton(onPressed: (){
                          final appData = Provider.of<AppData>(context, listen: false);
                          appData.toggleFavorite(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${product.name} removed from favorites')),
                             );
        
                        }, icon: Icon(Icons.delete,size: 20,))
                      ],
                    ),
                  ),
                );
              },
            ),
        ),bottomNavigationBar: BottomNavigationBar(
  type: BottomNavigationBarType.fixed,
  currentIndex: 1, 
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