import 'package:byte_bank_complete_app/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final Future<Database> createDatabase = getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebank.db');
    return openDatabase(path, onCreate: (db, version){
      db.execute(
        'CREATE TABLE contacts('
        'id INTEGER PRIMARY KEY, '
        'name TEXT, '
        'account_number INTEGER);'
      );
    }, version: 1);
  });

Future<int> save(Contact contact){
  return createDatabase.then((db) {
    return db.insert('contacts', contact.toMap());
  });
}

Future<List<Contact>> findAll(){
  return createDatabase.then((db) {
    return db.query('contacts')
      .then((maps) => maps.map((e) => Contact.fromMap(e)).toList());
  });
}