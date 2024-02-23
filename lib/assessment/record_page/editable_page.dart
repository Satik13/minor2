import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Contact {
  String name;
  String marks;

  Contact({required this.name, required this.marks});
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController marksController = TextEditingController();
  List<Contact> contacts = [];

  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  _loadContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final contactsJson = prefs.getStringList('contacts');
    if (contactsJson != null) {
      setState(() {
        contacts = contactsJson.map((contactJson) {
          final contactMap = Map<String, dynamic>.from(json.decode(contactJson));
          return Contact(name: contactMap['name'], marks: contactMap['marks']);
        }).toList();
      });
    }
  }

  _saveContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final contactsJson = contacts.map((contact) => json.encode({'name': contact.name, 'marks': contact.marks})).toList();
    prefs.setStringList('contacts', contactsJson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Assessment Records'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  hintText: 'Student Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: marksController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: 'Marks',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      String name = nameController.text.trim();
                      String marks = marksController.text.trim();
                      if (name.isNotEmpty && marks.isNotEmpty) {
                        setState(() {
                          nameController.text = '';
                          marksController.text = '';
                          contacts.add(Contact(name: name, marks: marks));
                          _saveContacts(); // Save contacts when adding
                        });
                      }
                    },
                    child: const Text('Save')),
                ElevatedButton(
                    onPressed: () {
                      String name = nameController.text.trim();
                      String marks = marksController.text.trim();
                      if (name.isNotEmpty && marks.isNotEmpty) {
                        setState(() {
                          nameController.text = '';
                          marksController.text = '';
                          contacts[selectedIndex].name = name;
                          contacts[selectedIndex].marks = marks;
                          selectedIndex = -1;
                          _saveContacts(); // Save contacts after update
                        });
                      }
                    },
                    child: const Text('Update')),
              ],
            ),
            const SizedBox(height: 10),
            contacts.isEmpty
                ? const Text(
                    'No marks yet..',
                    style: TextStyle(fontSize: 22),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (context, index) => getRow(index),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              index % 2 == 0 ? Colors.deepPurpleAccent : Colors.purple,
          foregroundColor: Colors.white,
          child: Text(
            contacts[index].name[0],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contacts[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(contacts[index].marks),
          ],
        ),
        trailing: SizedBox(
          width: 70,
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    nameController.text = contacts[index].name;
                    marksController.text = contacts[index].marks;
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: const Icon(Icons.edit)),
              InkWell(
                  onTap: (() {
                    setState(() {
                      contacts.removeAt(index);
                      _saveContacts(); // Save contacts after deletion
                    });
                  }),
                  child: const Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
