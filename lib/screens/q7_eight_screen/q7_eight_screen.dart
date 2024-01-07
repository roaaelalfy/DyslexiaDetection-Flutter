import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/widgets/5x5Matrix.dart';
import 'package:flutter/material.dart';

class Q7Screen extends StatelessWidget {
  Q7Screen({Key? key}): super(key: key,);

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
              Text1: "pra",
              Text2: "par",
              Text3: "qar",
              Text4: "gar",
              Text5: "are",
            ),
            SizedBox(height: 10.v),
            buildRow_5x5Matrix(
              context,
              Text1: "gra",
              Text2: "dar",
              Text3: "gar",
              Text4: "qar",
              Text5: "der",
            ),
            SizedBox(height: 10.v),
            buildRow_5x5Matrix(
              context,
              Text1: "pra",
              Text2: "ger",
              Text3: "gre",
              Text4: "qer",
              Text5: "bar",
            ),
            SizedBox(height: 10.v),
            buildRow_5x5Matrix(
              context,
              Text1: "gar",
              Text2: "ger",
              Text3: "per",
              Text4: "qer",
              Text5: "qra",
            ),
            SizedBox(height: 10.v),
            buildRow_5x5Matrix(
              context,
              Text1: "are",
              Text2: "gre",
              Text3: "par",
              Text4: "gre",
              Text5: "bar",
            ),
          ],
        ),
      ),
    );
  }
}
