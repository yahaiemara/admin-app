import 'package:adminapp/controller/categories/edit_controller.dart';
import 'package:adminapp/core/class/handlingdataview.dart';
import 'package:adminapp/core/constant/color.dart';
import 'package:adminapp/core/functions/validinput.dart';
import 'package:adminapp/view/widget/auth/custtombuttonauth.dart';
import 'package:adminapp/view/widget/auth/custtomtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoriesEdit extends StatelessWidget {
  const CategoriesEdit({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    CategoriesEditController controller = Get.put(CategoriesEditController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Categories Edit"),
        ),
        body: GetBuilder<CategoriesEditController>(
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
               SvgPicture.file(controller.file!),
                  CustomButtomAuth(text: "Edit",onPressed: (){
                    controller.editData();
                  },)
            ],
          ),
        ),
      ))));
  }
}
