import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/widgets/5x5Matrix.dart';
import 'package:flutter/material.dart';

class Q14Screen extends StatelessWidget {
  Q14Screen({Key? key}): super(key: key,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 1.v),
            buildRow_5x5Matrix(
              context,
              Text1: "E",
              Text2: "E",
              Text3: "E",
              Text4: "E",
              Text5: "E",
            ),
            SizedBox(height: 10.v),
            buildRow_5x5Matrix(
              context,
              Text1: "E",
              Text2: "F",
              Text3: "E",
              Text4: "E",
              Text5: "E",
            ),
            SizedBox(height: 10.v),
            buildRow_5x5Matrix(
              context,
              Text1: "E",
              Text2: "E",
              Text3: "E",
              Text4: "E",
              Text5: "E",
            ),
            SizedBox(height: 10.v),
            buildRow_5x5Matrix(
              context,
              Text1: "E",
              Text2: "E",
              Text3: "E",
              Text4: "E",
              Text5: "E",
            ),
            SizedBox(height: 10.v),
            buildRow_5x5Matrix(
              context,
              Text1: "E",
              Text2: "E",
              Text3: "E",
              Text4: "E",
              Text5: "E",
            ),
          ],
        ),
      ),
    );
  }
}
