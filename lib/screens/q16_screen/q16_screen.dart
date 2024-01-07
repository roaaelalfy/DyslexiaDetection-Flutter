import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/widgets/5x5Matrix.dart';
import 'package:flutter/material.dart';

class Q16Screen extends StatelessWidget {
  Q16Screen({Key? key}): super(key: key,);

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
              Text1: "n",
              Text2: "n",
              Text3: "n",
              Text4: "n",
              Text5: "n",
            ),
            SizedBox(height: 10.v),
            buildRow_5x5Matrix(
              context,
              Text1: "n",
              Text2: "n",
              Text3: "n",
              Text4: "n",
              Text5: "n",
            ),
            SizedBox(height: 10.v),
            buildRow_5x5Matrix(
              context,
              Text1: "n",
              Text2: "n",
              Text3: "n",
              Text4: "n",
              Text5: "u",
            ),
            SizedBox(height: 10.v),
            buildRow_5x5Matrix(
              context,
              Text1: "n",
              Text2: "n",
              Text3: "n",
              Text4: "n",
              Text5: "n",
            ),
            SizedBox(height: 10.v),
            buildRow_5x5Matrix(
              context,
              Text1: "n",
              Text2: "n",
              Text3: "n",
              Text4: "n",
              Text5: "n",
            ),
          ],
        ),
      ),
    );
  }
}
