import 'package:flutter/material.dart';
import 'package:motodealz/utils/constants/colors.dart';
import 'package:motodealz/utils/constants/sizes.dart';
import 'package:motodealz/utils/helpers/helper_functions.dart';

class MyDraggableSheet extends StatefulWidget {
  final Widget child;
  final VoidCallback? onCollapse;
  const MyDraggableSheet({super.key, required this.child, this.onCollapse});

  @override
  State<MyDraggableSheet> createState() => _MyDraggableSheetState();
}

class _MyDraggableSheetState extends State<MyDraggableSheet> {
  final sheet = GlobalKey();
  final controller = DraggableScrollableController();

  @override
  void initState() {
    super.initState();
    controller.addListener(onChanged);
  }

  void onChanged() {
    final currentSize = controller.size;
    if (currentSize <= 0.6) {
    // Call onCollapse callback when sheet is collapsed
    widget.onCollapse?.call();
  }
  }

  void collapse() => animateSheet(getSheet.snapSizes!.first);

  void anchor() => animateSheet(getSheet.snapSizes!.last);

  void expand() => animateSheet(getSheet.maxChildSize);

  void hide() => animateSheet(getSheet.minChildSize);

  void animateSheet(double size) {
    controller.animateTo(
      size,
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  DraggableScrollableSheet get getSheet =>
      (sheet.currentWidget as DraggableScrollableSheet);

  @override
  Widget build(BuildContext context) {
    final bool darkMode = MHelperFunctions.isDarkMode(context);

    return LayoutBuilder(builder: (context, constraints) {
      return DraggableScrollableSheet(
        key: sheet,
        initialChildSize: 0.6,
        maxChildSize: 0.6,//if premium set it as 0.90
        minChildSize: 0.5,
        expand: true,
        snap: true,
        snapSizes: const [
          // 60 / constraints.maxHeight,
          0.6,
        ],
        controller: controller,
        builder: (BuildContext context, ScrollController scrollController) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: darkMode ? MColors.black : MColors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(MSizes.cardRadiusLg),
                topRight: Radius.circular(MSizes.cardRadiusLg),
              ),
            ),
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                topButtonIndicator(),
                SliverToBoxAdapter(
                  child: widget.child,
                ),
              ],
            ),
          );
        },
      );
    });
  }

  SliverToBoxAdapter topButtonIndicator() {
    final bool darkMode = MHelperFunctions.isDarkMode(context);
    return SliverToBoxAdapter(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
                child: Wrap(children: <Widget>[
              Container(
                  width: 100,
                  margin: const EdgeInsets.only(top: MSizes.md, bottom: MSizes.md),
                  height: 6,
                  decoration: BoxDecoration(
                    color: darkMode ? MColors.darkerGrey : MColors.card,
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(Radius.circular(MSizes.sm)),
                  )),
            ])),
          ]),
    );
  }
}
