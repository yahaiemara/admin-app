import 'package:adminapp/controller/order/archive_controller.dart';

import 'package:adminapp/core/constant/color.dart';
import 'package:adminapp/core/constant/routes.dart';
import 'package:adminapp/data/model/order.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


class Cardlistorderarchive extends GetView<ArchiveController> {
  final OrderModel listdata;
  const Cardlistorderarchive({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Text(
                "Order Number:${listdata.ordersId}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            const   Spacer(),
             Text(listdata.ordersDatetime!,style:const TextStyle(color: AppColor.primaryColor),)
            ]),
            const Divider(),
            Text(
                "Order Type : ${controller.PrintDeliveryType(listdata.ordersType!)}"),
            Text("Order Price :${listdata.ordersPrice} \$"),
            Text("Delivery Price : ${listdata.ordersPricedelivery} \$"),
            Text(
                "Payment Method : ${controller.PrintPaymenMethod(listdata.ordersPayment!)}"),
            Text(
                "Payment Staus : ${controller.PrintStatus(listdata.ordersStatus!)}"),
            const Divider(),
            Row(
              children: [
                Text(
                  "Total Price  : ${listdata.ordersTotalprice} \$",
                  style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                MaterialButton(
                  color: AppColor.secoundcolor,
                  onPressed: () {
                    Get.toNamed(AppRoute.orderdetails,arguments: {
                      "ordermodle":listdata
                    });
                  },
                  child: const Text(
                    "Details",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.thirdcolor),
                  ),
                ),
              
       
              ],
            )
          ],
        ),
      ),
    );
  }
}
