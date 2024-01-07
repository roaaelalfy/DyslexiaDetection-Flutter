import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/widgets/5x5Matrix.dart';
import 'package:flutter/material.dart';

class Q17Screen extends StatelessWidget {
  Q17Screen({Key? key}): super(key: key,);

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
              Text1: "b",
              Text2: "b",
              Text3: "b",
              Text4: "b",
              Text5: "b",
            ),
            SizedBox(height: 10.v),
            buildRow_5x5Matrix(
              context,
              Text1: "b",
              Text2: "b",
              Text3: "b",
              Text4: "b",
              Text5: "b",
            ),
            SizedBox(height: 10.v),
            buildRow_5x5Matrix(
              context,
              Text1: "b",
              Text2: "b",
              Text3: "b",
              Text4: "b",
              Text5: "b",
            ),
            SizedBox(height: 10.v),
            buildRow_5x5Matrix(
              context,
              Text1: "b",
              Text2: "b",
              Text3: "b",
              Text4: "b",
              Text5: "b",
            ),
            SizedBox(height: 10.v),
            buildRow_5x5Matrix(
              context,
              Text1: "d",
              Text2: "b",
              Text3: "b",
              Text4: "b",
              Text5: "b",
            ),
          ],
        ),
      ),
    );
  }
}
