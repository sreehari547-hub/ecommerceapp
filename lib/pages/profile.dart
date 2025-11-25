import 'package:ecommerceapp/Login/Loginpage.dart';
import 'package:ecommerceapp/Session/Sessionmanager.dart';
import 'package:ecommerceapp/home/Homepage.dart';
import 'package:ecommerceapp/pages/cartpage.dart';
import 'package:ecommerceapp/pages/Favorites.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _mobile;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

 Future<void> _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _firstName = prefs.getString('userFname');
      _lastName = prefs.getString('userLname');
      _email = prefs.getString('useremail');
      _mobile = prefs.getString('userMobile');
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        child: Text(
                          (_firstName ?? '?').isNotEmpty
                              ? (_firstName ?? '?')[0].toUpperCase()
                              : '?',
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            [_firstName, _lastName]
                                .where((e) => (e ?? '').isNotEmpty)
                                .join(' ')
                                .trim()
                                .isEmpty
                                ? 'Guest User'
                                : [_firstName, _lastName]
                                    .where((e) => (e ?? '').isNotEmpty)
                                    .join(' '),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            _email ?? 'Email not available',
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.phone),
                      title: const Text('Phone'),
                      subtitle:
                          Text(_mobile?.isNotEmpty == true ? _mobile! : 'Not set'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.mail),
                      title: const Text('Email'),
                      subtitle:
                          Text(_email?.isNotEmpty == true ? _email! : 'Not set'),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      minimumSize: const Size.fromHeight(48),
                    ),
                    icon: const Icon(Icons.logout, color: Colors.white),
                    label: const Text(
                      'Log out',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () async {
                      final success = await SessionManager.sessionclear();
                      if (!mounted) return;
                      if (success) {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (_) => const Loginpage(),
                          ),
                          (route) => false,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text('Failed to log out. Please try again.')),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
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
),
    );
  }
}