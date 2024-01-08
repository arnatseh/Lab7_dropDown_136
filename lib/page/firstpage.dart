import 'package:flutter/material.dart';

class MyFirstpage extends StatefulWidget {
  const MyFirstpage({super.key});

  @override
  State<MyFirstpage> createState() => _MyFirstpageState();
}

class _MyFirstpageState extends State<MyFirstpage> {

  List<ListItem> foodtype =[
    ListItem("ส้มตำ", "ส้มตำ"),
    ListItem("ต้มยำ", "ต้มยำ"),
    ListItem("ยำส้ม", "ยำส้ม"),
  ];
List<DropdownMenuItem<ListItem>> _dropdownMenuItems=[];

ListItem? _selectedItem;

List<DropdownMenuItem<ListItem>> builddropdownmenu(List<ListItem> foodtype) {
  List<DropdownMenuItem<ListItem>> item=[];

  for (ListItem ft in foodtype) {
    item.add(DropdownMenuItem(
      value: ft,
      child: Text(ft.name)));
    
  }


  return item;
}

@override
  void initState() {
    super.initState();
    _dropdownMenuItems=builddropdownmenu(foodtype);
    _selectedItem = _dropdownMenuItems[0].value;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("lab07_dropdown"),
      ),
      body: Column(
        children: [Text("เลือกประเภทอาหาร"),
        DropdownButton(
          value: _selectedItem,
          items: _dropdownMenuItems, onChanged: (value) {
            setState(() {
              _selectedItem = value!;
            });
          
        },)
        
        ],
      ),
    );
  }
  
  

}


class ListItem {
String value;
String name;
ListItem(this.value, this.name);
}

