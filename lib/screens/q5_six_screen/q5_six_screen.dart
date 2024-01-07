import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/widgets/5x5Matrix.dart';
import 'package:flutter/material.dart';

class Q5Screen extends StatelessWidget {
  Q5Screen({Key? key}): super(key: key,);

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
              Text1: "nu",
              Text2: "da",
              Text3: "ba",
              Text4: "nu",
              Text5: "da",
            ),
            SizedBox(height: 10.v),
            buildRow_5x5Matrix(
              context,
              Text1: "ne",
              Text2: "no",
              Text3: "de",
              Text4: "ne",
              Text5: "pu",
            ),
            SizedBox(height: 10.v),
            buildRow_5x5Matrix(
              context,
              Text1: "qu",
              Text2: "da",
              Text3: "qa",
              Text4: "qu",
              Text5: "na",
            ),
            SizedBox(height: 10.v),
            buildRow_5x5Matrix(
              context,
              Text1: "be",
              Text2: "qe",
              Text3: "pu",
              Text4: "pa",
              Text5: "ba",
            ),
            SizedBox(height: 10.v),
            buildRow_5x5Matrix(
              context,
              Text1: "be",
              Text2: "da",
              Text3: "pe",
              Text4: "pa",
              Text5: "ba",
            ),
          ],
        ),
      ),
    );
  }

}
