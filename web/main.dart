// Copyright (c) 2014, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
library google_maps;

import 'dart:html';
import 'dart:js' show context, JsObject;

void main() {
  var script = new ScriptElement();
  script.async = true;
  script.src = "https://maps.googleapis.com/maps/api/js?sensor=false&callback=initialize";
  querySelector('body').children.add(script);
  void initialize() {
    final google_maps = context['google']['maps'];

        // new JsObject() constructs a new JavaScript object and returns a proxy
        // to it.
        var center = new JsObject(google_maps['LatLng'], [-34.397, 150.644]);

        var mapTypeId = google_maps['MapTypeId']['ROADMAP'];

        // new JsObject.jsify() recursively converts a collection of Dart objects
        // to a collection of JavaScript objects and returns a proxy to it.
        var mapOptions = new JsObject.jsify({
            "center": center,
            "zoom": 8,
            "mapTypeId": mapTypeId
        });

        // Nodes are passed though, or transferred, not proxied.
        new JsObject(google_maps['Map'], [querySelector('#map-canvas'), mapOptions]);
 
    }

    context['initialize'] = initialize;
  
}

void createMap(){
  final google_maps = context['google']['maps'];

    // new JsObject() constructs a new JavaScript object and returns a proxy
    // to it.
    var center = new JsObject(google_maps['LatLng'], [-34.397, 150.644]);

    var mapTypeId = google_maps['MapTypeId']['ROADMAP'];

    // new JsObject.jsify() recursively converts a collection of Dart objects
    // to a collection of JavaScript objects and returns a proxy to it.
    var mapOptions = new JsObject.jsify({
        "center": center,
        "zoom": 8,
        "mapTypeId": mapTypeId
    });

    // Nodes are passed though, or transferred, not proxied.
    new JsObject(google_maps['Map'], [querySelector('#map-canvas'), mapOptions]);
}