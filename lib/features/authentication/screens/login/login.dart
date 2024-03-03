import 'package:flutter/material.dart';
import 'package:motodealz/common/styles/spacing_styles.dart';
import 'package:motodealz/utils/constants/colors.dart';
//import 'package:motodealz/utils/constants/image_strings.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/constants/text_strings.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: MSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Title, Subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(padding: MSpacingStyle.paddingWithAppBarHeight),
                  Text(MTexts.loginTitle,
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(
                    height: MSizes.sm,
                  ),
                  Text(MTexts.loginSubTitle,
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),

              /// Form
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: MSizes.spaceBtwSections),
                  child: Column(
                    children: [
                      /// Username
                      TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.account_circle),
                            labelText: MTexts.usernamePlaceholder),
                      ),
                      const SizedBox(height: MSizes.spaceBtwInputFields),

                      /// Password
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: MTexts.passwordPlaceholder,
                          suffixIcon: Icon(Icons.visibility),
                        ),
                      ),
                      const SizedBox(height: MSizes.spaceBtwInputFields / 2),

                      ///Remember Me & Forgot Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ///Remember Me
                          Row(
                            children: [
                              Checkbox(value: true, onChanged: (value) {}),
                              const Text(MTexts.rememberMe),
                            ],
                          ),

                          ///Forgot Password
                          TextButton(
                              onPressed: () {},
                              child: const Text(MTexts.forgetPassword)),
                        ],
                      ),
                      const SizedBox(height: MSizes.spaceBtwSections),

                      ///Login Button
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: const Text(MTexts.signIn))),
                      const SizedBox(height: MSizes.spaceBtwItems),
                    ],
                  ),
                ),
              ),

              ///Divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Divider(
                      color: dark ? MColors.darkGrey : MColors.lightGrey,
                      thickness: 0.5,
                      indent: 60,
                      endIndent: 5,
                    ),
                  ),
                  Text(MTexts.or,
                      style: Theme.of(context).textTheme.labelMedium),
                  Flexible(
                    child: Divider(
                      color: dark ? MColors.darkGrey : MColors.lightGrey,
                      thickness: 0.5,
                      indent: 5,
                      endIndent: 60,
                    ),
                  )
                ],
              ),

              ///Footer
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       decoration: BoxDecoration(border: Border.all(color: MColors.lightGrey), borderRadius: BorderRadius.circular(100)),
              //       child: IconButton(onPressed: (){}, icon: const Image( width: MSizes.iconMd, height: MSizes.iconMd,  image: AssetImage(MImages.google) )),
              //     )
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
