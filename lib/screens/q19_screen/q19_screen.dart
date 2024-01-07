import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/widgets/3x3Matrix.dart';
import 'package:flutter/material.dart';

class Q19Screen extends StatelessWidget {
  Q19Screen({Key? key}): super(key: key,);

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
                  Text1: "rurled",
                  Text2: "larled",
                  Text3: "lurled",
                ),
                SizedBox(height: 10.v),
                buildRow_3x3Matrix(
                  context,
                  Text1: "lurleb",
                  Text2: "lorled",
                  Text3: "rurled",
                ),
                SizedBox(height: 10.v),
                buildRow_3x3Matrix(
                  context,
                  Text1: "larled",
                  Text2: "roled",
                  Text3: "lurleb",
                ),
              ]),
        ));
  }
}
