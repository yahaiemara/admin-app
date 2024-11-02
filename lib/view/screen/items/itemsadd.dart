import 'package:adminapp/controller/items/add_controller.dart';
import 'package:adminapp/core/class/handlingdataview.dart';
import 'package:adminapp/core/constant/color.dart';
import 'package:adminapp/core/functions/validinput.dart';
import 'package:adminapp/core/shared/custtomdropdownlist.dart';
import 'package:adminapp/view/widget/auth/custtombuttonauth.dart';
import 'package:adminapp/view/widget/auth/custtomtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Itemsadd extends StatelessWidget {
  const Itemsadd({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    ItemsAddController controller = Get.put(ItemsAddController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Items Add"),
        ),
        body: GetBuilder<ItemsAddController>(
            builder: (controller) => Handlingdataview(
                statusRequest: controller.statusRequest, widget: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [
              CustomTextFormAuth(
                  hinttext: "Items name",
                  labeltext: "Items name",
                  iconData: Icons.category,
                  mycontroller: controller.name,
                  valid: (val) {
                    return validInput(val!, 1, 30, "");
                  },
                  isNumber: false),
              CustomTextFormAuth(
                  hinttext: "Items name (Arabic)",
                  labeltext: "Items name",
                  iconData: Icons.category,
                  mycontroller: controller.namear,
                  valid: (val) {
                    return validInput(val!, 1, 30, "");
                  },
                  isNumber: false),
                    CustomTextFormAuth(
                  hinttext: "Description name",
                  labeltext: "Description name",
                  iconData: Icons.category,
                  mycontroller: controller.desc,
                  valid: (val) {
                    return validInput(val!, 1, 30, "");
                  },
                  isNumber: false),
                    CustomTextFormAuth(
                  hinttext: "Description name (Arabic)",
                  labeltext: "Description name",
                  iconData: Icons.category,
                  mycontroller: controller.descar,
                  valid: (val) {
                    return validInput(val!, 1, 30, "");
                  },
                  isNumber: false),
           
              CustomTextFormAuth(
                  hinttext: "Count",
                  labeltext: "Count",
                  iconData: Icons.category,
                  mycontroller: controller.count,
                  valid: (val) {
                    return validInput(val!, 1, 30, "");
                  },
                  isNumber: false),
              CustomTextFormAuth(
                  hinttext: "Discount",
                  labeltext: "Discount",
                  iconData: Icons.category,
                  mycontroller: controller.discount,
                  valid: (val) {
                    return validInput(val!, 1, 30, "");
                  },
                  isNumber: false),
                    CustomTextFormAuth(
                  hinttext: "Price",
                  labeltext: "Price",
                  iconData: Icons.category,
                  mycontroller: controller.price,
                  valid: (val) {
                    return validInput(val!, 1, 30, "");
                  },
                  isNumber: false),
                  Custtomdropdownlist(listdata: controller.dropdownlist,
                   dropdownname: controller.catname,
                    dropdwonid: controller.catid, title: "Choose Your Categort"),
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
