// import 'package:dyslexiadetectorapp/core/app_export.dart';
// import 'package:flutter/material.dart';
//
// class AppNavigationScreen extends StatelessWidget {
//   const AppNavigationScreen({Key? key})
//       : super(
//           key: key,
//         );
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Color(0XFFFFFFFF),
//         body: SizedBox(
//           width: 375.h,
//           child: Column(
//             children: [
//               _buildAppNavigation(context),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Color(0XFFFFFFFF),
//                     ),
//                     child: Column(
//                       children: [
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q29",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q29Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q1",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q1Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q2",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q2Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q3",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q3Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q4",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q4Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q5-Six",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q5SixScreen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q9",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q9Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q7-Eight",
//                           onTapScreenTitle: () => onTapScreenTitle(
//                               context, AppRoutes.q7EightScreen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q10",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q10Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q14",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q14Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q15",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q15Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q16",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q16Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q17",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q17Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q18",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q18Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q19",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q19Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q22",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q22Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Frame One",
//                           onTapScreenTitle: () => onTapScreenTitle(
//                               context, AppRoutes.frameOneScreen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q23",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q23Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q24",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q24Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q26",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q26Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q26.1",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q261Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q25",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q25Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q27",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q27Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q27.3",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q273Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q27.4",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q274Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q27.1",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q271Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q27.2",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q272Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q28",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q28Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q30",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q30Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q31",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q31Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q30.1",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q301Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q30.2",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q302Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q30.3",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q303Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q30.5",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q305Screen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q28-One",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q28OneScreen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q28-Two",
//                           onTapScreenTitle: () =>
//                               onTapScreenTitle(context, AppRoutes.q28TwoScreen),
//                         ),
//                         _buildScreenTitle(
//                           context,
//                           screenTitle: "Q28-Three",
//                           onTapScreenTitle: () => onTapScreenTitle(
//                               context, AppRoutes.q28ThreeScreen),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildAppNavigation(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Color(0XFFFFFFFF),
//       ),
//       child: Column(
//         children: [
//           SizedBox(height: 10.v),
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20.h),
//               child: Text(
//                 "App Navigation",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Color(0XFF000000),
//                   fontSize: 20.fSize,
//                   fontFamily: 'Roboto',
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 10.v),
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Padding(
//               padding: EdgeInsets.only(left: 20.h),
//               child: Text(
//                 "Check your app's UI from the below demo screens of your app.",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Color(0XFF888888),
//                   fontSize: 16.fSize,
//                   fontFamily: 'Roboto',
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 5.v),
//           Divider(
//             height: 1.v,
//             thickness: 1.v,
//             color: Color(0XFF000000),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// Common widget
//   Widget _buildScreenTitle(
//     BuildContext context, {
//     required String screenTitle,
//     Function? onTapScreenTitle,
//   }) {
//     return GestureDetector(
//       onTap: () {
//         onTapScreenTitle!.call();
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: Color(0XFFFFFFFF),
//         ),
//         child: Column(
//           children: [
//             SizedBox(height: 10.v),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.h),
//                 child: Text(
//                   screenTitle,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Color(0XFF000000),
//                     fontSize: 20.fSize,
//                     fontFamily: 'Roboto',
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10.v),
//             SizedBox(height: 5.v),
//             Divider(
//               height: 1.v,
//               thickness: 1.v,
//               color: Color(0XFF888888),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// Common click event
//   void onTapScreenTitle(
//     BuildContext context,
//     String routeName,
//   ) {
//     Navigator.pushNamed(context, routeName);
//   }
// }
