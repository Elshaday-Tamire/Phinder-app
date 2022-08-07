import 'package:final_project_app/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:final_project_app/pages/postssss.dart';
import 'package:final_project_app/pages/share.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_flexible_toast/flutter_flexible_toast.dart';

import 'healthtip.dart';

class HomePage extends StatefulWidget with NavigationStates {
  static double currentlong = 0;
  static double currentlat = 0;
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(9.037339413913871, 38.76209433642164);
  Location _location = Location();
  static double currentlong = 0;
  static double currentlat = 0;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _location.onLocationChanged.listen((l) {
      currentlat = l.latitude!;
      currentlong = l.longitude!;
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude!, l.longitude!), zoom: 14),
        ),
      );
    });
  }

  MapType selectedmaptype = MapType.normal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(51, 83, 176, 1),
        title: Row(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Image.asset(
                    "assets/appbar.PNG",
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 70,
                    //fit: BoxFit.fill,
                  ),
                )),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: GestureDetector(
                    onTap: () {
                      showSearch(context: context, delegate: DataSearch());
                    },
                    child: Image.asset(
                      "assets/searchbarfinal.PNG",
                      width: MediaQuery.of(context).size.width * 0.48,
                      height: 110,
                      //fit: BoxFit.fill,
                    ),
                  ),
                )),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Divider(),
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 16.0,
            ),
            mapType: selectedmaptype,
            myLocationEnabled: true,
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(35),
                  //   child: Container(
                  //     decoration: BoxDecoration(boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.transparent,
                  //         //spreadRadius: 0,
                  //         // blurRadius: 5,
                  //         //offset: Offset(0, 0)
                  //         //
                  //       )
                  //     ]),
                  //     child: Image.asset(
                  //       "assets/logofinal2.PNG",
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),

                  // SizedBox(
                  //   height: 2,
                  // ),
                  // Container(
                  //   decoration: BoxDecoration(boxShadow: [
                  //     BoxShadow(
                  //         color: Colors.white.withOpacity(0.008),
                  //         spreadRadius: 10,
                  //         blurRadius: 5,
                  //         offset: Offset(0, 7))
                  //   ]),
                  //   child: GestureDetector(
                  //     child: Image.asset(
                  //       "assets/searchfinal.PNG",
                  //       fit: BoxFit.fitWidth,
                  //     ),
                  //     onTap: () {
                  //       showSearch(context: context, delegate: DataSearch());
                  //     },
                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: IconButton(
                  //     onPressed: () {
                  //       setState(() {
                  //         selectedmaptype = MapType.satellite;
                  //       });
                  //     },
                  //     icon: Icon(Icons.satellite),
                  //     iconSize: 35,
                  //     color: Color.fromRGBO(14, 100, 175, 1),
                  //   ),
                  // )
                ],
              ),
            ),
          )
        ],
      ),

