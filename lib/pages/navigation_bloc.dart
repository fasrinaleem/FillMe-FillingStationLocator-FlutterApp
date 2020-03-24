import 'package:bloc/bloc.dart';

import 'home.dart';
import 'welcome.dart';
import 'profile.dart';
import 'map.dart';

enum NavigationEvents {
  HomePageEvent,
  ProfileEvent,
  LogoutEvent,
  DisplayMapEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageEvent:
        yield HomePage();
        break;
      case NavigationEvents.ProfileEvent:
        yield Profile();
        break;
      case NavigationEvents.DisplayMapEvent:
        yield MapPage();
        break;
      case NavigationEvents.LogoutEvent:
        yield WelcomePage();
        break;
    }
  }
}
