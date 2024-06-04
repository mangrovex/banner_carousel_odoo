import 'package:flutter/material.dart';

import '../banner_carousel_odoo.dart';

@immutable
class BannerWidget extends StatelessWidget {
  final BannerModel _bannerModel;
  final Map<String, String> _headersHttp;

  /// The [borderRadius] of the container
  /// Default value 5
  final double borderRadius;

  /// The [_onTap] The Method when click on the Banner
  final VoidCallback _onTap;

  final double spaceBetween;

  const BannerWidget({
    super.key,
    required BannerModel bannerModel,
    required Map<String, String> headersHttp,
    this.borderRadius = 5,
    this.spaceBetween = 0,
    required VoidCallback onTap,
  })  : _bannerModel = bannerModel,
        _headersHttp = headersHttp,
        _onTap = onTap;

  ImageProvider get _getImage {
    if (_bannerModel.imagePath.contains("https://") ||
        _bannerModel.imagePath.contains("http://")) {
      return NetworkImage(_bannerModel.imagePath, headers: _headersHttp);
    }
    return AssetImage(_bannerModel.imagePath);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: spaceBetween),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: _getImage,
              fit: _bannerModel.boxFit,
            ),
            borderRadius: BorderRadius.circular(borderRadius)),
        width: double.maxFinite,
        // child: SizedBox(),
      ),
    );
  }
}
