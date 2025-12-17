import 'package:firstapp/contact.details.dart';
import 'package:firstapp/models.dart/contact.dart';
import 'package:flutter/material.dart';

class Contactlist extends StatefulWidget {
  const Contactlist({super.key});

  @override
  State<Contactlist> createState() => _ContactlistState();
}

class _ContactlistState extends State<Contactlist> {
  List<Contact> contact = [
    Contact("Bakary Coulibaly", "77 77 77 77",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRKgUUpHpc-JwcJiRLScAepL-T3oeaxR8T5A&s"),
    Contact("Emma Théra", "77 77 77 77",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRKgUUpHpc-JwcJiRLScAepL-T3oeaxR8T5A&s"),
    Contact("Kadidiatou djiré", "77 77 77 77",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRKgUUpHpc-JwcJiRLScAepL-T3oeaxR8T5A&s"),
    Contact("Fatoumata kanta", "77 77 77 77",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRKgUUpHpc-JwcJiRLScAepL-T3oeaxR8T5A&s"),
    Contact("Adiba Noor", "77 77 77 77",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRKgUUpHpc-JwcJiRLScAepL-T3oeaxR8T5A&s"),
    Contact("Momo Jamaney", "77 77 77 77",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRKgUUpHpc-JwcJiRLScAepL-T3oeaxR8T5A&s"),
    Contact("Harouna Traoré", "77 77 77 77",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRKgUUpHpc-JwcJiRLScAepL-T3oeaxR8T5A&s"),
    Contact("Allassane Bouare", "77 77 77 77",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRKgUUpHpc-JwcJiRLScAepL-T3oeaxR8T5A&s"),
    Contact("Oumar Doumbia", "77 77 77 77",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRKgUUpHpc-JwcJiRLScAepL-T3oeaxR8T5A&s"),
    Contact("Ali Soumare", "77 77 77 77",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRKgUUpHpc-JwcJiRLScAepL-T3oeaxR8T5A&s"),
    Contact("Frozen Traoré", "77 77 77 77",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRKgUUpHpc-JwcJiRLScAepL-T3oeaxR8T5A&s"),
    Contact("Gaoussou Bocoum", "77 77 77 77",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRKgUUpHpc-JwcJiRLScAepL-T3oeaxR8T5A&s"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Liste de contact"),
        ),
        body: ListView.builder(
            itemCount: contact.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          ContactDetails(contact: contact[index]),
                    ),
                  );
                },
                child: Card(
                  elevation: 10,
                  child: ListTile(
                    leading: Image.network(contact[index].urlUrl),
                    title: Text(contact[index].nom),
                    subtitle: Text(contact[index].phoneNumber),
                  ),
                ),
              );
            }));
  }
}
