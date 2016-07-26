"use strict"

var addLocationMap = function(mapDiv, markerArray) {
  var styleArray = [
    {
      featureType: "all",
      stylers: [
        { saturation: -80 }
      ]
    },{
      featureType: "road.arterial",
      elementType: "geometry",
      stylers: [
        { hue: "#00ffee" },
        { saturation: 50 }
      ]
    },{
      featureType: "water",
      elementType: "all",
      stylers: [
        { hue: "#EBE6C9" }
      ]
    }
  ];
  this.map = new google.maps.Map(mapDiv, {
    center: {lat: 40.72902144999053, lng: -73.99128341814503},
    zoom: 12,
    styles: styleArray,
    clickableIcons: false,
    mapTypeControl: false,
    zoomControl: false,
    streetViewControl: false
  });
  this.geocoder =  new google.maps.Geocoder();
  this.markerArray = markerArray
};

addLocationMap.prototype.init = function() {
  this.addMarkerListener();
  this.addFindListener();
}

addLocationMap.prototype.addMarkerListener = function() {
  var that = this
  that.map.addListener('click', function(e) {
    that.placeMarkerAndPanTo(e.latLng);
    updateFields(e.latLng);
  });
};

addLocationMap.prototype.addFindListener = function () {
  var that = this
  $( '#find-on-map' ).on('click', function(e) {
    e.preventDefault();
    that.geocoder.geocode({ address: $('#location_raw_address').val()}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        that.placeMarkerAndPanTo(results[0].geometry.location);
      };
    });
  });
}

addLocationMap.prototype.placeMarkerAndPanTo = function(latLng) {
  while (this.markerArray.length) {
    this.markerArray.pop().setMap(null)
  }
  var marker = new google.maps.Marker({
    position: latLng,
    map: this.map
  })
  this.map.panTo(latLng);
  this.markerArray.push(marker);
};
