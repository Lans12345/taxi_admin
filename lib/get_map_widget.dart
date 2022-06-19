import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:html';
import 'dart:ui' as ui;
import 'package:google_maps/google_maps.dart';

Widget getMap() {
  //A unique id to name the div element
  String htmlId = "6";
  //creates a webview in dart
  //ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
    final latLang = LatLng(8.2211277, 124.856898);
    //class to create a div element

    final mapOptions = MapOptions()
      ..zoom = 10
      ..tilt = 90
      ..zoomControl = false
      ..mapTypeControl = false
      ..fullscreenControl = false
      ..center = latLang;

    final elem = DivElement()
      ..id = htmlId
      ..style.width = "100%"
      ..style.height = "100%"
      ..style.border = "none";

    final map = GMap(elem, mapOptions);

    getData1(map);

    return elem;
  });
  //creates a platform view for Flutter Web
  return HtmlElementView(
    viewType: htmlId,
  );
}

getData1(map) async {
  // Use provider
  var collection = FirebaseFirestore.instance
      .collection('driver')
      .where('status', isEqualTo: 'driver');

  var querySnapshot = await collection.get();

  for (var queryDocumentSnapshot in querySnapshot.docs) {
    Map<String, dynamic> data = queryDocumentSnapshot.data();
    final latLang = LatLng(data['latitude'], data['longitude']);
    Marker(MarkerOptions()
      ..position = latLang
      ..map = map
      ..clickable = true
      ..title = data['firstName'] + ' ' + data['lastName']);
  }
}
