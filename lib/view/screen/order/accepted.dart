import 'package:adminapp/controller/order/accepted_controller.dart';
import 'package:adminapp/core/class/handlingdataview.dart';
import 'package:adminapp/core/constant/color.dart';

import 'package:adminapp/view/widget/order/cardlistorderaccepted.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class AcceptedDelivery extends StatelessWidget {
  const AcceptedDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AcceptedController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("orders",style:TextStyle(color: AppColor.secoundcolor),),
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: GetBuilder<AcceptedController>(
                builder: (controller) => Handlingdataview(
                      statusRequest: controller.statusRequest,
                      widget: ListView.builder(
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) =>
                            Carlistorderaccepteds(listdata: controller.data[index]),
                      ),
                    ))));
  }
}

