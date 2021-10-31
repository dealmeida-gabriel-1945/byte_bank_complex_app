import 'package:byte_bank_complete_app/model/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {


  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _nameController,
                style: const TextStyle(fontSize: 24),
                decoration: const InputDecoration(
                  labelText: 'Full name',
                  labelStyle: TextStyle(
                    fontSize: 24
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _accountNumberController,
                style: const TextStyle(fontSize: 24),
                decoration: const InputDecoration(
                  labelText: 'Account number',
                  labelStyle: TextStyle(
                    fontSize: 24
                  )
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          final newContact = Contact(
            0,
            _nameController.text,
            int.tryParse(_accountNumberController.text) ?? 0
          );
          debugPrint(newContact.toString());
          Navigator.pop(context, newContact);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
