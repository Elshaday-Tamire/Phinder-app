import 'package:final_project_app/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
class RateUs extends StatelessWidget with NavigationStates {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Rate us",
        style: TextStyle(fontWeight: FontWeight.w900,fontSize: 28),
      ),
    );
  }
}
