import 'package:byte_bank_complete_app/page/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomePage()
    );
  }
}