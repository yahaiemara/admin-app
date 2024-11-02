
import 'package:adminapp/view/screen/order/accepted.dart';
import 'package:adminapp/view/screen/order/archive.dart';
import 'package:adminapp/view/screen/order/pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class OrderScreenController extends GetxController {
  chagePage(int currentpage);
}

class OrderScreenControllerImp extends OrderScreenController {
  int currentpage = 0;
  List<Widget> listpage = [
  
   const PendingDelivery(),
   const AcceptedDelivery(),
   const Archive()

  
  ];

  List titleappbar = [
    {
      "title": "Pending",
      "icon": Icons.pending,
    },
     {
      "title": "Accepted",
      "icon": Icons.done,
    },
   {
  "title":"Archive",
  "icon":Icons.archive
   },
 
   
  ];

  @override
  chagePage(int i) {
    currentpage = i;
    update();
  }
}
