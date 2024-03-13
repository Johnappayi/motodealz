// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// class QRCodeScanScreen extends StatefulWidget {
//   const QRCodeScanScreen({super.key});

//   @override
//   QRCodeScanScreenState createState() => QRCodeScanScreenState();
// }

// class QRCodeScanScreenState extends State<QRCodeScanScreen> {
//   QRViewController? _controller;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Scan QR Code'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: QRView(
//               key: qrKey,
//               onQRViewCreated: _onQRViewCreated,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     setState(() {
//       _controller = controller;
//     });
//     controller.scannedDataStream.listen((scanData) {
//       // Do something with the scanned data, for example, print it
//       // print('Scanned data: ${scanData.code}');
//     });
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }
// }
