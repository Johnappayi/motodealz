// import 'package:flutter/material.dart';

// class PremiumSubscriptionPage extends StatelessWidget {
//   const PremiumSubscriptionPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Premium Subscription'),
//       ),
//       body: const Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               'Choose a plan',
//               style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20.0),
//             SubscriptionCard(
//               title: 'Basic',
//               price: '\$9.99/month',
//               description: 'Access to basic features',
//             ),
//             SubscriptionCard(
//               title: 'Standard',
//               price: '\$19.99/month',
//               description: 'Access to standard features',
//             ),
//             SubscriptionCard(
//               title: 'Premium',
//               price: '\$29.99/month',
//               description: 'Access to premium features',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SubscriptionCard extends StatelessWidget {
//   final String title;
//   final String price;
//   final String description;

//   const SubscriptionCard({super.key, required this.title, required this.price, required this.description});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4.0,
//       margin: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10.0),
//             Text(
//               price,
//               style: const TextStyle(fontSize: 16.0),
//             ),
//             const SizedBox(height: 10.0),
//             Text(
//               description,
//               style: const TextStyle(fontSize: 16.0),
//             ),
//             const SizedBox(height: 10.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle subscription purchase
//               },
//               child: const Text('Subscribe'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }