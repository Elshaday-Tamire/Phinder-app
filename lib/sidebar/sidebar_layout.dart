import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:final_project_app/pages/homepage.dart';

import 'sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideBarLayout extends StatefulWidget {
  const SideBarLayout({Key? key}) : super(key: key);

  @override
  _SideBarLayoutState createState() => _SideBarLayoutState();
}

class _SideBarLayoutState extends State<SideBarLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(HomePage()),
        child: Stack(
          children: [
            BlocBuilder<NavigationBloc, NavigationStates>(
                builder: (context, navigationStates) {
              return navigationStates as Widget;
            }),
            SideBar(),
          ],
        ),
      ),
    );
  }
}
