import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import '../theme/app_decoration.dart';

/// Common widget
Widget buildRow_5x5Matrix(
    BuildContext context, {
      required String Text1,
      required String Text2,
      required String Text3,
      required String Text4,
      required String Text5,
    }) {
  return Wrap(
    alignment: WrapAlignment.center,
    children: [
      _buildContainer(context, Text1),
      _buildContainer(context, Text2),
      _buildContainer(context, Text3),
      _buildContainer(context, Text4),
      _buildContainer(context, Text5),
    ],
  );
}

Widget _buildContainer(BuildContext context, String text) {
  return Container(
    margin: EdgeInsets.only(left: 12.h),
    padding: EdgeInsets.symmetric(
      horizontal: 17.h,
      vertical: 6.v,
    ),
    decoration: AppDecoration.outlineLightBlue,
    child: Text(
      text,
      style: CustomTextStyles.headlineSmallInika.copyWith(
        color: appTheme.black900,
      ),
    ),
  );
}