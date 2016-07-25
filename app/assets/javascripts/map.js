"use strict"

function initNewMap() {
  var markerArray = []
  var newMap = new addLocationMap(document.getElementById( 'new_map' ), markerArray)
  newMap.init();
}

function initIndexMap() {
    var recentMarkerArray = []
    var indexMap = new addLocationMap(document.getElementById( 'index_map' ), recentMarkerArray)
}

function updateFields(latLng) {
  $('#location_latitude').val(latLng.lat())
  $('#location_longitude').val(latLng.lng())
};
