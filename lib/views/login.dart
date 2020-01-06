import 'package:flutter/material.dart';
import 'package:flutter_maps/screens/SignIn.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignIn(), 
      // body: SignInOne(),
    );
  }
}
