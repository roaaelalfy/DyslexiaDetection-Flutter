import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:flutter/material.dart';
import '../../widgets/3x3Matrix.dart';

class Q10Screen extends StatelessWidget {
  Q10Screen({Key? key}): super(key: key,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 1.v),
            buildRow_3x3Matrix(
              context,
              Text1: "create",
              Text2: "greate",
              Text3: "grete",
            ),
            SizedBox(height: 10.v),
            buildRow_3x3Matrix(
              context,
              Text1: "creet",
              Text2: "creat",
              Text3: "greet",
            ),
            SizedBox(height: 10.v),
            buildRow_3x3Matrix(
              context,
              Text1: "great",
              Text2: "greit",
              Text3: "crete",
            ),
      ]),
    ));
  }
}
