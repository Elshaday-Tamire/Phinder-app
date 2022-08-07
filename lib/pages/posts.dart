import 'dart:math';
import 'package:final_project_app/pages/http_service.dart';
import 'package:final_project_app/pages/post_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:final_project_app/pages/homepage.dart';

class PostsPage extends StatelessWidget {
  final HttpService httpService = HttpService();
  static bool Statuse1 = false;
  static bool Statuse2 = true;
  static String filter = " ";
  static String display = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: httpService.getPosts(),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            if (snapshot.hasData) {
              List<Marker> _markers = <Marker>[];
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
                distances.add(calculateDistance(HomePage.currentlat,
                    HomePage.currentlong, posts[i].latitude, posts[i].longitude));
                if(posts[i].open==Statuse1 && Statuse2==false)
                {
                  distances[i]=1000000000000000000;
                }
              }
              for (int j = 0; j < posts.length; j++) {
                prices.add(posts[j].price);
                if(posts[j].open==Statuse1 && Statuse2==false)
                  {
                    prices[j]=1000000000000000000;
                  }
                //print(Statuse2.toString());
              }
              var indexdistance =
              distances.indexOf(distances.cast<num>().reduce(min));
              distances[indexdistance]=1000000000000000000;

              var indexdistance2=distances.indexOf(distances.cast<num>().reduce(min));
              distances[indexdistance2]=1000000000000000000;

              var indexdistance3=distances.indexOf(distances.cast<num>().reduce(min));
              print(posts[indexdistance3].pharmacyName);

              var indexprice = prices.indexOf(prices.cast<num>().reduce(min));

              //add markers
              _markers.add(Marker(
                  markerId: MarkerId('1'),
                  position: LatLng(posts[indexdistance].latitude,
                      posts[indexdistance].longitude),
                  infoWindow:
                  InfoWindow(title: posts[indexdistance].pharmacyName)));

              LatLng _kMapCenter = LatLng(
                  posts[indexdistance].latitude, posts[indexdistance].longitude);
              CameraPosition _kInitialPosition = CameraPosition(
                target: _kMapCenter,
                zoom: 20.0,
              );
              display =
                  posts[indexdistance].pharmacyName + " is the closest pharmacy";
              if (filter == "price") {
                display = posts[indexprice].pharmacyName + " has the least price";
                _markers.add(Marker(
                    markerId: MarkerId('1'),
                    position: LatLng(
                        posts[indexprice].latitude, posts[indexprice].longitude),
                    infoWindow:
                    InfoWindow(title: posts[indexprice].pharmacyName)));
                _kMapCenter = LatLng(
                    posts[indexprice].latitude, posts[indexprice].longitude);
                _kInitialPosition = CameraPosition(
                  target: _kMapCenter,
                  zoom: 20.0,
                );
              }
              return SafeArea(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          height: 100,
                          color: Colors.blueGrey[900],
                          child: Center(
                            child: Text(
                              display,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                              color: Colors.blueGrey[900],
                              child: GoogleMap(
                                initialCameraPosition: _kInitialPosition,
                                markers: Set<Marker>.of(_markers),
                              ),
                            ))
                      ]));
            }

            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
