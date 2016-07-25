"use strict"

var newMap = function(mapDiv,markerArray) {
  this.map = new google.maps.Map(mapDiv , {
    center: {lat: 40.72902144999053, lng: -73.99128341814503},
    zoom: 12,
    clickableIcons: false
  });
  this.geocoder =  new google.maps.Geocoder();
  this.marker_array = markerArray
  this.init();
};

newMap.prototype.init = function() {
  this.map.addListener('click', function(e) {
    placeMarkerAndPanTo(e.latLng, this.map);
    updateFields(e.latLng);
  });
  $( '#find-on-map' ).on('click', function(e) {
    e.preventDefault();
    this.geocoder.geocode({ address: $('#location_raw_address').val()}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        placeMarkerAndPanTo(results[0].geometry.location, map);
      };
    });
  });
}
