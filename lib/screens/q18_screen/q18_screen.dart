import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/widgets/3x3Matrix.dart';
import 'package:flutter/material.dart';

class Q18Screen extends StatelessWidget {
  Q18Screen({Key? key}): super(key: key,);

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
              Text1: "krench",
              Text2: "crenh",
              Text3: "crench",
            ),
            SizedBox(height: 10.v),
            buildRow_3x3Matrix(
              context,
              Text1: "crenh",
              Text2: "cernch",
              Text3: "cernh",
            ),
            SizedBox(height: 10.v),
            buildRow_3x3Matrix(
              context,
              Text1: "cernch",
              Text2: "cronch",
              Text3: "cernch",
            ),
      ]),
    ));
  }
}
