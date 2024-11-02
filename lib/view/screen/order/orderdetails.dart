import 'package:adminapp/controller/order/orderdetails_controller.dart';
import 'package:adminapp/core/class/handlingdataview.dart';
import 'package:adminapp/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

class Orderdetails extends StatelessWidget {
  const Orderdetails({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    OrderdetailsController controller = Get.put(OrderdetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: GetBuilder<OrderdetailsController>(
              builder: (controller) => Handlingdataview(
                    statusRequest: controller.statusRequest,
                    widget: ListView(
                      children: [
                        Table(
                          children: [
                            const TableRow(children: [
                              Text(
                                "Items",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("QTY",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold)),
                              Text("Price",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold)),
                            ]),
                            ...List.generate(
                                controller.data.length,
                                (index) => TableRow(children: [
                                      Text(
                                          "${controller.data[index].itemsName}",
                                          textAlign: TextAlign.center),
                                      Text(
                                          "${controller.data[index].countitems}",
                                          textAlign: TextAlign.center),
                                      Text(
                                          "${controller.data[index].itemspice}\$",
                                          textAlign: TextAlign.center)
                                    ]))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(3),
                          child: Text(
                            "TotalPrice :${controller.orderModel.ordersTotalprice}\$",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: const Text("Shipping Address"),
                            subtitle: Text(
                                "${controller.orderModel.addressCity} ${controller.orderModel.addressStreet}"),
                          ),
                        ),
                        Card(
                          child: Container(
                            padding:const  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            height: 300,
                            width: double.infinity,
                            child:  FlutterMap(
                        mapController: controller.mapController,
                        options: MapOptions(
                        initialCenter: controller.center.value,
                          initialZoom: controller.zoom.value,
                          onTap: (tapPosition, latlng) {
                            // تغيير موقع الـ marker عند الضغط على الخريطة
                            controller.moveToLocation(latlng);
                          },
                        ),
                        children: [
                          OpenStreetMapTilelayer,
                          
                        ],
                      ),
                          ),
                        )
                      ],
                    ),
                  ))),
    );
  }
}

// ignore: non_constant_identifier_names
TileLayer get OpenStreetMapTilelayer => TileLayer(
      urlTemplate:
          "https://tile.openstreetmap.org/{z}/{x}/{y}.png?access_token=5b3ce3597851110001cf624854b5221f5dcc43be878b19087014e4ae",
      userAgentPackageName: 'com.example.adminapp',
    );
