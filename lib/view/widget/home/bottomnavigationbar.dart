import 'package:adminapp/controller/auth/order_screen_controller.dart';
import 'package:adminapp/view/widget/home/custtombuttonappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bottomnavigationbar extends StatelessWidget {
  const Bottomnavigationbar({super.key});

  @override
  Widget build(BuildContext context) {
    
    return GetBuilder<OrderScreenControllerImp>(builder: (controller)=>BottomAppBar(
              shape:const CircularNotchedRectangle(),
              notchMargin: 10,
              child: Row(children: [
                ...List.generate(
                    controller.listpage.length+1,
                    ((index) {
                      int i=index>2 ?index-1:index;
                  return index==2?const Spacer(): Expanded(
                    flex: 10,
                    child: Custtombuttonappbar(
                          textbar: controller.titleappbar[i]['title'],
                          iconData: controller.titleappbar[i]['icon'],
                          active: controller.currentpage ==i? true:false,
                          onPressed: () {
                            controller.chagePage(i);
                          },
                        ));
                    } ))
              ]),
            ),);
  }
}