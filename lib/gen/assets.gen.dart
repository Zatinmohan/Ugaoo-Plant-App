/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsMiscGen {
  const $AssetsMiscGen();

  /// File path: assets/misc/appIcon.png
  AssetGenImage get appIcon => const AssetGenImage('assets/misc/appIcon.png');

  /// File path: assets/misc/apple.png
  AssetGenImage get apple => const AssetGenImage('assets/misc/apple.png');

  /// File path: assets/misc/background.jpeg
  AssetGenImage get background =>
      const AssetGenImage('assets/misc/background.jpeg');

  /// File path: assets/misc/demo_plant.png
  AssetGenImage get demoPlant =>
      const AssetGenImage('assets/misc/demo_plant.png');

  /// File path: assets/misc/email.png
  AssetGenImage get email => const AssetGenImage('assets/misc/email.png');

  /// File path: assets/misc/emptyCart.png
  AssetGenImage get emptyCart =>
      const AssetGenImage('assets/misc/emptyCart.png');

  /// File path: assets/misc/emptyList.png
  AssetGenImage get emptyList =>
      const AssetGenImage('assets/misc/emptyList.png');

  /// File path: assets/misc/facebook.png
  AssetGenImage get facebook => const AssetGenImage('assets/misc/facebook.png');

  /// File path: assets/misc/gLogo.png
  AssetGenImage get gLogo => const AssetGenImage('assets/misc/gLogo.png');

  /// File path: assets/misc/placed.gif
  AssetGenImage get placed => const AssetGenImage('assets/misc/placed.gif');

  /// File path: assets/misc/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/misc/profile.png');

  /// File path: assets/misc/registration_page_image.jpg
  AssetGenImage get registrationPageImage =>
      const AssetGenImage('assets/misc/registration_page_image.jpg');

  /// File path: assets/misc/soon.png
  AssetGenImage get soon => const AssetGenImage('assets/misc/soon.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        appIcon,
        apple,
        background,
        demoPlant,
        email,
        emptyCart,
        emptyList,
        facebook,
        gLogo,
        placed,
        profile,
        registrationPageImage,
        soon
      ];
}

class $AssetsOnboardingGen {
  const $AssetsOnboardingGen();

  /// File path: assets/onboarding/first.png
  AssetGenImage get first => const AssetGenImage('assets/onboarding/first.png');

  /// File path: assets/onboarding/second.png
  AssetGenImage get second =>
      const AssetGenImage('assets/onboarding/second.png');

  /// File path: assets/onboarding/third.png
  AssetGenImage get third => const AssetGenImage('assets/onboarding/third.png');

  /// List of all assets
  List<AssetGenImage> get values => [first, second, third];
}

class Assets {
  Assets._();

  static const AssetGenImage me = AssetGenImage('assets/me.jpg');
  static const $AssetsMiscGen misc = $AssetsMiscGen();
  static const $AssetsOnboardingGen onboarding = $AssetsOnboardingGen();

  /// List of all assets
  static List<AssetGenImage> get values => [me];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
