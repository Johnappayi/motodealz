// import 'dart:io';

// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:motodealz/splash_screen.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:motodealz/common/widgets/buttons.dart';

// class TakePictureScreen extends StatefulWidget {
//   const TakePictureScreen({Key? key}) : super(key: key);

//   @override
//   TakePictureScreenState createState() => TakePictureScreenState();
// }

// class TakePictureScreenState extends State<TakePictureScreen> {
//   late Future<void> _initFuture;
//   late CameraController _controller;
//   XFile? image; // Initialize image to null

//   @override
//   void initState() {
//     super.initState();
//     _initFuture = _initializeEverything();
//   }

//   Future<void> _initializeEverything() async {
//     await _initializeCamera();
//   }

//   Future<void> _initializeCamera() async {
//     final PermissionStatus status = await Permission.camera.request();
//     if (status != PermissionStatus.granted) {
//       // Handle denied permission or show a message to the user
//       print('Camera permission denied');
//       return;
//     }

//     try {
//       final cameras = await availableCameras();
//       final firstCamera = cameras.first;

//       _controller = CameraController(
//         firstCamera,
//         ResolutionPreset.medium,
//       );
//       await _controller.initialize(); // Wait for controller initialization
//       if (mounted) {
//         setState(() {}); // Trigger a rebuild after camera initialization
//       }
//     } catch (e) {
//       print("Error initializing camera: $e");
//     }
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _initFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: SplashScreen(),
//           );
//         } else {
//           return _buildScreen();
//         }
//       },
//     );
//   }

//   Widget _buildScreen() {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 180,
//               width: double.infinity,
//               child: _controller.value.isInitialized == true
//                   ? CameraPreview(_controller)
//                   : const Center(child: CircularProgressIndicator()),
//             ),
//             LargeButton(
//               onPressed: _controller.value.isInitialized == true
//                   ? () async {
//                       try {
//                         image = await _controller.takePicture();
//                         if (mounted) {
//                           setState(() {}); // Trigger a rebuild after taking a picture
//                         }
//                       } catch (e) {
//                         print(e);
//                       }
//                     }
//                   : null,
//               child: const Text("Take pic"),
//             ),
//             if (image != null)
//               SizedBox(
//                 width: double.infinity,
//                 child: Image.file(File(image!.path)),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
