import 'dart:math';
import 'package:final_project_app/pages/http_service.dart';
import 'package:final_project_app/pages/post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:final_project_app/pages/homepage.dart';

import '../sidebar/sidebar_layout.dart';

class PostCollection extends StatelessWidget {
  static bool Statuse1 = false;
  static bool Statuse2 = true;
  static String filter = " ";
  static String display = " ";
  const PostCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostCollectionPage(),
    );
  }
}

class PostCollectionPage extends StatefulWidget {
  const PostCollectionPage({Key? key}) : super(key: key);

  @override
  _PostCollectionPageState createState() => _PostCollectionPageState();
}

class _PostCollectionPageState extends State<PostCollectionPage> {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // Center(
            //   child: Text(
            //     "FIlters",
            //     style: TextStyle(color: Colors.blueGrey[900]),
            //   ),
            // ),
            Card(
              color: Color.fromRGBO(51, 83, 176, 1),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              primary: Color.fromRGBO(51, 83, 176, 1),
                              side: BorderSide(width: 3, color: Colors.white)),
                          onPressed: () {
                            PostCollection.Statuse2 = true;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PostCollection()),
                            );
                          },
                          child: Text(
                            "All",
                            style: TextStyle(color: Colors.white),
                          )),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              primary: Color.fromRGBO(51, 83, 176, 1),
                              side: BorderSide(width: 3, color: Colors.white)),
                          onPressed: () {
                            PostCollection.Statuse2 = false;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PostCollection()),
                            );
                          },
                          child: Text(
                            "Open",
                            style: TextStyle(color: Colors.white),
                          )),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              primary: Color.fromRGBO(51, 83, 176, 1),
                              side: BorderSide(width: 3, color: Colors.white)),
                          onPressed: () {
                            PostCollection.filter = " ";
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PostCollection()),
                            );
                          },
                          child: Text(
                            "Distance",
                            style: TextStyle(color: Colors.white),
                          )),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              primary: Color.fromRGBO(51, 83, 176, 1),
                              side: BorderSide(width: 3, color: Colors.white)),
                          onPressed: () {
                            PostCollection.filter = "price";
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PostCollection()),
                            );
                          },
                          child: Text(
                            "Price",
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: FutureBuilder(
                future: httpService.getPosts(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
                  if (snapshot.hasData) {
                    List<Post>? posts = snapshot.data;

                    //calculate distance
                    List<dynamic> distances = <dynamic>[];
                    List<dynamic> prices = <dynamic>[];

                    double calculateDistance(currlat, currlong, latp, longp) {
                      var p = 0.017453292519943295;
                      var c = cos;
                      var a = 0.5 -
                          c((latp - currlat) * p) / 2 +
                          c(currlat * p) *
                              c(latp * p) *
                              (1 - c((longp - currlong) * p)) /
                              2;
                      return 12742 * asin(sqrt(a));
                    }

                    for (int i = 0; i < posts!.length; i++) {
                      distances.add(calculateDistance(
                          HomePage.currentlat,
                          HomePage.currentlong,
                          posts[i].latitude,
                          posts[i].longitude));
                      if (posts[i].open == PostCollection.Statuse1 &&
                          PostCollection.Statuse2 == false) {
                        distances[i] = 1000000000000000000;
                      }
                    }
                    for (int j = 0; j < posts.length; j++) {
                      prices.add(posts[j].price);
                      if (posts[j].open == PostCollection.Statuse1 &&
                          PostCollection.Statuse2 == false) {
                        prices[j] = 1000000000000000000;
                      }
                      //print(Statuse2.toString());
                    }
                    var indexdistance =
                        distances.indexOf(distances.cast<num>().reduce(min));
                    distances[indexdistance] = 1000000000000000000;

                    var indexdistance2 =
                        distances.indexOf(distances.cast<num>().reduce(min));
                    distances[indexdistance2] = 1000000000000000000;

                    var indexdistance3 =
                        distances.indexOf(distances.cast<num>().reduce(min));

                    var indexprice =
                        prices.indexOf(prices.cast<num>().reduce(min));
                    prices[indexprice] = 1000000000000000000;

                    var indexprice2 =
                        prices.indexOf(prices.cast<num>().reduce(min));
                    prices[indexprice2] = 1000000000000000000;

                    var indexprice3 =
                        prices.indexOf(prices.cast<num>().reduce(min));
                    var nameBydistance = [
                      posts[indexdistance].pharmacyName,
                      posts[indexdistance2].pharmacyName,
                      posts[indexdistance3].pharmacyName,
                    ];
                    var nameByPrice = [
                      posts[indexprice].pharmacyName,
                      posts[indexprice2].pharmacyName,
                      posts[indexprice3].pharmacyName,
                    ];

                    var latitudeBydistance = [
                      posts[indexdistance].latitude,
                      posts[indexdistance2].latitude,
                      posts[indexdistance3].latitude,
                    ];
                    var latitudeByPrice = [
                      posts[indexprice].latitude,
                      posts[indexprice2].latitude,
                      posts[indexprice3].latitude,
                    ];
                    var longitudeBydistance = [
                      posts[indexdistance].longitude,
                      posts[indexdistance2].longitude,
                      posts[indexdistance3].longitude,
                    ];
                    var longitudeByPrice = [
                      posts[indexprice].longitude,
                      posts[indexprice2].longitude,
                      posts[indexprice3].longitude,
                    ];
                    var priceBydistance = [
                      posts[indexdistance].price,
                      posts[indexdistance2].price,
                      posts[indexdistance3].price,
                    ];
                    var priceByPrice = [
                      posts[indexprice].price,
                      posts[indexprice2].price,
                      posts[indexprice3].price,
                    ];

                    var pharmacyNameList = nameBydistance;
                    var longitudeList = longitudeBydistance;
                    var latitudeList = latitudeBydistance;
                    var priceList = priceBydistance;
                    if (PostCollection.filter == "price") {
                      pharmacyNameList = nameByPrice;
                      longitudeList = longitudeByPrice;
                      latitudeList = latitudeByPrice;
                      priceList = priceByPrice;
                    }

                    //add markers
                    if (pharmacyNameList.length != 0) {
                      return ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                showDialogFunc(
                                    context,
                                    latitudeList[index],
                                    longitudeList[index],
                                    pharmacyNameList[index]);
                              },
                              child: Card(
                                color: Colors.white,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 100,
                                      height: 100,
                                      child:
                                          Image.asset("assets/direction.png"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            pharmacyNameList[index],
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color.fromRGBO(
                                                  51, 83, 176, 1),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: width,
                                            child: Text(
                                              "price: " +
                                                  priceList[index].toString() +
                                                  " birr",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Color.fromRGBO(
                                                    51, 83, 176, 1),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    } else {
                      return Center(
                        child: Text("No results found"),
                      );
                    }
                  }

                  return Center(
                      child: CircularProgressIndicator(
                    color: Color.fromRGBO(51, 83, 176, 1),
                  ));
                },
              ),
            ),
          ],
        ));
  }
}

