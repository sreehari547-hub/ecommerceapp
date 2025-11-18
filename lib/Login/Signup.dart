
import 'package:ecommerceapp/Login/Loginpage.dart';
import 'package:ecommerceapp/Session/Sessionmanager.dart';
import 'package:ecommerceapp/home/Homepage.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}
final  _formKey=GlobalKey<FormState>();



final TextEditingController fnamecontroller=TextEditingController();
final TextEditingController lnamecontroller=TextEditingController();
final TextEditingController emailcontroller=TextEditingController();
final TextEditingController passwordcontroller=TextEditingController();
final TextEditingController confirmpasswordcontroller=TextEditingController();
final TextEditingController mobilecontroller=TextEditingController();

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Form(key: _formKey,child: Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 5,children: [
          Center(child: Text('SignUp',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
          Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 5,children: [
            Text('Name: ',style: TextStyle(fontSize: 18),),
            Row(
              children: [
                Expanded(child: TextFormField(validator: (value) {
                  if (value==null||value.isEmpty) {
              return 'This field should not be empty';
            }
            return null;
                },controller: fnamecontroller,decoration: InputDecoration(label: Text('Enter first name'),border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),),)),
              
            SizedBox(width: 5,),
            Expanded(child: TextFormField(validator: (value) {
              if (value==null||value.isEmpty) {
              return 'This field should not be empty';
            }
              return null;

            },controller: lnamecontroller,decoration: InputDecoration(label: Text('Enter last name'),border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),))
          ],
            ),
          ],),
         
            Text('Email ID: ',style: TextStyle(fontSize: 18),),
            TextFormField(validator: (value) {
              if (value==null||value.isEmpty) {
              return 'This field should not be empty';
            }
             else if (!value.endsWith('@gmail.com')) {
                return 'Enter a valid email address';
              }

            return null;
            },controller: emailcontroller,decoration: InputDecoration(label: Text('Enter the Email Id'),border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),)
         
          ,
            Text('Password ',style: TextStyle(fontSize: 18),),
            TextFormField(validator: (value) {
              if (value==null||value.isEmpty) {
              return 'This field should not be empty';
            }
            else if (value.length < 8) {
               return 'Password must be at least 8 characters';
          } else if (!RegExp(r'^(?=.*[!@#\$%^&*(),.?":{}|<>]).{8,}$').hasMatch(value)) {
               return 'Password must include at least one special character';
          }
            return null;
            },controller: passwordcontroller,decoration: InputDecoration(label: Text('Enter a password'),border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),)
         
,
            Text('Confirm password ',style: TextStyle(fontSize: 18),),
            TextFormField(validator: (value) {
              if (value==null||value.isEmpty) {
              return 'This field should not be empty';
            }
            else if(value!=passwordcontroller.text){
              return  'Password is not the same';
            }
            return null;
            },controller: confirmpasswordcontroller,decoration: InputDecoration(label: Text('Confirm the password'),border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),)
          
          ,
            Text('Mobile number ',style: TextStyle(fontSize: 18),),
            TextFormField(validator: (value) {
              if (value==null||value.isEmpty) {
              return 'This field should not be empty';
            }
            else if(value.length!=10){
              return 'Mobile number shoulld be exact 10 digits';
            }
            
            return null;
            },controller: mobilecontroller,decoration: InputDecoration(label: Text('Enter the Mobile number'),border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),)
          ,Padding(
            padding: const EdgeInsets.only(left: 90),
            child: Row(spacing: 20,children: [
              ElevatedButton(onPressed: (){
                fnamecontroller.clear();
                lnamecontroller.clear();
                emailcontroller.clear();
                passwordcontroller.clear();
                confirmpasswordcontroller.clear();
                mobilecontroller.clear();
              }, style: ElevatedButton.styleFrom(backgroundColor: Colors.amber[900],foregroundColor: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10),),),child: Text('Clear')),
              ElevatedButton(onPressed: () async{
               
                  
                
                if (_formKey.currentState!.validate()) {
                  await SessionManager.saveCreateAccountSession(
                   userMobile: mobilecontroller.text,
                   password: passwordcontroller.text,
                   userFname: fnamecontroller.text,
                   userLname: lnamecontroller.text,
                   useremail: emailcontroller.text,
                );
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Account created!')),);
                
                 
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Loginpage()));
                }
                
              },style: ElevatedButton.styleFrom(backgroundColor: Colors.amber[900],foregroundColor: Colors.white,shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10))),child: Text('Submit'))
            
            ],),
          )     
        ],)),
      ),
    ),);
  }
}