import 'package:flutter/material.dart';
import 'package:joha_test/utils/constants/sizes.dart';



class JSpacing extends StatelessWidget {
  const JSpacing({super.key})
      : height = JSizes.zero,
        width = JSizes.zero;
  const JSpacing.xxxLargeWidth({Key? key})
      : this.width(JSizes.xxxLarge, key: key);

  const JSpacing.xxLargeWidth({Key? key})
      : this.width(JSizes.xxLarge, key: key);

  const JSpacing.xLargeWidth({Key? key})
      : this.width(JSizes.xLarge, key: key);

  const JSpacing.largeWidth({Key? key})
      : this.width(JSizes.large, key: key);

  const JSpacing.bigWidth({Key? key})
      : this.width(JSizes.big, key: key);

  const JSpacing.mediumWidth({Key? key})
      : this.width(JSizes.medium, key: key);

  const JSpacing.smallWidth({Key? key})
      : this.width(JSizes.small, key: key);

  const JSpacing.xxxSmallWidth({Key? key})
      : this.width(JSizes.xxxSmall, key: key);

  const JSpacing.xxSmallWidth({Key? key})
      : this.width(JSizes.xxSmall, key: key);

  const JSpacing.xSmallWidth({Key? key})
      : this.width(JSizes.xSmall, key: key);

  const JSpacing.tinyWidth({Key? key})
      : this.width(JSizes.tiny, key: key);
  const JSpacing.xxxLargeHeight({Key? key})
      : this.height(JSizes.xxxLarge, key: key);

  const JSpacing.xxLargeHeight({Key? key})
      : this.height(JSizes.xxLarge, key: key);

  const JSpacing.xLargeHeight({Key? key})
      : this.height(JSizes.xLarge, key: key);

  const JSpacing.largeHeight({Key? key})
      : this.height(JSizes.large, key: key);

  const JSpacing.bigHeight({Key? key})
      : this.height(JSizes.big, key: key);

  const JSpacing.mediumHeight({Key? key})
      : this.height(JSizes.medium, key: key);

  const JSpacing.smallHeight({Key? key})
      : this.height(JSizes.small, key: key);

  const JSpacing.xSmallHeight({Key? key})
      : this.height(JSizes.xSmall, key: key);

  const JSpacing.xxSmallHeight({Key? key})
      : this.height(JSizes.xxSmall, key: key);

  const JSpacing.xxxSmallHeight({Key? key})
      : this.height(JSizes.xxxSmall, key: key);

  const JSpacing.tinyHeight({Key? key})
      : this.height(JSizes.tiny, key: key);

  const JSpacing.width(this.width, {super.key}) : height = JSizes.zero;

  const JSpacing.height(this.height, {super.key})
      : width = JSizes.zero;

  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(key: super.key, height: height ,width: width,);
  }
}