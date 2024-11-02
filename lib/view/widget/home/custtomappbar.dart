import 'package:flutter/material.dart';

class Custtomappbar extends StatelessWidget {
  final String text;

  final void Function()? onPressedSearch;
  final void Function()? onPressedFav;
  final void Function(String) onChanged;
  final TextEditingController mycontroller;
  const Custtomappbar(
      {super.key,
      required this.text,
      required this.onPressedSearch,
      required this.onPressedFav, required this.onChanged, required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Row(children: [
        Expanded(
            child: TextFormField(
              controller: mycontroller,
              onChanged:onChanged,
          decoration: InputDecoration(
              prefixIcon: IconButton(
                  onPressed: onPressedSearch, icon: const Icon(Icons.search)),
              hintText: text,
              hintStyle: const TextStyle(fontSize: 18),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: Colors.grey[200]),
        )),
        const SizedBox(width: 10),
   
        Container(
          margin: const EdgeInsets.only(left: 5),
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
          width: 60,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: IconButton(
              onPressed: onPressedFav,
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 30,
                color: Colors.grey[600],
              )),
        )
      ]),
    );
  }
}
