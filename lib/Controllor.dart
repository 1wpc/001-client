import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Controllor extends GetxController{
  String pos = 'click me to get position';

  void changePos(String value){
    pos = value;
    update();
  }
}