

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:yourtrip/Model/AdHelper.dart';
import 'package:yourtrip/Widgets/CustomContainer.dart';

class AdsWidget extends StatefulWidget {

  const AdsWidget({this.widht, this.height});
  final widht, height;
  @override
  State createState() => _AdsWidgetState(widht: widht, height: height);
}

class _AdsWidgetState extends State<AdsWidget> {

  _AdsWidgetState({this.widht, this.height});
  final widht, height;
  NativeAd? _ad;
  bool isAdLoaded = false;

  @override
  void initState() {
    print("*************** INIT STATE ***************");
    super.initState();

    // TODO: Create a NativeAd instance
    _ad = NativeAd(
      adUnitId: AdHelper.nativeAdUnitId,
      factoryId: 'listTile',
      request: AdRequest(),
      listener: NativeAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (Ad ad) {
          var _add = ad as NativeAd;
          print("**** AD ***** ${_add.responseInfo}");
          setState(() {
            _ad = _add;
            isAdLoaded = true;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          // Dispose the ad here to free resources.
          ad.dispose();
          print('Ad load failed (code=${error.code} message=${error.message})');
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) => print('Ad opened.'),
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) => print('Ad closed.'),
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) => print('Ad impression.'),
        // Called when a click is recorded for a NativeAd.
        onAdClicked: (Ad ad) => print('Ad clicked.'),
      ),
    );

    _ad!.load();
  }

  @override
  void dispose() {
    print("*********** DISPOSING **********");
    // TODO: Dispose a NativeAd object
    _ad?.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
     return isAdLoaded? CustomContainer(
       widht: widht,
       height: height,
       child: AdWidget(ad: _ad!),
     )
    :Container();
  }
}