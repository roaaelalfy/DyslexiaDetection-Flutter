import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/firebase_auth.dart';
import '../services/firestore_services.dart';
import 'Provider.dart';

class RegisterUserPage extends StatefulWidget{
  RegisterUserPage({super.key});
  @override
  State<StatefulWidget> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage>{

  bool _isNative = false;
  bool _failedLangSubject = false;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _nationalIDController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _isNativeController = TextEditingController();
  TextEditingController _failedLangController = TextEditingController();
  late int age;
  DateTime? _selectedDate;

  final FirebaseAuthService _auth = FirebaseAuthService();

  void initState() {
    super.initState();
  }
  void dispose() {
    _nameController.dispose();
    _nationalIDController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _failedLangController.dispose();
    _isNativeController.dispose();
    _ageController.dispose();
    _genderController.dispose();

    super.dispose();
  }
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          backgroundColor: Colors.grey[50],
          appBar: AppBar(backgroundColor:Colors.grey[50],
            title:Text("Let's get started",style:TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900]),),
            centerTitle: true,),
          body: SingleChildScrollView(
            child: Padding(
              padding:EdgeInsets.only(top:10),
              child: Form(
                key: _loginFormKey,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                        child: TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: 'Enter full name',
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
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please enter your full name';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                        child: TextFormField(
                          controller: _ageController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.calendar_today),
                            hintText: 'Enter Age',
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
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please enter your full name';
                          //   }
                          //   return null;
                          // },
                        ),),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                        child: TextFormField(
                          controller: _nationalIDController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.insert_drive_file),
                            hintText: 'Enter National ID',
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
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please enter your National ID';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: 'Enter email',
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
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please enter your email address';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                        child: TextFormField(
                          controller: _passwordController,
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
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please enter your password';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                        child: TextFormField(
                          controller: _genderController,
                          readOnly: true,
                          onTap: () {
                            // Open dropdown menu when the text field is tapped
                            _openGenderDropdown(context);
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.autofps_select),
                            hintText: 'Select gender',
                            suffixIcon: InkWell(
                              onTap: () {
                                // Open dropdown menu when the suffix icon is pressed
                                _openGenderDropdown(context);
                              },
                              child: Icon(Icons.arrow_drop_down),
                            ),
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
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please select your gender';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                        child: TextFormField(
                          controller: _isNativeController,
                          readOnly: true,
                          onTap: () {
                            // Open dropdown menu when the text field is tapped
                            _openNativeLanguageDropdown(context);
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.language),
                            hintText: 'Is English your native language?',
                            suffixIcon: InkWell(
                              onTap: () {
                                // Open dropdown menu when the suffix icon is pressed
                                _openNativeLanguageDropdown(context);
                              },
                              child: Icon(Icons.arrow_drop_down),
                            ),
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
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'this field is required';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                        child: TextFormField(
                          controller: _failedLangController,
                          readOnly: true,
                          onTap: () {
                            // Open dropdown menu when the text field is tapped
                            _openFailedLanguageDropdown(context);
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.sms_failed),
                            hintText: 'Failed a language subject?',
                            suffixIcon: InkWell(
                              onTap: () {
                                // Open dropdown menu when the suffix icon is pressed
                                _openFailedLanguageDropdown(context);
                              },
                              child: Icon(Icons.arrow_drop_down),
                            ),
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
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'This field is required';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child:
                        ElevatedButton(
                          onPressed: () {
                            if (_loginFormKey.currentState?.validate() ?? false)
                            {
                              registerNewUser();
                            }
                          },
                          child: Text('Register', style: TextStyle(fontSize: 20, color:Colors.white)),
                          style: ElevatedButton.styleFrom(
                            elevation: 10, // Set a higher elevation value
                            backgroundColor: Colors.indigo[900],
                            minimumSize: Size(250, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
      ),
    );
  }

  void registerNewUser() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    String username = _nameController.text;
    String gender = _genderController.text;
    String nationalId = _nationalIDController.text;
    String nativeLang = _isNativeController.text;
    String otherLang = _failedLangController.text;
    String age = _ageController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    if (user != null) {
      addUserToFirestore(
          user,
          username,
          email,
          password,
          age,
          gender,
          nationalId,
          nativeLang,
          otherLang);
      print('Added new user to firestore');
      Navigator.pushNamed(context, AppRoutes.startExam);
    } else {
      print('Process Failed');
    }
  }

  Future<void> addUserToFirestore(User user, String username, String email,
      String password, String age, String gender, String nationalId,
      String nativeLang, String otherLang) async {
    await FirestoreService().playersCollection.doc(user.uid).set({
      'userId': user.uid,
      'name': username,
      'email': user.email,
      'password': password,
      'gender': gender,
      'age': age,
      'nationalId': nationalId,
      'nativeLang': nativeLang,
      'otherLang': otherLang,
      'role': "user",
    });
  }

  /******************Gender DropDown**************************************************/
  void _openGenderDropdown(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200, // Set the height of the dropdown menu
          child: Column(
            children: [
              ListTile(
                title: Text('Female'),
                onTap: () {
                  setState(() {
                    _genderController.text = 'Female';
                    Navigator.pop(context); // Close the dropdown menu
                  });
                },
              ),
              ListTile(
                title: Text('Male'),
                onTap: () {
                  setState(() {
                    _genderController.text = 'Male';
                    Navigator.pop(context); // Close the dropdown menu
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
/**********************************************************************************/

  /***************************Native DropDown Menu***********************************/
  void _openNativeLanguageDropdown(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150, // Set the height of the dropdown menu
          child: Column(
            children: [
              ListTile(
                title: Text('Yes'),
                onTap: () {
                  setState(() {
                    _isNative = true;
                    _isNativeController.text='Yes';
                    Navigator.pop(context); // Close the dropdown menu
                  });
                },
              ),
              ListTile(
                title: Text('No'),
                onTap: () {
                  setState(() {
                    _isNative = false;
                    _isNativeController.text='No';
                    Navigator.pop(context); // Close the dropdown menu
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
/***********************************************************************/

  /****************************Failed Languange Dropdown******************************************/
  void _openFailedLanguageDropdown(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150, // Set the height of the dropdown menu
          child: Column(
            children: [
              ListTile(
                title: Text('Yes'),
                onTap: () {
                  setState(() {
                    _failedLangSubject = true;
                    _failedLangController.text='Yes';
                    Navigator.pop(context); // Close the dropdown menu
                  });
                },
              ),
              ListTile(
                title: Text('No'),
                onTap: () {
                  setState(() {
                    _failedLangSubject = false;
                    _failedLangController.text='No';
                    Navigator.pop(context); // Close the dropdown menu
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
/**************************************************************************/
}