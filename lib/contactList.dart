import 'package:flutter/material.dart';
import 'package:firstapp/models.dart/contact.dart';
import 'package:firstapp/contact.details.dart';

/// =======================
/// LISTE DES CONTACTS
/// =======================
class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final List<Contact> contacts = [
    Contact(
      "Bakary Coulibaly",
      "77 77 77 77",
      "https://via.placeholder.com/150",
    ),
    Contact(
      "Bakary Coulibaly",
      "77 77 77 77",
      "https://via.placeholder.com/150",
    ),
    Contact(
      "Bakary Coulibaly",
      "77 77 77 77",
      "https://via.placeholder.com/150",
    ),
    Contact(
      "Bakary Coulibaly",
      "77 77 77 77",
      "https://via.placeholder.com/150",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste de contacts"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final newContact = await Navigator.of(context).push<Contact>(
                MaterialPageRoute(
                  builder: (context) => const ContactForm(),
                ),
              );

              if (newContact != null) {
                setState(() {
                  contacts.add(newContact);
                });
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                    builder: (context) => ContactDetails(
                          contact: contacts[index],
                        )),
              );
            },
            onDoubleTap: () {
              final removed = contacts[index];
              setState(() {
                contacts.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${removed.nom} supprimé')),
              );
            },
            child: Card(
              elevation: 10,
              child: ListTile(
                leading: Builder(builder: (context) {
                  final name = contacts[index].nom;
                  final initials = name
                      .split(' ')
                      .where((s) => s.isNotEmpty)
                      .map((s) => s[0])
                      .take(2)
                      .join()
                      .toUpperCase();
                  final url = contacts[index].urlUrl;
                  final hasValidUrl = url != null &&
                      url.isNotEmpty &&
                      (Uri.tryParse(url)?.isAbsolute ?? false);

                  return CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey[200],
                    child: hasValidUrl
                        ? ClipOval(
                            child: Image.network(
                              url,
                              width: 48,
                              height: 48,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Text(initials),
                            ),
                          )
                        : Text(initials),
                  );
                }),
                title: Text(contacts[index].nom),
                subtitle: Text(contacts[index].phoneNumber),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// =======================
/// FORMULAIRE DE CONTACT
/// =======================
class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();

  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _phoneController = TextEditingController();
  final _urlController = TextEditingController();

  @override
  void dispose() {
    _nomController.dispose();
    _prenomController.dispose();
    _phoneController.dispose();
    _urlController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final contact = Contact(
        "${_nomController.text.trim()} ${_prenomController.text.trim()}",
        _phoneController.text.trim(),
        _urlController.text.trim(),
      );

      Navigator.of(context).pop(contact);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter un contact"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              /// NOM
              TextFormField(
                controller: _nomController,
                decoration: const InputDecoration(labelText: "Nom"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Le nom est obligatoire";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 10),

              /// PRENOM
              TextFormField(
                controller: _prenomController,
                decoration: const InputDecoration(labelText: "Prénom"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Le prénom est obligatoire";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 10),

              /// TELEPHONE
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: "Numéro"),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Le numéro est obligatoire";
                  }
                  if (value.length < 8) {
                    return "Numéro invalide";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 10),

              /// IMAGE URL
              TextFormField(
                controller: _urlController,
                decoration: const InputDecoration(labelText: "Image URL"),
                keyboardType: TextInputType.url,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "L’URL est obligatoire";
                  }
                  if (!Uri.tryParse(value)!.isAbsolute) {
                    return "URL invalide";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              /// BOUTON ENREGISTRER
              ElevatedButton(
                onPressed: _submit,
                child: const Text("Enregistrer"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
