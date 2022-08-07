import 'package:final_project_app/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:contactus/contactus.dart';

class Contact extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: ContactUsBottomAppBar(
          companyName: 'PHinder',
          textColor: Color.fromRGBO(51, 83, 176, 1),
          backgroundColor: Colors.white,
          email: 'elshadayrn13@gmail.com',
          // textFont: 'Sail',
        ),
        backgroundColor: Colors.white,
        body: ContactUs(
            cardColor: Colors.white,
            textColor: Color.fromRGBO(51, 83, 176, 1),
            //logo:
            email: 'elshadayrn13@gmail.com',
            companyName: 'PHinder',
            companyColor: Color.fromRGBO(51, 83, 176, 1),
            phoneNumber: '+251924385314',
            website: 'phinder.com',
            //githubUserName: 'AbhishekDoshi26',
            //linkedinURL:,
            tagLine: 'Pharmacy Finder',
            taglineColor: Color.fromRGBO(51, 83, 176, 1),
            twitterHandle: '',
            instagram: '',
            facebookHandle: ''),
      ),
    );
  }
}