// //popup code
//               SizedBox(
//                 height: 50,
//                 child: Scaffold(
//                   backgroundColor: Colors.white,
//                   floatingActionButton: SpeedDial(
//                     animatedIcon: AnimatedIcons.menu_close,
//                     backgroundColor: Color.fromRGBO(51, 83, 176, 1),
//                     overlayColor: Colors.black,
//                     overlayOpacity: 0.6,
//                     children: [
//                       SpeedDialChild(
//                           child: Icon(Icons.all_inbox_rounded),
//                           label: "hybrid map",
//                           onTap: () {
//                             setState(() {
//                               selectedmaptype = MapType.hybrid;
//                             });
//                           }),
//                       SpeedDialChild(
//                           child: Icon(Icons.map),
//                           backgroundColor: Color.fromRGBO(51, 83, 176, 1),
//                           foregroundColor: Colors.white,
//                           label: "normal map",
//                           onTap: () {
//                             setState(() {
//                               selectedmaptype = MapType.normal;
//                             });
//                           }),
//                       SpeedDialChild(
//                           child: Icon(Icons.satellite),
//                           label: "sattelite map",
//                           onTap: () {
//                             setState(() {
//                               selectedmaptype = MapType.satellite;
//                             });
//                           }),
//                       SpeedDialChild(
//                           child: Icon(Icons.money_off_csred_sharp),
//                           backgroundColor: Color.fromRGBO(51, 83, 176, 1),
//                           foregroundColor: Colors.white,
//                           label: "price",
//                           onTap: () {
//                             FlutterFlexibleToast.showToast(
//                                 message: "price filter selected...",
//                                 toastLength: Toast.LENGTH_LONG,
//                                 toastGravity: ToastGravity.BOTTOM,
//                                 radius: 100,
//                                 elevation: 10,
//                                 imageSize: 35,
//                                 textColor: Colors.white,
//                                 backgroundColor: Color.fromRGBO(51, 83, 176, 1),
//                                 timeInSeconds: 2);
//                             setState(() {
//                               PostCollection.filter = "price";
//                             });
//                           }),
//                       SpeedDialChild(
//                           child: Icon(Icons.location_history),
//                           label: "distance",
//                           onTap: () async {
//                             FlutterFlexibleToast.showToast(
//                                 message: "distance filter selected...",
//                                 toastLength: Toast.LENGTH_LONG,
//                                 toastGravity: ToastGravity.BOTTOM,
//                                 radius: 100,
//                                 elevation: 10,
//                                 imageSize: 35,
//                                 textColor: Colors.white,
//                                 backgroundColor: Color.fromRGBO(51, 83, 176, 1),
//                                 timeInSeconds: 2);
//                             setState(() {
//                               PostCollection.filter = " ";
//                             });
//                           }),
//                       SpeedDialChild(
//                           child: Icon(Icons.exposure_zero),
//                           backgroundColor: Color.fromRGBO(51, 83, 176, 1),
//                           foregroundColor: Colors.white,
//                           label: "openend only",
//                           onTap: () {
//                             FlutterFlexibleToast.showToast(
//                                 message: "open pharmacies selected...",
//                                 toastLength: Toast.LENGTH_LONG,
//                                 toastGravity: ToastGravity.BOTTOM,
//                                 radius: 100,
//                                 elevation: 10,
//                                 imageSize: 35,
//                                 textColor: Colors.white,
//                                 backgroundColor: Color.fromRGBO(51, 83, 176, 1),
//                                 timeInSeconds: 2);
//                             setState(() {
//                               PostCollection.Statuse2 = false;
//                             });
//                           }),
//                       SpeedDialChild(
//                           child: Icon(Icons.all_inclusive),
//                           label: "opened/closed",
//                           onTap: () {
//                             FlutterFlexibleToast.showToast(
//                                 message: "open/closed pharmacies selected...",
//                                 toastLength: Toast.LENGTH_LONG,
//                                 toastGravity: ToastGravity.BOTTOM,
//                                 radius: 100,
//                                 elevation: 10,
//                                 imageSize: 35,
//                                 textColor: Colors.white,
//                                 backgroundColor: Color.fromRGBO(51, 83, 176, 1),
//                                 timeInSeconds: 2);
//                             setState(() {
//                               PostCollection.Statuse2 = true;
//                             });
//                           }),
//                       SpeedDialChild(
//                           child: Icon(Icons.search),
//                           backgroundColor: Color.fromRGBO(51, 83, 176, 1),
//                           foregroundColor: Colors.white,
//                           label: "search",
//                           onTap: () {
//                             FlutterFlexibleToast.showToast(
//                                 message: "type medicine name...",
//                                 toastLength: Toast.LENGTH_LONG,
//                                 toastGravity: ToastGravity.BOTTOM,
//                                 radius: 100,
//                                 elevation: 10,
//                                 imageSize: 35,
//                                 textColor: Colors.white,
//                                 backgroundColor: Color.fromRGBO(51, 83, 176, 1),
//                                 timeInSeconds: 2);
//                             showSearch(
//                                 context: context, delegate: DataSearch());
//                           }),
//                     ],
//                   ),
//                 ),
//               ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  static String last = "";
  final drugs = [
    "Mesna",
    "Imatinib",
    "Hydromorphone",
    "Atenolol",
  ];
  final recentDrugs = [
    "Mesna",
    "Imatinib",
    "Hydromorphone",
    "Atenolol",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    //actions for app bar
    return [
      IconButton(
          color: Color.fromRGBO(14, 100, 175, 1),
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of the app bar
    return IconButton(
        color: Color.fromRGBO(14, 100, 175, 1),
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, '');
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on selection
    last = query;
    return PostCollection();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something

    final suggestionList = query.isEmpty
        ? recentDrugs
        : drugs.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        iconColor: Colors.white,
        textColor: Colors.white,
        tileColor: Color.fromRGBO(14, 100, 175, 1),
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.medication_liquid),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.white))
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
