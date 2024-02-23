import 'package:flutter/material.dart';

class RecordProvider extends ChangeNotifier {
  List<Contact> contacts = [];

  void addContact(Contact contact) {
    contacts.add(contact);
    notifyListeners();
  }

  void updateContact(int index, Contact contact) {
    contacts[index] = contact;
    notifyListeners();
  }

  void deleteContact(int index) {
    contacts.removeAt(index);
    notifyListeners();
  }
}

class Contact {
  String name;
  String contact;

  Contact({required this.name, required this.contact});
}
