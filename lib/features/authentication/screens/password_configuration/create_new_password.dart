// import 'package:flutter/material.dart';
// import 'package:motodealz/common/styles/spacing_styles.dart';
// import 'package:motodealz/common/widgets/buttons.dart';
// import 'package:motodealz/common/widgets/input_field.dart';
// import 'package:motodealz/utils/constants/fonts.dart';
// import 'package:motodealz/utils/constants/image_strings.dart';
// import 'package:motodealz/utils/constants/sizes.dart';

// class CreateNewPasswordScreen extends StatelessWidget {
//   const CreateNewPasswordScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
    

//     return const Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: MSpacingStyle.paddingWithAppBarHeight,
//           child: Column(
//             children: [
//               Column(
//                 children: [
//                   Padding(padding: MSpacingStyle.paddingWithAppBarHeight),
//                   Text("CREATE NEW PASSWORD",textAlign: TextAlign.center, style: MFonts.fontAH1),
//                   SizedBox(
//                     height: MSizes.md,
//                   ),
//                   Text(
//                     "Enter a new strong password",
//                     textAlign: TextAlign.center,
//                     style: MFonts.fontCB1,
//                   ),
//                 ],
//               ),

//               SizedBox(
//                 height: MSizes.md,
//               ),

//               /// Form
//               Form(
//                 child: Padding(
//                   padding: EdgeInsets.only(top: MSizes.spaceBtwSections),
//                   child: Column(
//                     children: [
//                       InputFieldWithIcon(
//                         hintText: "Enter password",
//                         label: 'Password',
//                         prefixIcon: MImages.passwordIcon,
//                         suffixIcon: MImages.eyeIcon,
//                       ),

//                       SizedBox(height: MSizes.spaceBtwInputFields),

//                       /// Password
//                       InputFieldWithIcon(
//                         hintText: "Re-enter password",
//                         label: 'Confirm Password',
//                         prefixIcon: MImages.passwordIcon,
//                         suffixIcon: MImages.eyeIcon,
//                       ),

//                       SizedBox(height: MSizes.spaceBtwInputFields),

//                       LargeButtonNS(
//                         child: Text("Confirm"),
//                       ),

//                       SizedBox(height: MSizes.sm),

//                     ],
//                   ),
//                 ),
//               ),

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
