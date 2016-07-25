"use strict"

var markersArray = []

function initMap() {
  if ($( '#map' )) {
    var geocoder = new google.maps.Geocoder();
    var map = new google.maps.Map(document.getElementById( 'map' ), {
      center: {lat: 40.72902144999053, lng: -73.99128341814503},
      zoom: 12,
      clickableIcons: false
    });
    map.addListener('click', function(e) {
      placeMarkerAndPanTo(e.latLng, map);
      updateFields(e.latLng);
      // geocoder.geocode({location: e.latLng}, function(results, status) {
      //   if (status === google.maps.GeocoderStatus.OK) {
      //     $( '#location_raw_address' ).val(results[0].formatted_address)
      //   };
      // });
    });
    $( '#find-on-map' ).on('click', function(e) {
      e.preventDefault();
      geocoder.geocode({ address: $('#location_raw_address').val()}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          placeMarkerAndPanTo(results[0].geometry.location, map);
        };
      });
    });
  } else if ($( '#index_map' )) {
      var index_map = new google.maps.Map(document.getElementById( 'index_map' ), {
        center: {lat: 40.72902144999053, lng: -73.99128341814503},
        zoom: 12,
        clickableIcons: false
    });
  };
};

function placeMarkerAndPanTo(latLng, map) {
  while (markersArray.length) {
    markersArray.pop().setMap(null)
  }
  var marker = new google.maps.Marker({
    position: latLng,
    map: map
  })
  map.panTo(latLng);
  markersArray.push(marker);
};

function updateFields(latLng) {
  $('#location_latitude').val(latLng.lat())
  $('#location_longitude').val(latLng.lng())
};
