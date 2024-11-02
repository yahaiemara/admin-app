import 'package:adminapp/controller/order/pending_controlle.dart';
import 'package:adminapp/core/class/handlingdataview.dart';

import 'package:adminapp/view/widget/order/cardlistorder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class PendingDelivery extends StatelessWidget {
  const PendingDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingControlle());
    return Scaffold(
        appBar: AppBar(
          title: const Text("orders"),
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: GetBuilder<PendingControlle>(
                builder: (controller) => Handlingdataview(
                      statusRequest: controller.statusRequest,
                      widget: ListView.builder(
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) =>
                            CardOrders(listdata: controller.data[index]),
                      ),
                    ))));
  }
}

