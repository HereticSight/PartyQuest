"use strict"

var indexMap = function(mapDiv) {
  this.geocoder =  new google.maps.Geocoder();
  this.map = new google.maps.Map(mapDiv, {
    center: {lat: 40.72902144999053, lng: -73.99128341814503},
    zoom: 12,
    clickableIcons: false,
    mapTypeControl: false,
    zoomControl: false,
    streetViewControl: false
  });
  this.markerArray = []
};

indexMap.prototype.init = function() {
  this.addMarkersToMap();
  this.addSnapToListener();
}

indexMap.prototype.addSnapToListener = function () {
  var that = this
  $( '.info_link' ).on('click', function(e) {
    e.preventDefault();
    var address = $( this ).text();
    that.geocoder.geocode({address: address}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        that.map.panTo(results[0].geometry.location);
      };
    });
  });
};

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
