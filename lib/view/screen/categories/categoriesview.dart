// ignore_for_file: deprecated_member_use

import 'package:adminapp/controller/categories/view_controller.dart';
import 'package:adminapp/core/class/handlingdataview.dart';
import 'package:adminapp/core/constant/routes.dart';
import 'package:adminapp/data/apiconnect/apiconnect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categoriesview extends StatelessWidget {
  const Categoriesview({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesViewController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories View"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.categoriesadd);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<CategoriesViewController>(
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
                          onTap: (){
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
                                      "${Apiconnect.imagescategories}/${controller.data[index].categoriesImage}",
                                      height: 80,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: ListTile(
                                        title: Text(
                                            "${controller.data[index].categoriesName}"),
                                        subtitle: Text(
                                            "${controller.data[index].categoriesDate}"),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  Get.defaultDialog(
                                                      title: "Warninng",
                                                      middleText: "Are You Sure",
                                                      onCancel: () {},
                                                      onConfirm: () {
                                                        controller.deleteCategorey(
                                                            controller.data[index]
                                                                .categoriesId!,
                                                            controller.data[index]
                                                                .categoriesImage!);
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
