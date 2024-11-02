import 'package:adminapp/controller/categories/add_controller.dart';
import 'package:adminapp/core/class/handlingdataview.dart';
import 'package:adminapp/core/constant/color.dart';
import 'package:adminapp/core/functions/validinput.dart';
import 'package:adminapp/view/widget/auth/custtombuttonauth.dart';
import 'package:adminapp/view/widget/auth/custtomtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categoriesadd extends StatelessWidget {
  const Categoriesadd({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    CategoriesAddController controller = Get.put(CategoriesAddController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Categories Add"),
        ),
        body: GetBuilder<CategoriesAddController>(
            builder: (controller) => Handlingdataview(
                statusRequest: controller.statusRequest, widget: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [
              CustomTextFormAuth(
                  hinttext: "Categories name",
                  labeltext: "Categories name",
                  iconData: Icons.category,
                  mycontroller: controller.name,
                  valid: (val) {
                    return validInput(val!, 1, 30, "");
                  },
                  isNumber: false),
              CustomTextFormAuth(
                  hinttext: "Categories name (Arabic)",
                  labeltext: "Categories name",
                  iconData: Icons.category,
                  mycontroller: controller.namear,
                  valid: (val) {
                    return validInput(val!, 1, 30, "");
                  },
                  isNumber: false),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: MaterialButton(
                    color:Colors.grey,
                onPressed: () async {
            try {
              await controller.chooseimage();  // تأكد من أن هذه الدالة غير متزامنة
            } catch (e) {
              print('Error: $e');
              // أضف رسالة خطأ تظهر للمستخدم إذا رغبت بذلك
            }
          },
                    child:const Text(
                      "Upload Image",
                      style: TextStyle(color: AppColor.primaryColor),
                    ),
                  )),
               if(controller.file !=null)
               Image.file(controller.file!),
                  CustomButtomAuth(text: "Add",onPressed: (){
                    controller.addData();
                  },)
            ],
          ),
        ),
      ))));
  }
}
