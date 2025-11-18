import 'package:ecommerceapp/home/Homepage.dart';
import 'package:ecommerceapp/pages/cartpage.dart';
import 'package:ecommerceapp/pages/Favorites.dart';
import 'package:ecommerceapp/products/product_list.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: BottomNavigationBar(
  type: BottomNavigationBarType.fixed,
  currentIndex: 3, 
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