import 'package:adminapp/controller/order/archive_controller.dart';

import 'package:adminapp/core/class/handlingdataview.dart';
import 'package:adminapp/view/widget/order/cardlistorderarchive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class Archive extends StatelessWidget {
  const Archive({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("orders"),
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: GetBuilder<ArchiveController>(
                builder: (controller) => Handlingdataview(
                      statusRequest: controller.statusRequest,
                      widget: ListView.builder(
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) =>
                            Cardlistorderarchive(listdata: controller.data[index]),
                      ),
                    ))));
  }
}

