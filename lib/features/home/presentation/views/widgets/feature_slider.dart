import 'package:egyptopia/core/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'featured_slider_item.dart';

class FeatureSlider extends StatelessWidget {
  final double? height;
  final double? width;
  final String imageAsset;
  const FeatureSlider({super.key, this.height, this.width, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      height: height ?? SizeConfig.defaultSize! * 19,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return FeaturedSliderItem(width: width,imageAsset: imageAsset);
        },
      ),
    );
  }
}
