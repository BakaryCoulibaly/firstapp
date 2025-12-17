import 'package:flutter/material.dart';
import 'package:firstapp/models.dart/contact.dart';

class ContactDetails extends StatelessWidget {
  ContactDetails({super.key, required this.contact});
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(contact.nom),
      ),
    );
  }
}
