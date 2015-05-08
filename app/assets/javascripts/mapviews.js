
$(document).ready(function() {

$.get('http://localhost:3000/api/locations_api', function(data) {
 
    var marker_array = []

    for (var i = 0; i < data.length; i++) {
      var mark = new google.maps.Marker({
 
      "lat": data[i].latitude,
      "lng": data[i].longitude,
      "picture": {
        "url": "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
        "width":  36,
        "height": 36
      },
      "infowindow": data.name


      });

      marker_array.push(mark);
    }



  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers(marker_array);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });
});






});

