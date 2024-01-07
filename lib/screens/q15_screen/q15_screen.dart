import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/widgets/5x5Matrix.dart';
import 'package:flutter/material.dart';

class Q15Screen extends StatelessWidget {
  Q15Screen({Key? key}): super(key: key,);

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
              Text1: "q",
              Text2: "q",
              Text3: "q",
              Text4: "q",
              Text5: "q",
            ),
            SizedBox(height: 10.v),
            buildRow_5x5Matrix(
              context,
              Text1: "q",
              Text2: "q",
              Text3: "q",
              Text4: "q",
              Text5: "q",
            ),
            SizedBox(height: 10.v),
            buildRow_5x5Matrix(
              context,
              Text1: "q",
              Text2: "q",
              Text3: "q",
              Text4: "q",
              Text5: "q",
            ),
            SizedBox(height: 10.v),
            buildRow_5x5Matrix(
              context,
              Text1: "q",
              Text2: "q",
              Text3: "p",
              Text4: "q",
              Text5: "q",
            ),
            SizedBox(height: 10.v),
            buildRow_5x5Matrix(
              context,
              Text1: "q",
              Text2: "q",
              Text3: "q",
              Text4: "q",
              Text5: "q",
            ),
          ],
        ),
      ),
    );
  }
}
