import 'package:bloc/bloc.dart';

import 'package:fillme/profile.dart';
import 'package:fillme/mapHome.dart';
import '../feedback.dart';

enum NavigationEvents {
  ProfileEvent,
  DisplayMapEvent,
  FeedbackEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => MyMapApp();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.ProfileEvent:
        yield ProfilePage();
        break;
      case NavigationEvents.DisplayMapEvent:
        yield MyMapApp();
        break;
      case NavigationEvents.FeedbackEvent:
        yield FeedbackPage();
        break;
    }
  }
}
