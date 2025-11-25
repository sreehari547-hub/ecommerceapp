
import 'package:ecommerceapp/categories_list/Caps.dart'; 
import 'package:ecommerceapp/categories_list/Dresses.dart';
 import 'package:ecommerceapp/categories_list/Mobiles.dart'; 
 import 'package:ecommerceapp/categories_list/Shoes.dart'; 
 import 'package:ecommerceapp/categories_list/Tablets.dart'; 
 import 'package:ecommerceapp/categories_list/Watches.dart'; 
 import 'package:ecommerceapp/data/AppData.dart'; 
 import 'package:ecommerceapp/pages/cartpage.dart'; 
 import 'package:ecommerceapp/pages/Favorites.dart';
  import 'package:ecommerceapp/pages/profile.dart'; 
  import 'package:ecommerceapp/products/Products.dart'; 
  import 'package:ecommerceapp/products/product_list.dart'; 
  import 'package:ecommerceapp/products/product_page.dart'; 
  import 'package:flutter/material.dart'; 
  class Homepage extends StatefulWidget { 
    const Homepage({super.key,}); 
    @override State<Homepage> createState() => _HomepageState();
     } 
     class _HomepageState extends State<Homepage> { 
      List<ProductCategory> categoriesList = categories; 
      void toggleFavorite(Product product) { 
        final appData = AppData.instance; 
        appData.toggleFavorite(product); 
        setState(() {}); } 
        @override Widget build(BuildContext context) { 
          return Scaffold(body: Padding( 
            padding: const EdgeInsets.only(left: 10,right: 10),
             child: SafeArea(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
             children: [ Row(spacing: 10,children: [
              SizedBox(width: 5,), 
              Expanded(child: TextField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
              ,label: Row( children: [ Icon(Icons.search),
               Text('Search'), ], )),)), Container(color: const Color.fromARGB(255, 223, 223, 223),width: 55,height: 55,
               child: Icon(Icons.notifications),) ],), SizedBox(height: 20,), 
               SingleChildScrollView(scrollDirection: Axis.horizontal
               ,child: Row(children: [ Container(width: 350,height: 200,
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
               child: Image.network('https://cdn.grabon.in/gograbon/images/web-images/uploads/1618571140235/mobile-offers.jpg',
               fit: BoxFit.cover,),), SizedBox(width: 10,), Container(width: 350,height: 200,
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
               child: Image.network('https://couponswala.com/blog/wp-content/uploads/2022/08/DIWALI-mobile-offer.png',
               fit: BoxFit.cover,),), SizedBox(width: 10,), Container(width: 350,height: 200,
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
               child: Image.network('https://buy.cashforphone.in/cdn/shop/files/WhatsApp_Image_2025-01-24_at_10.19.40_PM.jpg?v=1737866010&width=1600'
               ,fit: BoxFit.cover,),), SizedBox(width: 10,), ],),), 
               SizedBox(height: 30,), 
               Row( children: [ 
                Text('Categories',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),), 
                SizedBox(width: 180,), TextButton(onPressed: (){ 
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Products())); 
                  },
                   child: Text('See more',selectionColor: Colors.amber,))
                    ], ), 
                    SingleChildScrollView(scrollDirection: Axis.horizontal,
                    child: Row(spacing: 10,children: [
                       GestureDetector(onTap: () { 
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Dresses()));
                         }, 
                         child: Column(children: [ 
                          Container(decoration: BoxDecoration(shape: BoxShape.circle)
                          ,child: Image.network(fit: BoxFit.cover,width: 70,height: 70,'https://media.istockphoto.com/id/178851955/photo/flowery-evase-bateau-yellow-dress.jpg?s=612x612&w=0&k=20&c=EOJGCGC6dmFt0IQvbxq3PthCmNXO1flOpjYWC4KkcyQ='),), 
                          Text('Dresses') ],), ), 
                          GestureDetector(onTap: () { 
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Watches())); 
                            }, 
                            child: Column(children: [
                               Container(decoration: BoxDecoration(shape: BoxShape.circle)
                               ,child: Image.network(fit: BoxFit.cover,width: 70,height: 70,'https://media.istockphoto.com/id/1180244659/photo/luxury-watch-isolated-on-white-background-with-clipping-path-for-artwork-or-design-black.jpg?s=612x612&w=0&k=20&c=yeFNfkQmcVV9BTUlZO8vY_oLOQgDAt23LfCbF1e3fbI='),), 
                               Text('Watches') ],), ), 
                               GestureDetector(onTap: () { 
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Shoes())); 
                                },
                                 child: Column(children: [ Container(
                                  decoration: BoxDecoration(shape: BoxShape.circle),
                                  child: Image.network(fit: BoxFit.cover,width: 70,height: 70,'https://img.freepik.com/free-photo/fashion-shoes-sneakers_1203-7529.jpg?semt=ais_hybrid&w=740&q=80'),),
                                   Text('Shoes') ],), ),
                                    GestureDetector(onTap: () { 
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Caps())); 
                                      }, 
                                      child: Column(children: [ Container(
                                        decoration: BoxDecoration(shape: BoxShape.circle)
                                        ,child: Image.network(fit: BoxFit.cover,width: 70,height: 70,'https://m.media-amazon.com/images/I/41xWhqkvxRL._AC_UY1100_.jpg'),), 
                                        Text('Caps') ],), ), 
                                        GestureDetector(onTap: () { 
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Tablets())); 
                                          },
                                           child: Column(children: [ Container(
                                            decoration: BoxDecoration(shape: BoxShape.circle),
                                            child: Image.network(fit: BoxFit.cover,width: 70,height: 70,'https://images.pexels.com/photos/1334597/pexels-photo-1334597.jpeg?_gl=1*r0rav7*_ga*MzQ1Mzc5ODEyLjE3NjA5Njg5MjM.*_ga_8JE65Q40S6*czE3NjM2OTgyMjQkbzQkZzAkdDE3NjM2OTgyMjQkajYwJGwwJGgw'),), 
                                            Text('Tablets') ],), ), 
                                            GestureDetector(onTap: () { 
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Mobiles())); 
                                              }, 
                                              child: Column(children: [ Container(
                                                decoration: BoxDecoration(shape: BoxShape.circle),
                                                child: Image.network(fit: BoxFit.cover,width: 70,height: 70,'https://www.mobileana.com/wp-content/uploads/2025/06/Apple-iPhone-17-Pro-Max-Cosmic-Orange.webp'),), 
                                                Text('Mobiles') ],), ), ],),), 
                                                SizedBox(height: 20,), 
                                                Text('Popular Items',style: 
                                                TextStyle(fontSize: 25,fontWeight: FontWeight.bold),), Expanded( 
                                                  child: ListView.builder( itemCount: 1, itemBuilder: (context, catIndex) { 
                                                    final displayedProducts = categories.map((cat) => cat.products.first).toList(); 
                                                    return Padding( 
                                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8), 
                                                      child: Column( crossAxisAlignment: CrossAxisAlignment.start, 
                                                      children: [ 
                                                        const SizedBox(height: 8), 
                                                        SizedBox( 
                                                          child: GridView.builder( 
                                                            shrinkWrap: true, 
                                                            physics: const NeverScrollableScrollPhysics(), 
                                                            itemCount: displayedProducts.length, 
                                                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 1, ), 
                                                            itemBuilder: (context, index) { 
                                                              final product = displayedProducts[index]; 
                                                              return GestureDetector(onTap: () { 
                                                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductPage(product: product,)));
                                                                 }, 
                                                                 child: Card( shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(12), ), 
                                                                 elevation: 3, 
                                                                 child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [ 
                                                                    Stack(
                                                                       children: [ 
                                                                        ClipRRect( borderRadius: const BorderRadius.vertical( top: Radius.circular(12)), 
                                                                        child: Image.network( product.imageUrl, height: 100, width: double.infinity, fit: BoxFit.cover, ), ),
                                                                         Positioned( right: 8, top: 8, child: IconButton( icon: Icon( product.isFavorite ? 
                                                                         Icons.favorite : Icons.favorite_border,
                                                                          color: product.isFavorite ? Colors.red : Colors.grey, ),
                                                                           onPressed: () => toggleFavorite(product), ), ), ], ),
                                                                            Padding( padding: const EdgeInsets.symmetric( horizontal: 8, vertical: 4), 
                                                                            child: Text(product.name, style: const TextStyle( fontWeight: FontWeight.bold, fontSize: 16)), ),
                                                                             Padding( padding: const EdgeInsets.symmetric(horizontal: 8), child: Text('₹${product.price}', style: const TextStyle(color: Colors.grey)), ), ], ), ), );
                                                                              },
                                                                               ), ), ], ), );
                                                                                }, ), ), ],),), ),
                                                                                 bottomNavigationBar: BottomNavigationBar( type: BottomNavigationBarType.fixed, currentIndex: 0, onTap: (index) { 
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
                                                                                              selectedItemColor: Colors.amber, unselectedItemColor: Colors.grey, ), );
                                                                                               } }


