// ignore_for_file: use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motodealz/common/model/vehicle_model.dart';
import 'package:motodealz/common/widgets/back_button.dart';
import 'package:motodealz/common/widgets/buttons.dart';
import 'package:motodealz/common/widgets/draggable_sheet.dart';
import 'package:motodealz/common/widgets/image_carousel.dart';
import 'package:motodealz/common/widgets/vehicle_details_ui.dart';
import 'package:motodealz/features/chat/controller/chat_room_controller.dart';
import 'package:motodealz/features/chat/screens/individual_chat.dart';
import 'package:motodealz/features/shop/screens/vehicle_image_veiw_page.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/formatters/formatter.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';
import 'package:motodealz/utils/http/http_client.dart';

class VehicleVeiwScreen extends StatefulWidget {
  const VehicleVeiwScreen({
    super.key,
    required this.vehicle,
  });

  final Vehicle vehicle;

  @override
  VehicleVeiwScreenState createState() => VehicleVeiwScreenState();
}

class VehicleVeiwScreenState extends State<VehicleVeiwScreen> {
  bool _hasNavigatedToImageViewScreen = false;
  final ChatRoomController _chatRoomController = ChatRoomController();
  final List<String> _imageUrls = [];
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
  }

  Future<List<String>> _fetchImages() async {
    for (String imageUrl in widget.vehicle.images) {
      String httpsUrl = await MHttpHelper.convertGCSUrlToHttps(imageUrl);
      _imageUrls.add(httpsUrl);
    }
    return _imageUrls;
  }

  @override
  Widget build(BuildContext context) {
    final bool darkMode = MHelperFunctions.isDarkMode(context);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GestureDetector(
              onTap: () => _navigateToImageViewScreen(context),
              child: FutureBuilder<List<String>>(
                future: _fetchImages(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Show a loading indicator while fetching images
                    return Image.asset(
                      darkMode ? MImages.sampleCarDarkMode : MImages.sampleCar,
                      height: MHelperFunctions.screenHeight() * 0.45,
                      fit: BoxFit.cover,
                    );
                  } else if (snapshot.hasError) {
                    // Show an error message if fetching images fails
                    return const Center(child: Text('Error fetching images'));
                  } else {
                    // Build MImageCarousel1 with fetched images
                    return MImageCarousel1(images: snapshot.data!);
                  }
                },
              ),
            ),
            MyDraggableSheet(
              child: Column(
                children: [
                  VehicleDetailsUI(vehicle: widget.vehicle),
                  const SizedBox(
                    height: 90,
                  ) //Dont remove this
                ],
              ),
              onCollapse: () {
                _navigateToImageViewScreen(context);
              },
            ),
            const Positioned(
              top: 0,
              left: 0,
              child: Padding(
                padding: EdgeInsets.all(MSizes.lg),
                child: MBackButton(),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MHelperFunctions.screenWidth(),
                padding: const EdgeInsets.all(MSizes.lg),
                decoration: BoxDecoration(
                    color: darkMode ? MColors.black : MColors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      MFormatter.formatCurrency(widget.vehicle.price),
                      style: MFonts.fontCH1,
                    ),
                    SmallButton(
                        onPressed: () => _onChatPressed(context),
                        child: const Text("Chat"))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _navigateToImageViewScreen(BuildContext context) {
    // ignore: unnecessary_null_comparison
    if (!_hasNavigatedToImageViewScreen && _imageUrls != null) {
      _hasNavigatedToImageViewScreen = true;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              VehicleImageViewScreen(vehicleImages: _imageUrls),
        ),
      ).then((_) {
        // Reset the flag when the navigation is completed
        _hasNavigatedToImageViewScreen = false;
      });
    }
  }

  // Inside _onChatPressed function
  void _onChatPressed(BuildContext context) async {
    String buyerId = user!.uid; // Get the buyer's ID (implement this logic)
    String sellerId = widget.vehicle.ownerId;

    try {
      // Fetch the room ID from createChatRoom
      String roomId =
          await _chatRoomController.createChatRoom(buyerId, sellerId);

      // Navigate to the chat screen using the room ID
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatScreen(roomId: roomId),
        ),
      );
    } catch (error) {
      // Handle error if fetching chat rooms fails
      // print('Error fetching chat rooms: $error');
    }
  }
}
