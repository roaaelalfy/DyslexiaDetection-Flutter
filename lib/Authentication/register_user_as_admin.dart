import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/services/firestore_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class RegisterUserAsAdminPage extends StatefulWidget{
  RegisterUserAsAdminPage({super.key});
  @override
  State<StatefulWidget> createState() => _RegisterUserAsAdminPageState();
}

class _RegisterUserAsAdminPageState extends State<RegisterUserAsAdminPage>{

  bool _isNative = false;
  bool _failedLangSubject = false;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _nationalIDController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _isNativeController = TextEditingController();
  TextEditingController _failedLangController = TextEditingController();
  late int age;

  DateTime? _selectedDate;

  final String adminId = FirebaseAuth.instance.currentUser!.uid;

  void initState() {
    super.initState();
  }
  void dispose() {
    super.dispose();
  }
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

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
                              addNewPlayer();
                            }
                          },
                          child: Text('Add Player', style: TextStyle(fontSize: 20, color:Colors.white)),
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
  Future<void> addNewPlayer() async{
    final playerId = FirestoreService().generatePlayerId(adminId);
    await FirestoreService().addPlayer({
      'playerId': playerId,
      'name' : _nameController.text,
      'gender' : _genderController.text,
      'age' : _ageController.text,
      'nativeLang' : _isNativeController.text,
      'otherLang' : _failedLangController.text,
      'nationalId' : _nationalIDController.text,
      'result' : null,
    }, playerId, adminId);
    Navigator.pop(context);
  }
}