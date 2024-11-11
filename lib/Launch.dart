import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home.dart';
import 'Login.dart';

class Launch extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LaunchState();
  }
}

class LaunchState extends State<Launch>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: buildTitle(),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      SharedPreferences sp = await SharedPreferences.getInstance();
      if (sp.getString("usrId") == null){
        Get.off(Login());
      }else{
        Get.off(Home());
      }
    });
  }

  Widget buildTitle() {
    return const Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          '启动页面',
          style: TextStyle(fontSize: 45, color: Colors.black),
        ));
  }
}