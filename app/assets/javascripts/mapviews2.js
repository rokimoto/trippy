
$(document).ready(function() {

  function initialize() {

    var mapOptions = {
      zoom: 8
    };

    //creates the map
    var map = new google.maps.Map(document.getElementById('map'), mapOptions);
    var bounds = new google.maps.LatLngBounds();

    $.get('http://localhost:3000/api/locations_api', function(data) {
 
      var marker_array = [];

      for (var i = 0; i < data.length; i++) {
        var mark = new google.maps.Marker({
          position: new google.maps.LatLng(data[i].latitude, data[i].longitude),
          title: data[i].name,
          animation: google.maps.Animation.DROP

        }); // close new marker

        marker_array.push(mark);
        bounds.extend(mark.position);
      } // end first for loop

      for (var x = 0; x < marker_array.length; x++) {
        var item = marker_array[x];

        var infowindow = new google.maps.InfoWindow();

        google.maps.event.addListener(item, "click", function (e) {
          console.log(item)
          var div = document.createElement('div');
          div.innerHTML = item.title;
          infowindow.setContent(div);
          div.onclick = function(){$('#showModal').modal('show')};
          infowindow.open(map, this);  // change the map variable appropriately


        }); // close add event

        item.setMap(map);
      } // close for loop


    }); // close $get
    map.fitBounds(bounds);
  } // close initialize

  google.maps.event.addDomListener(window, 'load', initialize);

}); // close document ready


//   // checks for parameters in URL
//   function getQueryVariable(variable){
//      var query = window.location.search.substring(1);
//      var vars = query.split("&");
//      for (var i=0;i<vars.length;i++) {
//              var pair = vars[i].split("=");
//              if(pair[0] == variable){return pair[1];}
//      }
//      return(false);
//   }

//   var searchTerm = getQueryVariable("search");
//   var searchType = getQueryVariable("search_type");

//   var map = new google.maps.Map(document.getElementById("map"), {
//     });


//   if (getQueryVariable("search")) {

//     if (getQueryVariable("search_type") == "Name") {

//       $.get('http://localhost:3000/api/locations_api/search_name?search=' + searchTerm, function(data) {
      

//         var marker_array = [];

//         var mark = new google.maps.Marker({
   
//           "lat": data.latitude,
//           "lng": data.longitude,
//           "picture": {
//             "url": "http://icons.iconarchive.com/icons/icons8/windows-8/16/Food-Mushroom-icon.png",
//             "width":  36,
//             "height": 36
//           }
//           // "infowindow": data.name

//         }); // end new googlemaps.Marker


//         infobox = new InfoBox({
//          content: "blahblah"
//         });
    
//         google.maps.event.addListener(mark, 'click', function() {
//           console.log("hi");
//           infobox.open(map, this);
//         });





//         marker_array.push(mark);



//         handler = Gmaps.build('Google');
//         handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
//           markers = handler.addMarkers(marker_array);
//           handler.bounds.extendWith(markers);
//           handler.fitMapToBounds();


//         }); // end handle.buildMap




//       }); // end get





//     } // end if search type is name
    
//     // else the search_type is "Location"
//     else {
//       $.get('http://localhost:3000/api/locations_api/search_location?search=' + searchTerm, function(data) {
         
//         var marker_array = [];

//         for (var i = 0; i < data.length; i++) {
//           var mark = new google.maps.Marker({
     
//           "lat": data[i].latitude,
//           "lng": data[i].longitude,
//           "picture": {
//             "url": "http://icons.iconarchive.com/icons/icons8/windows-8/16/Food-Mushroom-icon.png",
//             "width":  36,
//             "height": 36
//           },
//           "infowindow": data[i].name

//           }); // end new googlemaps.Marker



//         marker_array.push(mark);
          
//         }// end for loop

//         handler = Gmaps.build('Google');
//         handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
//           markers = handler.addMarkers(marker_array);
//           handler.bounds.extendWith(markers);
//           handler.fitMapToBounds();
//         }); // end handle.buildMap
//       }); // end get

//     }

//   } // end if searchterm


//   // else there is no search terms and render map w/ all locations
//   else {

//   $.get('http://localhost:3000/api/locations_api', function(data) {
   
//     var marker_array = [];

//     for (var i = 0; i < data.length; i++) {
//       var mark = new google.maps.Marker({
 
//       "lat": data[i].latitude,
//       "lng": data[i].longitude,
//       "picture": {
//         "url": "http://icons.iconarchive.com/icons/icons8/windows-8/16/Food-Mushroom-icon.png",
//         "width":  36,
//         "height": 36
//       },
//       "infowindow": data[i].name


//       });

//       marker_array.push(mark);
//     }

//     handler = Gmaps.build('Google');
//     handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
//       markers = handler.addMarkers(marker_array);
//       handler.bounds.extendWith(markers);
//       handler.fitMapToBounds();
//     });
//   });

//   }



// });

