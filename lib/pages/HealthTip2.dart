
import 'package:final_project_app/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:final_project_app/pages/tipItemes.dart';
import 'package:flutter/material.dart';
class HealthTip2 extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: healthTipCollection(),
    );
  }

}
