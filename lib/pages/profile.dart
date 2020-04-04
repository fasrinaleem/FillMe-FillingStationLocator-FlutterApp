import 'package:flutter/material.dart';

import 'navigation_bloc.dart';

class Profile extends StatelessWidget  with NavigationStates {
  @override
  Widget build(BuildContext context){
    return Center(
      child: Text('Profile',style: TextStyle(fontWeight: FontWeight.w800,fontSize:20),
      ),
    );
  }
}
