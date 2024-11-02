import 'dart:io';

import 'package:adminapp/controller/categories/view_controller.dart';
import 'package:adminapp/core/class/statusrequest.dart';
import 'package:adminapp/core/constant/routes.dart';
import 'package:adminapp/core/functions/handlingData.dart';
import 'package:adminapp/core/functions/uploadfile.dart';
import 'package:adminapp/data/model/categoriesmodel.dart';
import 'package:adminapp/data/remote/categories/categories_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CategoriesEditController extends GetxController{
  CategoriesData categoriesData=CategoriesData(Get.find());
  GlobalKey<FormState> formstate=GlobalKey<FormState>();
   late TextEditingController name;
   late TextEditingController namear;
   Categoriesmodel? categoriesModel;
    StatusRequest statusRequest=StatusRequest.none;
   File? file;
   chooseimage()async{
    file=await fileUpload();
    update();
   }
   editData()async{
    if(formstate.currentState!.validate()){
      
  statusRequest=StatusRequest.loading;
  update();
    Map data={
    "name":name.text,
    "namear":namear.text,
    "imageold":categoriesModel!.categoriesImage!,
    "id":categoriesModel!.categoriesId!,
    };
    var response=await categoriesData.edit(data,file!);
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
    categoriesModel=Get.arguments['categorieModel'];
    name=TextEditingController();
    namear=TextEditingController();
    name.text=categoriesModel!.categoriesName!;
    namear.text=categoriesModel!.categoriesNameAr!;
    editData();
    super.onInit();
  }
}