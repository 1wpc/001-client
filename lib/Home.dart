import 'package:client_001/Controllor.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:client_001/Locator.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home>{
  final Controllor c =Get.put(Controllor());
  String s = "click me to get position";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder(
      init: c,
      builder: (controllor){
        return Scaffold(
          backgroundColor: Colors.white,
            body: ListView(
                children: [
                  TextButton(
                      onPressed: ()async{
                        var position = await Locator.determinePosition();
                        controllor.changePos(position.toString());
                      },
                      child: Text(controllor.pos)
                  ),
                ]
            ),
            bottomNavigationBar: ConvexAppBar(
              items:[
                TabItem(icon: Icons.home, title: 'Home'),
                TabItem(icon: Icons.map, title: 'Discovery'),
                TabItem(icon: Icons.add, title: 'Add'),
                TabItem(icon: Icons.message, title: 'Message'),
                TabItem(icon: Icons.people, title: 'Profile'),
              ],
              onTap: (int i) => print('click index=$i'),
            )

        );
      }
    );
  }
}