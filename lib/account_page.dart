import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class accountPageScreen extends StatefulWidget {
  const accountPageScreen({Key? key}) : super(key: key);

  @override
  _accountPageScreenState createState() => _accountPageScreenState();
}

class _accountPageScreenState extends State<accountPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
    );
  }
}
