import 'dart:developer';
 import 'package:shared_preferences/shared_preferences.dart';



  class SessionManager { static const String _keyIsLoggedin='isLoggedin'; 
  static const String _keyUserEmail='useremail';
   static const String _keyUserFname='userFname';
    static const String _keyUserLname='userLname'; 
    static const String _keyPassword='password'; 
    static const String _keyUserMobile='userMobile'; 
    static Future<Map<String,String?>> getUserSession() async{ try { final Sharedpref= await SharedPreferences.getInstance(); 
    return { 
      'useremail':Sharedpref.getString(_keyUserEmail), 
      'userpassword': Sharedpref.getString(_keyPassword), 
      'userFname': Sharedpref.getString(_keyUserFname),
      'userLname': Sharedpref.getString(_keyUserLname),
      'userMobile': Sharedpref.getString(_keyUserMobile),
      };
     } catch (e) { log('Error while getting datas $e'); 
     return {}; 
     } } 
     static Future<bool> saveCreateAccountSession({ required String userMobile, required String password, required String userFname, required String userLname, required String useremail, }) async{ 
      try { 
        SharedPreferences Sharedpref=await SharedPreferences.getInstance(); 
      await Sharedpref.setString(_keyUserFname, userFname); 
      await Sharedpref.setString(_keyUserLname, userLname); 
      await Sharedpref.setString(_keyUserEmail, useremail); 
      await Sharedpref.setString(_keyPassword, password); 
      await Sharedpref.setString(_keyUserMobile, userMobile); 
      return true; 
      } catch (e) { 
        log('Error saving create account session $e'); 
        return false; } } 
        static Future<bool> saveLoginSession({ required String password,required String useremail, }) async{ 
          try { 
            SharedPreferences Sharedpref=await SharedPreferences.getInstance();
           await Sharedpref.setBool(_keyIsLoggedin, true); 
           await Sharedpref.setString(_keyPassword, password); 

           
            await Sharedpref.setString(_keyUserEmail, useremail); 
           
           return true; 
           } catch (e) { 
            log('Error saving login session: $e'); 
            return false; 
            } } 
            static Future<bool>isLoggedin() async{ 
              try { 
                SharedPreferences sharedPreferences= await SharedPreferences.getInstance(); 
                return sharedPreferences.getBool(_keyIsLoggedin)?? false; 
              } catch (e) { 
                log('Error while checking login status $e');
                 return false; 
                 } 
                 } 
                 static Future<bool> sessionclear() async{ 
                  try { SharedPreferences sharedPreferences=await SharedPreferences.getInstance(); 
                  await sharedPreferences.remove(_keyIsLoggedin);
                   await sharedPreferences.remove(_keyPassword); 
                   await sharedPreferences.remove(_keyUserEmail);
                   await sharedPreferences.remove(_keyUserFname);
                   await sharedPreferences.remove(_keyUserMobile);
                   await sharedPreferences.remove(_keyUserLname);
                    return true; } catch (e) { 
                      log('Error while clearing session $e'); 
                      return false; 
                      } 
                      } 

              static Future<bool> isLoggedInFully() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool flag = prefs.getBool(_keyIsLoggedin) ?? false;
    String? email = prefs.getString(_keyUserEmail);
    String? password = prefs.getString(_keyPassword);
    return flag && email != null && password != null;
  } catch (e) {
    log('Error checking full login status: $e');
    return false;
  }
  
}



                      }
                      