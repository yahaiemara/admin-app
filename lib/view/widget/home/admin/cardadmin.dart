import 'package:flutter/material.dart';

class Cardadmin extends StatelessWidget {
  final String title;
  final String url;
  final void Function()? onTap;
  const Cardadmin({super.key, required this.title, required this.url,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          children: [
            Image.asset(
              url,
              width: 80,
            ),
             Text("$title")
          ],
        ),
      ),
    );
  }
}
