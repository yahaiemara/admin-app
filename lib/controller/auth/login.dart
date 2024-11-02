
import 'package:adminapp/core/class/statusrequest.dart';
import 'package:adminapp/core/constant/routes.dart';
import 'package:adminapp/core/functions/handlingData.dart';
import 'package:adminapp/core/services/services.dart';
import 'package:adminapp/data/remote/auth/login.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
  
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  LoginData loginData=LoginData(Get.find());
  StatusRequest? statusRequest=StatusRequest.none;
  bool isshowpassword = true;
  MyServices myservices=Get.find();
  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login() async{
         var formData = formstate.currentState;
    if (formData!.validate()) {
      formData.save();
     statusRequest=StatusRequest.loading;
     update();
    var response=await loginData.postdata(email.text,password.text);
    print("====================Controller $response");
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
    if(response['status']=='success'){
     myservices.sharedPreferences.setString("id",response['admin']['admin_id']);
     myservices.sharedPreferences.setString("username",response['admin']['admin_name']);
     myservices.sharedPreferences.setString("email",response['admin']['admin_email']);
     myservices.sharedPreferences.setString("phone",response['admin']['admin_phone']);
     myservices.sharedPreferences.setString("step","2");
    

      Get.offNamed(AppRoute.home);
    }if (response['status'] == 'fail') {
  String message = response['message'];
  Get.snackbar(
    "Signup Failed",
    message,  
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
    colorText: Colors.white,
    duration:const Duration(seconds: 3),
  );
 }
    else{
      
       statusRequest=StatusRequest.failure;
    }
    }
    update();
    }

  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {

    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}