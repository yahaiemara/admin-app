import 'package:adminapp/controller/Test_controller.dart';
import 'package:adminapp/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Testview extends StatelessWidget {
  const Testview({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      body: GetBuilder<TestController>(builder: (controller){
       
       return Handlingdataview(statusRequest: controller.statusRequest, widget: ListView.builder(
          itemCount: controller.data.length,
          itemBuilder: (context,index){
           return Text("${controller.data}");
        }));
        
       
        
      })
    );
  }
}