import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/services/firestore_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/firebase_auth.dart';

class LoginPage extends StatefulWidget{
  LoginPage({super.key});
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  TextEditingController _loginemailController = TextEditingController();
  TextEditingController _loginpasswordController = TextEditingController();

  final FirebaseAuthService _auth = FirebaseAuthService();

  void initState() {
    super.initState();
  }
  void dispose() {
    _loginemailController.dispose();
    _loginpasswordController.dispose();
    super.dispose();
  }
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Stack(
       children: [
         Container(
           decoration: const BoxDecoration(
             image: DecorationImage(
               image: AssetImage('assets/images/login.png'),
               fit: BoxFit.cover,
             ),
           ),
         ),
         Center(
           child: SingleChildScrollView(
                 child: Padding(
                   padding:EdgeInsets.all(0),
                   child: Form(
                     key: _loginFormKey,
                     child: Padding(
                       padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         mainAxisSize: MainAxisSize.max,
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             mainAxisSize: MainAxisSize.max,
                             children: [
                               Image.asset(
                                 'assets/images/logo_navy.png',
                                 width: 70, // Adjust the width as needed
                                 height: 70, // Adjust the height as needed
                               ),
                               SizedBox(width: 10),
                               Text('Dyadapt',style:TextStyle( fontFamily:'OpenDyslexic',
                                   fontSize: 45,
                                   color: Colors.indigo[900])),
                             ],
                           ),
                           Padding(
                             padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
                             child: TextFormField(
                               controller: _loginemailController,
                               decoration: InputDecoration(
                                 prefixIcon: Icon(Icons.email),
                                 hintText: 'Enter your email',
                                 enabledBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(25),
                                   borderSide: const BorderSide(
                                     color: Colors.black12,
                                     width: 1,
                                   ),
                                 ),
                                 filled: true,
                                 floatingLabelBehavior: FloatingLabelBehavior.always,
                               ),
                               validator: (value) {
                                 if (value == null || value.isEmpty) {
                                   return 'Please enter your email address';
                                 }
                                 return null;
                               },
                             ),
                           ),
                           Padding(
                             padding: EdgeInsets.fromLTRB(50, 5, 50, 0),
                             child: TextFormField(
                               controller: _loginpasswordController,
                               obscureText: true,
                               decoration: InputDecoration(
                                 prefixIcon: Icon(Icons.lock),
                                 hintText: 'Enter your password',
                                 enabledBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(25),
                                   borderSide: const BorderSide(
                                     color: Colors.black12,
                                     width: 1,
                                   ),
                                 ),
                                 filled: true,
                                 floatingLabelBehavior: FloatingLabelBehavior.always,
                               ),
                               validator: (value) {
                                 if (value == null || value.isEmpty) {
                                   return 'Please enter your password';
                                 }
                                 return null;
                               },
                             ),
                           ),
                           Padding(
                             padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
                             child: Column(
                               mainAxisSize: MainAxisSize.max,
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 ElevatedButton(
                                   onPressed: () {
                                     if (_loginFormKey.currentState?.validate() ?? false)
                                     {
                                       login();
                                     }
                                   },
                                   child: Text('Login', style: TextStyle(fontSize: 20, color:Colors.white)),
                                   style: ElevatedButton.styleFrom(
                                     elevation: 12, // Set a higher elevation value
                                     backgroundColor: Colors.indigo[900],
                                     minimumSize: Size(250, 50),
                                     shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(25.0),
                                     ),
                                   ),
                                 ),
                                 TextButton(
                                   onPressed: () {
                                     Navigator.pushNamed(context,AppRoutes.role);
                                   },
                                   child: Text(
                                     ' Create Account',
                                     style: TextStyle(fontSize: 20,
                                         color: Colors.white,
                                         fontWeight: FontWeight.bold,
                                         decoration: TextDecoration.underline,
                                         decorationColor: Colors.white, // Optional: Set the underline color
                                         decorationThickness: 2.0,  ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),
               )
         ),
       ],
     ),
   );
  }

  void login() async{
    String email = _loginemailController.text;
    String password = _loginpasswordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);
    if (user != null){
      final roleOfCurrentUser = await FirestoreService().getRolebyUserId(user.uid);
      if(roleOfCurrentUser == "admin"){
        Navigator.pushNamed(context,AppRoutes.adminHomePage);
      }else if(roleOfCurrentUser == "user") {
        Navigator.pushNamed(context, AppRoutes.startExam);
      }
    } else{
      _showErrorMessage('Invalid email or password');
    }
  }
  void _showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Could not login'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK' , style: TextStyle(color:Colors.blue)),
            ),
          ],
        );
      },
    );
  }
}