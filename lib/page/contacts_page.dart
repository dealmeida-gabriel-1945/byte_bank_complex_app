
import 'package:byte_bank_complete_app/database/app_database.dart';
import 'package:byte_bank_complete_app/model/contact.dart';
import 'package:byte_bank_complete_app/page/contact_form.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: FutureBuilder(
        initialData: const [],
        future: findAll(),
        builder: (context, snapshot) {
          switch(snapshot.connectionState){
            case ConnectionState.done:
              final List<Contact> contacts = snapshot.data as List<Contact>;
              return ListView.builder(
                itemBuilder: (context, index){
                  return _ContactItem(contacts[index]);
                },
                itemCount: contacts.length,
              );
            default:
              return const ActivityIndicator();
          }
        },
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

class ActivityIndicator extends StatelessWidget {
  const ActivityIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          CircularProgressIndicator(),
          Text('Carregando...')
        ],
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {

  final Contact contact;

  const _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          title: Text(
            contact.name,
            style: const TextStyle(
                fontSize: 20
            ),
          ),
          subtitle: Text(contact.accountNumber.toString()),
        ),
      );
  }
}
