import 'package:assignment3_contact_screen/contact.dart';
import 'package:assignment3_contact_screen/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'elevatedButton.dart';

class contactsScreen extends StatefulWidget {
  contactsScreen({Key? key}) : super(key: key);

  @override
  State<contactsScreen> createState() => _contactsScreenState();
}

class _contactsScreenState extends State<contactsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  int index = 0;
  //List<bool> visibility = [false, false, false];

  // bool isVisible = false;
  List<Contact> contacts = [];

  void addContact(index) {
    if(index>=0&&index<3){
    //   visibility[index] = true;
    contacts[index].isVisible=true;
    //
    }

    if (contacts.length < 3) {
      String name = nameController.text;
      String phoneNumber = numberController.text;
      contacts.add(Contact(
          name: nameController.text,
          PhoneNumber: numberController.text,isVisible: false));
      nameController.clear();
      numberController.clear();
    }
    // if(contacts.length > 2){
    //   contacts.clear();
    // }
  }

  void deleteContact(index) {
    if (contacts.isNotEmpty) {
      contacts.removeLast();
    }
if(index>=-2&&index<=0){
//    visibility[index+2] = false;
    contacts[index].isVisible = false;
 }

  }
  // void toggleContact(int index) {
  //   setState(() {
  //     contacts[index].isVisible = !contacts[index].isVisible;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30.withOpacity(0.5),
      appBar: AppBar(
        title: Text("Contacts Screen"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            textField(
                keyboardType: TextInputType.name,
                controller: nameController,
                hintText: "Enter Your Name Here",
                icon: Icons.edit),
            textField(
                keyboardType: TextInputType.phone,
                controller: numberController,
                hintText: "Enter Your Number Here",
                icon: Icons.phone),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                elevatedButton(
                    color: Colors.blue,
                    label: "Add",
                    onPressed: () {
                      //isVisible = true;
                      addContact(index);
                    //  print("index${index}");
                     // print("res${visibility[index]}");
                     index++;
                      //print(nameController);

                      setState(() {});
                    }),
                elevatedButton(
                    color: Colors.red,
                    label: "Delete",
                    onPressed: () {
                      // isVisible = false;
                      deleteContact(index);
                      index--;
                      setState(() {});
                    }),
              ],
            ),
            SizedBox(
              height: 10,
            ),

            Column(
              children: contacts.map((contact) {
               print("before${contacts[index].isVisible}");
                return Visibility(
                     visible:contacts[index].isVisible ,
                  //visible: visibility[index],

                  // visible:isVisible,
                  child: Container(
                    height: 70,
                    width: 320,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Name:${contact.name}",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Phone:${contact.PhoneNumber}",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ],
                    ),

                  ),
                );


              }

              ).toList(),
              // [

              // ],

            ),
          ],
        ),
      ),
    );
  }
}
