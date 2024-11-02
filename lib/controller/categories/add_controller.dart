import 'dart:io';

import 'package:adminapp/controller/categories/view_controller.dart';
import 'package:adminapp/core/class/statusrequest.dart';
import 'package:adminapp/core/constant/routes.dart';
import 'package:adminapp/core/functions/handlingData.dart';
import 'package:adminapp/core/functions/uploadfile.dart';
import 'package:adminapp/data/remote/categories/categories_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CategoriesAddController extends GetxController{
  CategoriesData categoriesData=CategoriesData(Get.find());
  GlobalKey<FormState> formstate=GlobalKey<FormState>();
   late TextEditingController name;
   late TextEditingController namear;
    StatusRequest statusRequest=StatusRequest.none;
   File? file;
   chooseimage()async{
    file=await fileUpload();
    update();
   }
   addData()async{
    if(formstate.currentState!.validate()){
      if(file == null) Get.snackbar("Warninng","Please Select Image");
  statusRequest=StatusRequest.loading;
  update();
    Map data={
    "name":name.text,
    "namear":namear.text,
    };
    var response=await categoriesData.add(data,file!);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
    if(response['status']=='success'){
    Get.offNamed(AppRoute.categoriesview);
    CategoriesViewController c=Get.find();
    c.getData();
    }else{
      statusRequest=StatusRequest.failure;
    }
    }
    update();
    }
   }
   @override
  void onInit() {
    name=TextEditingController();
    namear=TextEditingController();
    addData();
    super.onInit();
  }
}