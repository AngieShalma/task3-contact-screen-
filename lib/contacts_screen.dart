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

  List<Contact> contacts = [];

  void addContact() {


    if (contacts.length < 3) {
      String name = nameController.text;
      String phoneNumber = numberController.text;
      contacts.add(Contact(
          name: nameController.text,
          PhoneNumber: numberController.text,isVisible: false));
      nameController.clear();
      numberController.clear();
    }

  }

  void deleteContact() {
    if (contacts.isNotEmpty) {
      contacts.removeLast();
    }


  }


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
                Visibility(
                  visible:contacts.length < 3 ,
                  child: elevatedButton(
                      color: Colors.blue,
                      label: "Add",
                      onPressed: () {
                        addContact();

                        setState(() {});
                      }),
                ),
                Visibility(
                  visible:contacts.isNotEmpty ,
                  child: elevatedButton(
                      color: Colors.red,
                      label: "Delete",
                      onPressed: () {
                        deleteContact();
                        setState(() {});
                      }),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),

            Column(
              children: contacts.map((contact) {
                return Container(
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
