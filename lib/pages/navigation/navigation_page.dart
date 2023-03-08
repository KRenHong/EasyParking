import 'package:easyparking/pages/navigation/blocs/application_bloc.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';


class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key : key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {

  @override
  void initState() {
    // TODO: implement initState
    final applicationBloc = Provider.of<ApplicationBloc>(context, listen: false);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);

    return Scaffold(
      body:(applicationBloc.currentLocation == null) 
          ? Center(
              child: CircularProgressIndicator(),
              )
      : Stack(
        children: [
          
        GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        initialCameraPosition: 
          CameraPosition(target: LatLng(applicationBloc.currentLocation.latitude, applicationBloc.currentLocation.longitude),
          zoom: 14),
      ),


      Container(
        margin: const EdgeInsets.only(top: 70 ,left: 30.0, right: 30.0),
        child: const TextField(
          obscureText: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
            labelText: 'Search here',
          ),
        )
      )
        ],
      )
    );
  }

}