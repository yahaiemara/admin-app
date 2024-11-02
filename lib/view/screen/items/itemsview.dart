// ignore_for_file: deprecated_member_use

import 'package:adminapp/controller/items/view_controller.dart';
import 'package:adminapp/core/class/handlingdataview.dart';
import 'package:adminapp/core/constant/routes.dart';
import 'package:adminapp/data/apiconnect/apiconnect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Itemsview extends StatelessWidget {
  const Itemsview({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsViewController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Items View"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.Itemsadd);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<ItemsViewController>(
          builder: (controller) => Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: WillPopScope(
                onWillPop: () {
                  return controller.myback();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            controller.goToEditPage(controller.data[index]);
                          },
                          child: Card(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    child: Image.network(
                                      "${Apiconnect.imagesitems}/${controller.data[index].itemsImages}",
                                      height: 80,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: ListTile(
                                        title: Text(
                                            "${controller.data[index].itemsName}"),
                                        subtitle: Text(
                                            "${controller.data[index].itemsDate}"),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  Get.defaultDialog(
                                                      title: "Warninng",
                                                      middleText:
                                                          "Are You Sure",
                                                      onCancel: () {},
                                                      onConfirm: () {
                                                        controller.deleteitems(
                                                            controller
                                                                .data[index]
                                                                .itemsId!,
                                                            controller
                                                                .data[index]
                                                                .itemsImages!);
                                                        Get.back();
                                                      });
                                                },
                                                icon: const Icon(
                                                    Icons.delete_outlined)),
                                          ],
                                        )))
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ))),
    );
  }
}