showDialogFunc(context, latitude, longitude, pharmacName) {
  List<Marker> _markers = <Marker>[];
  _markers.add(Marker(
      markerId: MarkerId('1'),
      position: LatLng(latitude, longitude),
      infoWindow: InfoWindow(title: pharmacName)));

  LatLng _kMapCenter = LatLng(latitude, longitude);
  CameraPosition _kInitialPosition = CameraPosition(
    target: _kMapCenter,
    zoom: 16.0,
  );

  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: Color.fromRGBO(51, 83, 176, 1),
            title: Text(
              pharmacName,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "Serif"),
            ),
            content: GoogleMap(
              initialCameraPosition: _kInitialPosition,
              markers: Set<Marker>.of(_markers),
              mapType: MapType.hybrid,
              myLocationEnabled: true,
            ),
            actions: [
              Text(
                "press the marker and use google maps direction to reach the pharmacy",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "serif"),
              ),
              SizedBox(
                height: 4,
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () => Navigator.pop(context, false),
                child: Center(
                    child: Text(
                  'go back to list/change filters',
                  style: TextStyle(
                    color: Color.fromRGBO(51, 83, 176, 1),
                    fontWeight: FontWeight.bold,
                    fontFamily: "serif",
                  ),
                )),
              ),
              // TextButton(
              //     onPressed: () {
              //       Navigator.of(context).push(MaterialPageRoute(
              //           builder: (context) => SideBarLayout()));
              //     },
              //     child: Text(
              //       'change filters',
              //       style: TextStyle(
              //           color: Color.fromRGBO(51, 83, 176, 1),
              //           fontStyle: FontStyle.italic,
              //           fontWeight: FontWeight.bold),
              //     ))
            ],
          )
      // builder: (context) {
      //   return Center(
      //     child: Material(
      //       type: MaterialType.transparency,
      //       child: Container(
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(10),
      //           color: Colors.white,
      //         ),
      //         padding: EdgeInsets.all(15),
      //         width: MediaQuery.of(context).size.width * 0.7,
      //         height: 400,
      //         child: Expanded(
      //             child: Container(
      //           color: Colors.blueGrey[900],
      //           child: GoogleMap(
      //             initialCameraPosition: _kInitialPosition,
      //             markers: Set<Marker>.of(_markers),
      //             mapType: MapType.hybrid,
      //             myLocationEnabled: true,
      //           ),
      //         )),
      //       ),
      //     ),
      //   );
      // }
      );
}
