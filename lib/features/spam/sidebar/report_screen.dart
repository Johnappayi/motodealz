// import 'package:flutter/material.dart';
// import 'package:motodealz/common/styles/spacing_styles.dart';

// class ReportIssuePage extends StatelessWidget {
//   const ReportIssuePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Report a Bug'),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding:  MSpacingStyle.paddingWithAppBarHeight,
//             child: Column(
//               // crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 const Text(
//                   'Please describe the bug:',
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//                 const SizedBox(height: 10.0),
//                 const Expanded(
//                   child: TextField(
//                     maxLines: null,
//                     keyboardType: TextInputType.multiline,
//                     decoration: InputDecoration(
//                       hintText: 'Describe the bug here...',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle bug submission
//                     // You can add code here to send the bug report to a server or display a confirmation message
//                   },
//                   child: const Text('Submit Bug'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
