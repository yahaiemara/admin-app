import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class Custtomdropdownlist extends StatefulWidget {
  final String title;
  final List<SelectedListItem> listdata;
  final TextEditingController dropdownname;
  final TextEditingController dropdwonid;
  const Custtomdropdownlist({super.key, required this.listdata, required this.dropdownname, required this.dropdwonid, required this.title});

  @override
  State<Custtomdropdownlist> createState() => _CusttomdropdownlistState();
}

class _CusttomdropdownlistState extends State<Custtomdropdownlist> {
  void showMenu(){
    DropDownState(
      DropDown(
        bottomSheetTitle:  Text(
          widget.title,
          style:const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.listdata ??[],
        onSelected: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem=selectedList[0];
          widget.dropdownname.text=selectedListItem.name;
          widget.dropdwonid.text=selectedListItem.value!;
          
        },
      
      ),
    ).showModal(context);
  }
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
          controller:widget.dropdownname ,
          cursorColor: Colors.black,
          onTap: 
               () {
                  FocusScope.of(context).unfocus();
               showMenu();
                },
             
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black12,
            contentPadding:
                const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
            hintText: widget.dropdownname.text==""?widget.title:widget.dropdownname.text,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
        );
  }
}