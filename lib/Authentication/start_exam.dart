import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartExamPage extends StatefulWidget{
  StartExamPage({super.key});
  @override
  State<StatefulWidget> createState() => _StartExamPageState();
}

class _StartExamPageState extends State<StartExamPage>{

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
                image: AssetImage('assets/images/start_exam.png'),
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
                    padding: const EdgeInsets.only(top:450),
                    child: Text('Are you ready?',style:TextStyle( fontSize: 20,fontWeight: FontWeight.bold,
                        color: Colors.white)),
                  )
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child:
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.countdown);
                  },
                  child: Text(
                    'Start Exam', style: TextStyle(fontSize: 20,
                      color:Colors.white,
                      fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 10, // Set a higher elevation value
                    backgroundColor: Colors.greenAccent[400],
                    minimumSize: Size(250, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
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