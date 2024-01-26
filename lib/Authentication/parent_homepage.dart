import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:flutter/material.dart';

class ParentHomePage extends StatefulWidget {

  @override
  State<ParentHomePage> createState() => _ParentHomePageState();
}

class _ParentHomePageState extends State<ParentHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('' ,style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        child:
        const Icon(Icons.add, color: Colors.blue,),
        onPressed: () {
          Navigator.pushNamed(context,AppRoutes.register );
        },
      ),);
  }
}
