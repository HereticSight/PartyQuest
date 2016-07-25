"use strict"

var indexMap = function(mapDiv) {
  this.map = new google.maps.Map(mapDiv, {
    center: {lat: 40.72902144999053, lng: -73.99128341814503},
    zoom: 12,
    clickableIcons: false,
    mapTypeControl: false,
    zoomControl: false,
    streetViewControl: false
  });
  this.geocoder =  new google.maps.Geocoder();
  this.markerArray = []
};

indexMap.prototype.init = function() {
  this.addMarkersToMap();
  // this.addFindListener();
}

indexMap.prototype.addFindListener = function () {
  var that = this
  $( '.snap_to_map' ).on('click', function(e) {
    e.preventDefault();
    that.geocoder.geocode({ address: $('#location_raw_address').val()}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        that.map.PanTo(results[0].geometry.location);
      };
    });
  });
}

indexMap.prototype.addMarkersToMap = function () {
  var that = this
  for (var i = 0; i < locations.length; i++) {
    var marker = new google.maps.Marker({
      position: {lat: locations[i].latitude, lng: locations[i].longitude},
      map: that.map,
      title: campaigns[i].name
    });
    that.markerArray.push(marker)
  };
};
