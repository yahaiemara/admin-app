import 'package:adminapp/controller/auth/order_screen_controller.dart';
import 'package:adminapp/view/widget/home/bottomnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderScreenControllerImp());
    return GetBuilder<OrderScreenControllerImp>(
        builder: (controller) => Scaffold(
           
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const Bottomnavigationbar(),
            // ignore: deprecated_member_use
            body:  controller.listpage.elementAt(controller.currentpage),
            
                ));
  }
}
