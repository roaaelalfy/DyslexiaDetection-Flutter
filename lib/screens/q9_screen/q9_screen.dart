import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/widgets/6x6Matrix.dart';
import 'package:flutter/material.dart';

class Q9Screen extends StatelessWidget {
  Q9Screen({Key? key}): super(key: key,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 1.v),
            buildRow_6x6Matrix(
              context,
              Text1: "grel",
              Text2: "glis",
              Text3: "glil",
              Text4: "gris",
              Text5: "grel",
              Text6: "glis",
            ),
            SizedBox(height: 10.v),
            buildRow_6x6Matrix(
              context,
              Text1: "glis",
              Text2: "glis",
              Text3: "grel",
              Text4: "gris",
              Text5: "glil",
              Text6: "glis",
            ),
            SizedBox(height: 10.v),
            buildRow_6x6Matrix(
              context,
              Text1: "glis",
              Text2: "gerl",
              Text3: "grel",
              Text4: "gler",
              Text5: "grel",
              Text6: "glis",
            ),
            SizedBox(height: 10.v),
            buildRow_6x6Matrix(
              context,
              Text1: "grel",
              Text2: "glis",
              Text3: "gris",
              Text4: "glil",
              Text5: "grel",
              Text6: "glis",
            ),
            SizedBox(height: 10.v),
            buildRow_6x6Matrix(
              context,
              Text1: "glil",
              Text2: "glis",
              Text3: "gerl",
              Text4: "gris",
              Text5: "grel",
              Text6: "gils",
            ),
          ],
        ),
      ),
    );
  }
}
