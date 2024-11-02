import 'package:adminapp/core/constant/color.dart';
import 'package:flutter/material.dart';

class Custtombuttonappbar extends StatelessWidget {
  final void Function()? onPressed;
  final String textbar;
  final IconData iconData;
  final Color? color;
  final bool? active;
  const Custtombuttonappbar(
      {super.key,
      this.onPressed,
      required this.textbar,
      required this.iconData,
      this.color,
      this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: active == true ? AppColor.primaryColor : AppColor.grey2,
          ),
          // Text(
          //   textbar,
          //   style: TextStyle(color: active==true?AppColor.primaryColor:AppColor.grey2),
          // )
        ],
      ),
    );
  }
}
