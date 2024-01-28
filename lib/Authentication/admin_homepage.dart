import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/firestore_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatefulWidget {
  final String admin = 'fglxRerc2FOva0Q0AGiWNGRLY0G2';

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  late Future<List<Map<String, dynamic>>> playersFuture;

  @override
  void initState() {
    super.initState();
    playersFuture = FirestoreService().getAllAddedPlayers(widget.admin);
  }

  Widget buildGenderImage(String gender) {

    if (gender == 'male') {
        return Image.asset(
          'assets/images/boy_avatar.png',
          width: 100, // specify the desired width
          height: 100, // specify the desired height
      );
    } else if (gender == 'female') {
        return Image.asset(
          'assets/images/girl_avatar.png',
          width: 120, // specify the desired width
          height: 120, // specify the desired height
      );
    } else {
      return Container(); // or return null;
    }
  }

  Widget buildPlayerCard(Map<String, dynamic> player) {
    return Card(

      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(5),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${player['name'] ?? 'N/A'}'),
            Text('Age: ${player['age'] ?? 'N/A'}'),
            Text('Native Language: ${player['nativeLang'] ?? 'N/A'}'),
            Text('Other Language: ${player['otherLang'] ?? 'N/A'}'),
            Text('Result'),
          ],
        ),
        trailing: IntrinsicWidth(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(),
              buildGenderImage('${player['gender']}'),
            ],
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        title: const Text(
          'Players',
          style: TextStyle(
            color: Colors.indigo,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: playersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No players added yet.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> player = snapshot.data![index];
                return buildPlayerCard(player);
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, color: Colors.blue,),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.registerUserAsAdmin);
        },
      ),
    );
  }
}
