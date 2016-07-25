"use strict"

function initNewMap() {
  var markerArray = []
  var newMap = new addLocationMap(document.getElementById( 'new_map' ), markerArray)
  newMap.init();
}

function initIndexMap() {
  var recentMap = new indexMap(document.getElementById( 'index_map' ))
  recentMap.init();
}

function updateFields(latLng) {
  $('#location_latitude').val(latLng.lat())
  $('#location_longitude').val(latLng.lng())
};
