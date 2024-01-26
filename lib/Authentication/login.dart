import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  LoginPage({super.key});
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  TextEditingController _loginemailController = TextEditingController();
  TextEditingController _loginpasswordController = TextEditingController();

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
               image: AssetImage('assets/images/Dyadpt_register_wallpaper.png'),
               fit: BoxFit.cover,
             ),
           ),
         ),
         Center(
           child: SingleChildScrollView(
                 child: Padding(
                   padding:EdgeInsets.only(top:0),
                   child: Form(
                     key: _loginFormKey,
                     child: Padding(
                       padding: EdgeInsets.all(10),
                       child: Column(
                         mainAxisSize: MainAxisSize.max,
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text('Dyadapt',style:TextStyle( fontFamily:'OpenDyslexic',fontSize: 50,
                               color: Colors.blue[900])),
                           Padding(
                             padding: EdgeInsets.all(10),
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
                             padding: EdgeInsets.all(10),
                             child: TextFormField(
                               controller: _loginpasswordController,
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
                             padding: EdgeInsets.all(10),
                             child: Row(
                               mainAxisSize: MainAxisSize.max,
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Column(
                                   mainAxisSize: MainAxisSize.max,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text(
                                       'Don\'t have an account?',
                                       style: TextStyle(fontSize: 18, color: Colors.lightBlue[900], fontWeight: FontWeight.bold)
                                     ),
                                     TextButton(
                                         onPressed: () {
                                           Navigator.pushNamed(context,AppRoutes.register);
                                         },
                                         child: Text(
                                           'Create Account',
                                           style: TextStyle(fontSize: 18, color: Colors.lightBlue[900], fontWeight: FontWeight.bold),
                                         ),
                                     ),
                                   ],

                                 ),
                                 ElevatedButton(
                                   onPressed: () {
                                     if (_loginFormKey.currentState?.validate() ?? false)
                                     {}
                                   },
                                   child: Text('Login', style: TextStyle(fontSize: 18, color:Colors.white)),
                                   style: ElevatedButton.styleFrom(
                                     elevation: 12, // Set a higher elevation value
                                     backgroundColor: Colors.blue[900],
                                     minimumSize: Size(150, 50),
                                     shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(25.0),
                                     ),
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
}