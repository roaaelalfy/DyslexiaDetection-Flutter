import 'package:dyslexiadetectorapp/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import '../theme/app_decoration.dart';
import '../theme/custom_text_style.dart';
import '../theme/theme_helper.dart';

/// Common widget
Widget buildRow_3x3Matrix(
    BuildContext context, {
      required String Text1,
      required String Text2,
      required String Text3,
    }) {
  return Wrap(
    alignment: WrapAlignment.center,
    children: [
      _buildContainer(context, Text1),
      _buildContainer(context, Text2),
      _buildContainer(context, Text3),
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
