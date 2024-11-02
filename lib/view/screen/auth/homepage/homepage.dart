import 'package:adminapp/controller/auth/homepage_controller.dart';
import 'package:adminapp/core/constant/imageasset.dart';
import 'package:adminapp/core/constant/routes.dart';
import 'package:adminapp/view/widget/home/admin/cardadmin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    HomepageControllerImp controller = Get.put(HomepageControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: ListView(
        children: [
          GridView(
            physics:const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 150),
                children: [
                Cardadmin(title: "Categories", url: AppImageAsset.Categories, onTap: (){
                    Get.toNamed(AppRoute.categoriesview);}),
                Cardadmin(title: "Items", url: AppImageAsset.product, onTap: (){Get.toNamed(AppRoute.Itemsview);}),
                Cardadmin(title: "Users", url: AppImageAsset.users, onTap: (){}),
                Cardadmin(title: "Orders", url: AppImageAsset.order, onTap: (){Get.toNamed(AppRoute.homescreen);}),
                Cardadmin(title: "Report", url: AppImageAsset.report, onTap: (){}),
                Cardadmin(title: "Notification", url: AppImageAsset.notification, onTap: (){}),
                ],
          )
        ],
      ),
    );
  }
}
