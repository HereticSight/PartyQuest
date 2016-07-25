"use strict"

function initMap() {
  if ($('#new_map')) {
    var markerArray = []
    var newMap = new addLocationMap(document.getElementById( 'new_map' ), markerArray)
    newMap.init();
  };
  if ($('#index_map')) {
  }
}


// function initMap() {
//   if ($( '#map' )) {
//     var markersArray = []
//     var geocoder = new google.maps.Geocoder();
//     var map = new google.maps.Map(document.getElementById( 'map' ), {
//       center: {lat: 40.72902144999053, lng: -73.99128341814503},
//       zoom: 12,
//       clickableIcons: false,
//       mapTypeControl: false,
//       zoomControl: false,
//       streetViewControl: false
//     });
//     map.addListener('click', function(e) {
//       placeMarkerAndPanTo(e.latLng, map);
//       updateFields(e.latLng);
//     });
//     $( '#find-on-map' ).on('click', function(e) {
//       e.preventDefault();
//       geocoder.geocode({ address: $('#location_raw_address').val()}, function(results, status) {
//         if (status == google.maps.GeocoderStatus.OK) {
//           placeMarkerAndPanTo(results[0].geometry.location, map);
//         };
//       });
//     });
//   };
// };

function updateFields(latLng) {
  $('#location_latitude').val(latLng.lat())
  $('#location_longitude').val(latLng.lng())
};
