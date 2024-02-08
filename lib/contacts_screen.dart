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
  GlobalKey<FormState> _formkey =  GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  //int index = 0;

  List<Contact> contacts = [];

  void addContact() {


    if (contacts.length < 3) {
      String name = nameController.text;
      String phoneNumber = numberController.text;

      contacts.add(Contact(
          name: nameController.text,
          PhoneNumber: numberController.text));

      setState(() {

      });
     // index++;
      nameController.clear();
      numberController.clear();

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
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              textField(
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  hintText: "Enter Your Name Here",
                  icon: Icons.edit, message: 'please enter your name',controllerTypeValue: nameController.text),
              textField(
                  keyboardType: TextInputType.phone,
                  controller: numberController,
                  hintText: "Enter Your Number Here",
                  icon: Icons.phone, message: 'please enter your phone number',controllerTypeValue: numberController.text),

                  Visibility(
                    visible:contacts.length < 3 ,
                    child: elevatedButton(
                        color: Colors.blue,
                        label: "Add",
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            addContact();
                      print("indexlist${contacts.length}");
                            setState(() {});

                          }



                        }),
                  ),


              SizedBox(
                height: 10,
              ),

              Column(
                children: contacts.map((contact) {
                  return Container(
                    height: 80,
                    width: 320,
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical:5 ),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                         Spacer(),
                        IconButton(
                            onPressed: (){

                              if (contacts.isNotEmpty) {
                                contacts.remove(contact);                              }

                              setState(() {

                              });
                            },
                            icon: Icon(Icons.delete,color: Colors.red,))
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
      ),
    );
  }
}
