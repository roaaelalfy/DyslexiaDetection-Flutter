import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:dyslexiadetectorapp/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class Q29Screen extends StatelessWidget {
  const Q29Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: SizedBox(
              width: double.maxFinite,
              child: CustomOutlinedButton(
                  height: 54.v,
                  width: 242.h,
                  text: "sheranupthehill",
                  buttonTextStyle: theme.textTheme.headlineSmall!,
                  onPressed: () {
                    onTap(context);
                  })),
        ));
  }

  onTap(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.q30Screen);
  }
}
