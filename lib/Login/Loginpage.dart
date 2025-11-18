import 'dart:developer';


import 'package:ecommerceapp/Login/Signup.dart';
import 'package:ecommerceapp/Session/Sessionmanager.dart';
import 'package:ecommerceapp/home/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}
final  _formKey=GlobalKey<FormState>();
final TextEditingController emailcontroller=TextEditingController();
final TextEditingController passwordcontroller=TextEditingController();


class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Padding(
      padding: const EdgeInsets.only(left: 40,right: 40),
      child: Form(key: _formKey,child: Column(
        children: [SizedBox(height: 70,),
          Center(child: Text('LOGIN',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)),
          SizedBox(height: 30,),
          TextFormField(validator: (value) {
            if (value==null||value.isEmpty) {
              return 'This field should not be empty';
            }
            return null;
          },controller: emailcontroller,decoration: InputDecoration(label: Text('Enter Email Id'),border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),)
          ,SizedBox(height: 20,),
          TextFormField(validator: (value) {
            if (value==null||value.isEmpty) {
              return 'This field should not be empty';
            }
            return null;
          },controller: passwordcontroller,decoration: InputDecoration(label: Text('Enter password'),border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),)
          ,Padding(
            padding: const EdgeInsets.only(left: 130),
            child: TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
            }, child: Text('Are you a new user? Click here',style: TextStyle(fontSize: 12),)),
          )
          ,SizedBox(height: 20,),
            ElevatedButton(onPressed: () async{ 
              
              if (_formKey.currentState!.validate()) {
                final sessionData=await SessionManager.getUserSession();
                final savedemail=sessionData['useremail'];
                final savedpassword=sessionData['userpassword'];

                if (emailcontroller.text==savedemail&&passwordcontroller.text==savedpassword) {
                  await SessionManager.saveLoginSession(
          useremail: savedemail!,
          password: savedpassword!,
        );
        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful!')),
        );
        

                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homepage()));
                }
                else{
                  if (!mounted) return;

                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Invalid email or password')),);
                }

                
              }
              
            },style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 145, 0),foregroundColor: Colors.white),child: Text('Submit'))
        ],
      )),
    )),);
  }
}