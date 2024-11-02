import 'dart:io';

import 'package:adminapp/controller/items/view_controller.dart';
import 'package:adminapp/core/class/statusrequest.dart';
import 'package:adminapp/core/constant/routes.dart';
import 'package:adminapp/core/functions/handlingData.dart';
import 'package:adminapp/core/functions/uploadfile.dart';
import 'package:adminapp/data/model/categoriesmodel.dart';
import 'package:adminapp/data/model/itemsmodel.dart';
import 'package:adminapp/data/remote/categories/categories_data.dart';
import 'package:adminapp/data/remote/items/categories_data.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ItemsEditController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());
  CategoriesData categoriesData = CategoriesData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  Itemsmodel? itemsModel;
  List<SelectedListItem> dropdownlist = [];
  late TextEditingController dropdownname;
  late TextEditingController dropdownid;
  late TextEditingController name;
  late TextEditingController namear;
  late TextEditingController desc;
  late TextEditingController descar;
  late TextEditingController count;
  late TextEditingController discount;
  late TextEditingController price;
  late TextEditingController catid;
  late TextEditingController catname;
  StatusRequest statusRequest = StatusRequest.none;
  File? file;
  String? active;
  changeactive(val){
  active=val;
  update();
  }
  chooseimage() async {
    file = await fileUpload();
    update();
  }

  editData() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "id": itemsModel!.itemsId,
        "imageold":itemsModel!.itemsImages,
        "name": name.text,
        "namear": namear.text,
        "desc": desc.text,
        "descar": descar.text,
        "count": count.text,
        "discount": discount.text,
        "catid": catid.text,
        "datanow": DateTime.now().toString(),
        "price": price.text,
      };
      var response = await itemsData.edit(data, file!);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRoute.Itemsview);
          ItemsViewController c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  dropdownlistcate() async {
    statusRequest = StatusRequest.loading;
    var response = await categoriesData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List<Categoriesmodel> data = [];
        List listdata = response['data'];
        data.addAll(listdata.map((e) => Categoriesmodel.fromJson(e)));
        for (int i = 0; i < data.length; i++) {
          dropdownlist.add(SelectedListItem(
              name: data[i].categoriesName!, value: data[i].categoriesId));
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    dropdownlistcate();
    itemsModel = Get.arguments['itemsmModel'];
    dropdownname = TextEditingController();
    dropdownid = TextEditingController();
    name = TextEditingController();
    namear = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    count = TextEditingController();
    discount = TextEditingController();
    price = TextEditingController();
    catname = TextEditingController();
    catid = TextEditingController();
    name.text = itemsModel!.itemsName!;
    namear.text = itemsModel!.itemsNameAr!;
    desc.text = itemsModel!.itemsDesc!;
    descar.text = itemsModel!.itemsDescAr!;
    count.text = itemsModel!.itemsCount!;
    discount.text = itemsModel!.itemsDiscount!;
    price.text = itemsModel!.itemsPrice!;
    catid.text = itemsModel!.categoriesId!;
    catname.text = itemsModel!.categoriesName!;
    name.text = itemsModel!.itemsName!;
    editData();
    super.onInit();
  }
}
