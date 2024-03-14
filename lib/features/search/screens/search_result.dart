import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:motodealz/common/widgets/app_bar.dart';
// import 'package:motodealz/common/widgets/app_bar.dart';
import 'package:motodealz/common/widgets/input_field.dart';
import 'package:motodealz/common/widgets/listed_ad_frame2.dart';
import 'package:motodealz/common/widgets/side_bar.dart';
import 'package:motodealz/utils/constants/fonts.dart';
import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  bool _isSideBarOpen = false;

  void _toggleSideBar() {
    setState(() {
      _isSideBarOpen = !_isSideBarOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              MAppBar(onMenuPressed: _toggleSideBar),
              const SizedBox(
                height: MSizes.defaultSpace,
              ),
              const Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(MSizes.lg),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InputFieldWithIcon(
                              prefixIcon: MImages.searchBarIcon,
                              hintText: 'What are you looking for!',
                            ),
                            SizedBox(
                              height: MSizes.defaultSpace,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Search Results",
                                  style: MFonts.fontBH1,
                                ),
                                SizedBox(
                                  height: MSizes.md,
                                ), // Example Text Widget 1
                                Column(
                                  children: [
                                    ListedAdFrame2(
                                      carName: 'Corola Altis',
                                      year: '2000',
                                      mileage: '2,50,000km',
                                      price: 'Rs. 4,50,000',
                                      isPremium: true,
                                    ),
                                    SizedBox(
                                      height: MSizes.lg,
                                    ),
                                    ListedAdFrame2(
                                      carName: 'Corola Altis',
                                      year: '2000',
                                      mileage: '2,50,000km',
                                      price: 'Rs. 4,50,000',
                                      isPremium: true,
                                    ),
                                    SizedBox(
                                      height: MSizes.lg,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (_isSideBarOpen) MSideBar(onClose: _toggleSideBar),
        ],
      ),
    );
  }
}
