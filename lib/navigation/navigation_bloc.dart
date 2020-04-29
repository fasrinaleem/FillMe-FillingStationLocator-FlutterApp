import 'package:bloc/bloc.dart';

import 'package:fillme/mapHome.dart';
import '../feedback.dart';

//list of events
enum NavigationEvents {
  DisplayMapEvent,
  FeedbackEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  // initial page is map page
  @override
  NavigationStates get initialState => MyMapApp();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    // all the sidebar navigations event for link the pages
    switch (event) {
      case NavigationEvents.DisplayMapEvent:
        yield MyMapApp();
        break;
      case NavigationEvents.FeedbackEvent:
        yield FeedbackPage();
        break;
    }
  }
}
