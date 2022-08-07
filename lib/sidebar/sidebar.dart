import 'dart:async';

import 'package:final_project_app/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:final_project_app/sidebar/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:rxdart/rxdart.dart';
//import 'package:share/share.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  late AnimationController _animationController;
  late StreamController<bool> isSidebarOpendStreamController;
  late Stream<bool> isSideBarOpenedStream;
  late StreamSink<bool> isSideBarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 200);
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpendStreamController = PublishSubject<bool>();
    isSideBarOpenedStream = isSidebarOpendStreamController.stream;
    isSideBarOpenedSink = isSidebarOpendStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpendStreamController.close();
    isSideBarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;
    if (isAnimationCompleted) {
      isSideBarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSideBarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  void _showRatingAppDialog() {
    final _ratingDialog = RatingDialog(
      ratingColor: Colors.amber,
      title: 'Rate PHinder App',
      message: 'Rate this app and tell us your feeling.'
          ' Add more description here if you want.',
      image: Image.asset(
        "assets/logo2.png",
        height: 100,
      ),
      submitButton: 'Submit',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, '
            'comment: ${response.comment}');

        if (response.rating < 3.0) {
          print('response.rating: ${response.rating}');
        } else {
          Container();
        }
      },
    );

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => _ratingDialog,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSideBarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data! ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data! ? 0 : screenWidth - 45,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(30),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              image: AssetImage('assets/logo2.png'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Divider(
                        height: 10,
                        thickness: 0.5,
                        color: Color.fromRGBO(51, 83, 176, 1),
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItem(
                        color: Color.fromRGBO(51, 83, 176, 1),
                        icon: Icons.home,
                        title: "Home",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.HomePageClickEvent);
                        },
                      ),
                      MenuItem(
                        color: Color.fromRGBO(51, 83, 176, 1),
                        icon: Icons.health_and_safety,
                        title: "Health Tip",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.HealthTipClickEvent2);
                        },
                      ),
                      MenuItem(
                        color: Color.fromRGBO(51, 83, 176, 1),
                        icon: Icons.health_and_safety,
                        title: "BMI calc",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.HealthTipClickEvent);
                        },
                      ),
                      MenuItem(
                        color: Color.fromRGBO(51, 83, 176, 1),
                        icon: Icons.contact_phone,
                        title: "Contact Us",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.ContactClickEvent);
                        },
                      ),
                      MenuItem(
                        color: Color.fromRGBO(51, 83, 176, 1),
                        icon: Icons.rate_review,
                        title: "Rate Us",
                        onTap: () {
                          onIconPressed();
                          //Share.share('phinder.com');
                          _showRatingAppDialog();

                          //BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.ShareClickEvent);
                        },
                      ),
                      MenuItem(
                        color: Color.fromRGBO(51, 83, 176, 1),
                        icon: Icons.info_outlined,
                        title: "About Us",
                        onTap: () {
                          onIconPressed();
                          showAboutDialog(
                            context: context,
                            applicationIcon: FlutterLogo(),
                            applicationName: 'PHinder',
                            applicationVersion: '0.0.1',
                            applicationLegalese: 'Developed by PHinder company',
                          );
                          //BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.AboutUsClickEvent);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment(0, -0.9),
                  child: GestureDetector(
                      onTap: () {
                        onIconPressed();
                      },
                      child: ClipPath(
                        clipper: CustomMenuClipper(),
                        child: Container(
                          width: 35,
                          height: 110,
                          color: Color.fromRGBO(51, 83, 176, 1),
                          alignment: Alignment.centerLeft,
                          child: AnimatedIcon(
                            progress: _animationController.view,
                            icon: AnimatedIcons.menu_close,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ))),
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
