import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MapUtil {

  /// 高德地图
  static Future<bool> gotoAMap(longitude, latitude) async {
    var url = '${Platform.isAndroid ? 'android' : 'ios'}amap://navi?sourceApplication=amap&lat=$latitude&lon=$longitude&dev=0&style=2';

    bool canLaunchUrl = await canLaunch(url);

    if (!canLaunchUrl) {
      return false;
    }

    await launch(url);

    return true;
  }

  /// 腾讯地图
  static Future<bool> gotoTencentMap(longitude, latitude) async {
    var url = 'qqmap://map/routeplan?type=drive&fromcoord=CurrentLocation&tocoord=$latitude,$longitude&referer=IXHBZ-QIZE4-ZQ6UP-DJYEO-HC2K2-EZBXJ';
    bool canLaunchUrl = await canLaunch(url);

    if (!canLaunchUrl) {
      return false;
    }

    await launch(url);

    return canLaunchUrl;
  }

  /// 百度地图
  static Future<bool> gotoBaiduMap(longitude, latitude) async {
    var url = 'baidumap://map/direction?destination=$latitude,$longitude&coord_type=bd09ll&mode=driving';

    bool canLaunchUrl = await canLaunch(url);

    if (!canLaunchUrl) {
      return false;
    }

    await launch(url);

    return canLaunchUrl;
  }

  /// 苹果地图
  // static Future<bool> _gotoAppleMap(longitude, latitude) async {
  //   var url = 'http://maps.apple.com/?&daddr=$latitude,$longitude';
  //
  //   bool canLaunchUrl = await canLaunch(url);
  //
  //   if (!canLaunchUrl) {
  //     ToastUtil.show('打开失败~');
  //     return false;
  //   }
  //
  //   await launch(url);
  // }
}