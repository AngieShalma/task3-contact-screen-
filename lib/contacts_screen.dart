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
  bool isVisible = false;
  List<Contact> contacts = [];

  void addContact() {
    if (contacts.length < 3) {
      String name = nameController.text;
      String phoneNumber = numberController.text;

      contacts.add(Contact(
          name: nameController.text, PhoneNumber: numberController.text));
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
      body: Column(
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
                  onPress: () {
                    isVisible = true;
                    addContact();
               //print(nameController);

                    setState(() {});
                  }),
              elevatedButton(
                  color: Colors.red,
                  label: "Delete",
                  onPress: () {

                    isVisible = false;
                    deleteContact();

                    setState(() {});
                  }),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: contacts.map((contact) {
              return Visibility(
              visible: isVisible,

                child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28)),
                    child: ListTile(
                      title: Text(contact.name),
                      subtitle: Text(contact.PhoneNumber),
                    ),
                  ),
                ),
              );
            }).toList(),
            // [
            //   Text(contacts.name),
            //   SizedBox(height: 10,),
            //   Text("$numberController"),
            // ],
          ),
        ],
      ),
    );
  }
}
