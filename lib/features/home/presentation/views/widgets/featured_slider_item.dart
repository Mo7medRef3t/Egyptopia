import 'package:egyptopia/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class FeaturedSliderItem extends StatelessWidget {
    final double? width;
    final String imageAsset;
  const FeaturedSliderItem({super.key, this.width, required this.imageAsset});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? SizeConfig.screenWidth! * 0.6,
        height: SizeConfig.defaultSize! * 19,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image:  DecorationImage(
                fit: BoxFit.fill, image: AssetImage(imageAsset))));
  }
}
