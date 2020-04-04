import 'package:flutter/material.dart';

import 'navigation_bloc.dart';

class MapPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'MAp',
        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
      ),
    );
  }
}
