
import 'package:byte_bank_complete_app/page/contact_form.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: ListView(
        children: const [
          Card(
            child: ListTile(
              title: Text(
                'Alex',
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              subtitle: Text('1000'),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
            .push(
              MaterialPageRoute(builder: (context) => ContactForm()
            )
          ).then((newContact) => debugPrint(newContact.toString()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
