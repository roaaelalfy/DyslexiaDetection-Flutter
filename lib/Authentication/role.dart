import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RolePage extends StatefulWidget{
  RolePage({super.key});
  @override
  State<StatefulWidget> createState() => _RolePageState();
}

class _RolePageState extends State<RolePage>{
  String? role;
  void initState() {
    super.initState();
  }
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/role_wallpaper.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child:Padding(
                    padding: const EdgeInsets.only(top:250),
                    child: Text('Choose your role',style:TextStyle( fontSize: 40,fontWeight: FontWeight.bold,
                        color: Colors.white)),
                  )
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child:
                ElevatedButton(
                  onPressed: () {
                    role ='User';
                    Navigator.pushNamed(context, AppRoutes.register);
                  },
                  child: Text(
                      'User', style: TextStyle(fontSize: 20,
                      color:Colors.indigo[900],
                      fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    elevation: 10, // Set a higher elevation value
                    backgroundColor: Colors.white,
                    minimumSize: Size(250, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child:
                ElevatedButton(
                  onPressed: () {
                    role ='Teacher';
                    Navigator.pushNamed(context, AppRoutes.register);
                  },
                  child: Text(
                      'Parent/Teacher', style: TextStyle(fontSize: 20,
                      color:Colors.white,
                      fontWeight: FontWeight.bold),
                      ),
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
          )
        ],
      ),
    );
  }
}