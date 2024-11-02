import 'package:adminapp/core/class/handlingdataview.dart';
import 'package:adminapp/core/functions/alertexistapp.dart';
import 'package:adminapp/core/functions/validinput.dart';

import 'package:adminapp/core/constant/color.dart';
import 'package:adminapp/view/widget/auth/custtombuttonauth.dart';
import 'package:adminapp/view/widget/auth/custtomtextbodyauth.dart';
import 'package:adminapp/view/widget/auth/custtomtextformauth.dart';
import 'package:adminapp/view/widget/auth/custtomtexttitleauth.dart';
import 'package:adminapp/view/widget/auth/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/login.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('Sign In',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
            builder: (controller) =>Handlingdatarequest(statusRequest: controller.statusRequest!,
               
                  
                    widget: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        child: Form(
                          key: controller.formstate,
                          child: ListView(children: [
                            const LogoAuth(),
                            const SizedBox(height: 20),
                            CustomTextTitleAuth(text: "10".tr),
                            const SizedBox(height: 10),
                            CustomTextBodyAuth(text: "11".tr),
                            const SizedBox(height: 15),
                            CustomTextFormAuth(
                              isNumber: false,

                              valid: (val) {
                                return validInput(val!, 5, 100, "email");
                              },
                              mycontroller: controller.email,
                              hinttext: "12".tr,
                              iconData: Icons.email_outlined,
                              labeltext: "18".tr,
                              // mycontroller: ,
                            ),
                            GetBuilder<LoginControllerImp>(
                              builder: (controller) => CustomTextFormAuth(
                                obscureText: controller.isshowpassword,
                                onTapIcon: () {
                                  controller.showPassword();
                                },
                                isNumber: false,
                                valid: (val) {
                                  return validInput(val!, 5, 30, "password");
                                },
                                mycontroller: controller.password,
                                hinttext: "13".tr,
                                iconData: Icons.lock_outline,
                                labeltext: "19".tr,
                                // mycontroller: ,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.goToForgetPassword();
                              },
                              child: Text(
                                "14".tr,
                                textAlign: TextAlign.right,
                              ),
                            ),
                            CustomButtomAuth(
                                text: "15".tr,
                                onPressed: () {
                                  controller.login();
                                }),
                            const SizedBox(height: 40),
                          
                          ]),
                        ),
                      ))),
      ),
    );
  }
}
