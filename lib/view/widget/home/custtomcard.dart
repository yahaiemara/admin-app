import 'package:adminapp/controller/auth/homepage_controller.dart';
import 'package:adminapp/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custtomcard extends GetView<HomepageControllerImp> {
  final String titletext;
  final String bodytext;
  const Custtomcard(
      {super.key, required this.titletext, required this.bodytext});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          height: 150,
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(20)),
          child: ListTile(
            title: Text(titletext,
                style: const TextStyle(color: Colors.white, fontSize: 20)),
            subtitle: Text(bodytext,
                style: const TextStyle(color: Colors.white, fontSize: 30)),
          ),
        ),
        Positioned(
          top: -20,
        
          child: Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
                color: AppColor.secoundcolor,
                borderRadius: BorderRadius.circular(160)),
          ),
        )
      ]),
    );
  }
}
