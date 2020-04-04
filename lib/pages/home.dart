import 'package:flutter/material.dart';

import 'navigation_bloc.dart';

class HomePage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home',
        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
      ),
    );
  }
}
