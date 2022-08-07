import 'package:bloc/bloc.dart';
import '../pages/HealthTip2.dart';
import '../pages/healthtip.dart';
import '../pages/share.dart';
import '../pages/homepage.dart';
import '../pages/contact.dart';
import '../pages/aboutus.dart';

enum NavigationEvents {
  HomePageClickEvent,
  HealthTipClickEvent,
  HealthTipClickEvent2,
  ShareClickEvent,
  ContactClickEvent,
  AboutUsClickEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc(NavigationStates initialState) : super(initialState);
  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickEvent:
        yield HomePage();
        break;
      case NavigationEvents.HealthTipClickEvent:
        yield HealthTipPage();
        break;
      case NavigationEvents.ShareClickEvent:
        yield SharePage();
        break;
      case NavigationEvents.ContactClickEvent:
        yield Contact();
        break;
      case NavigationEvents.AboutUsClickEvent:
        yield AboutUsPage();
        break;
      case NavigationEvents.HealthTipClickEvent2:
        yield HealthTip2();
        break;
    }
  }
}
