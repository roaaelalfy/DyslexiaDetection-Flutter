import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget{
  RegisterPage({super.key});
  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{

  bool _isFemale = false;
  bool _isMale = false;
  bool _isNative = false;
  bool _failedLangSubject = false;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _nationalIDController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  void initState() {
    super.initState();
  }
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
          child:Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Dyadpt.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding:EdgeInsets.only(top:100),
                  child: Form(
                    key: _loginFormKey,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your full name';
                                }
                                return null;
                              },
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.all(5),
                            child: TextFormField(
                              controller: _nationalIDController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.confirmation_number),
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your National ID';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email address';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.password),
                                hintText: 'Enter password',
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Select gender:',style: TextStyle(fontSize: 16),),
                                SizedBox(width: 10), // Add some space between the text and checkboxes
                                Checkbox(
                                  value: _isFemale,
                                  onChanged: (value) {
                                    setState(() {
                                      _isFemale = value!;
                                      if (_isFemale) {
                                        _isMale = false;
                                      }
                                    });
                                  },
                                ),
                                Text('Female',style: TextStyle(fontSize: 16),),
                                SizedBox(width: 10), // Add space between the checkboxes
                                Checkbox(
                                  value: _isMale,
                                  onChanged: (value) {
                                    setState(() {
                                      _isMale = value!;
                                      if (_isMale) {
                                        _isFemale = false;
                                      }
                                    });
                                  },
                                ),
                                Text('Male',style: TextStyle(fontSize: 16),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Is English your native language?',style: TextStyle(fontSize: 16),),
                                SizedBox(width: 65), // Add some space between the text and checkboxes
                                Checkbox(
                                  value: _isNative,
                                  onChanged: (value) {
                                    setState(() {
                                      _isNative = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Have you ever failed a language subject?',style: TextStyle(fontSize: 16),),
                                 // Add some space between the text and checkboxes
                                Checkbox(
                                  value: _failedLangSubject,
                                  onChanged: (value) {
                                    setState(() {
                                      _failedLangSubject = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.all(10),
                            child:
                                ElevatedButton(
                                  onPressed: () {
                                    if (_loginFormKey.currentState?.validate() ?? false)
                                    {}
                                  },
                                  child: Text('Register', style: TextStyle(fontSize: 18, color:Colors.white)),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 12, // Set a higher elevation value
                                    backgroundColor: Colors.blue[900],
                                    minimumSize: Size(150, 50),
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
            ],
          )
      ),
    );
  }
}