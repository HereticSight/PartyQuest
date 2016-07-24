"use strict"

function initMap() {
  var mapDiv = document.getElementById('map')
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 40.730610, lng: -73.935242},
    zoom: 9
  })
}
