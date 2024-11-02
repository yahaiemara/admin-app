import 'package:adminapp/core/constant/color.dart';
import 'package:flutter/widgets.dart';

class Custtomtitlehome extends StatelessWidget {
  final String titletext;
  const Custtomtitlehome({super.key, required this.titletext});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        titletext,
        style: const TextStyle(
            color: AppColor.primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
