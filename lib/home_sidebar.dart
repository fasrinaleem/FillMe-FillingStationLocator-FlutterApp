import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sidebar.dart';
import 'navigation/navigation_bloc.dart';

class HomePageWithSideBar extends StatelessWidget{
@override
  Widget build(BuildContext context){

  return Scaffold(
    body: BlocProvider<NavigationBloc>(
      create: (context) => NavigationBloc(),
      child: Stack(
        children: <Widget>[
          BlocBuilder<NavigationBloc, NavigationStates>(
            builder: (context, navigationState) {
              return navigationState as Widget;
            },
          ),
          SideBar(),
        ],
      ),
    ),
    );
  }

}