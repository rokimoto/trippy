$(document).ready(function() {

  // creates the content within the modal
  function fillModal(name, id, yelp_id) {
    $('#myModalLabel').text(name);
    var reviewContent = "";
    // pulls data from yelp api
    $.get('/api/locations_api/yelp/' + yelp_id, function(data) {
      console.log(data);
      reviewContent += new String("<div>Phone: " + data.display_phone + "</div><div>Categories: ")
      for (var i = 0; i < data.categories.length; i++) {
        reviewContent += data.categories[i][0]
        if (i != data.categories.length -1 ) {
          reviewContent += ", "
        }
      }
      reviewContent += "</div>";
    });
    $.get('/api/locations_api/reviews/' + id, function(data) {
      $.each(data, function(index, item) {
        var ratingNum = parseInt(item.rating)
        var eachReviewContent = "<div>Name: " + item.user_name + "</div><div>Rating: "
        for(var i = 0; i < ratingNum; i++) {
          eachReviewContent += "<span class='glyphicon glyphicon-star'></span>"
        } 
        eachReviewContent += "</div>";
        if(item.photo.url) {
          eachReviewContent += new String("<div><img src=" + item.photo.url + "></div>");
        }
        eachReviewContent += new String("<div>Content: " + item.content + "</div>");
        reviewContent += eachReviewContent;

      });
    $('#myModalBody').html(reviewContent);
    });
  }

  // gets the parameters of the search string
  function getQueryVariable(variable){
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i=0;i<vars.length;i++) {
     var pair = vars[i].split("=");
     if(pair[0] == variable){return pair[1];}
    }
    return(false);
  }

  // gets search term
  var searchTerm = getQueryVariable("search");
  // gets search type (either name or location)
  var searchType = getQueryVariable("search_type");



  // initializes the google map
  function initialize() {

    // if a search term is present
    if(searchTerm) {
      // if user is searching by name
      if (searchType == 'Name') {
        $.get('/api/locations_api/search_name?search=' + searchTerm, function(data) {
          makeMap(data);
        });
      }
      // else the user is searching by location
      else {
        $.get('/api/locations_api/search_location?search=' + searchTerm, function(data) {
          makeMap(data);
         });
      }
    }
    // else no search term is present and all locations are rendered
    else {
      $.get('/api/locations_api', function(data) {
        makeMap(data);
      }); 
    }

  } // close initialize

  // initializes map on window load
  google.maps.event.addDomListener(window, 'load', initialize);


  // builds the map according to data
  function makeMap(data) {
    var mapOptions = {
      zoom: 8
    };

    //creates the map
    var map = new google.maps.Map(document.getElementById('map'), mapOptions);
    var bounds = new google.maps.LatLngBounds();

    console.log(data);
    var marker_array = [];

    for (var i = 0; i < data.length; i++) {
      var mark = new google.maps.Marker({
        position: new google.maps.LatLng(data[i].latitude, data[i].longitude),
        title: data[i].name,
        id: data[i].id,
        yelp_id: data[i].yelp_id,
        icon: "http://icons.iconarchive.com/icons/icons8/windows-8/16/Food-Mushroom-icon.png",
        animation: google.maps.Animation.DROP

      }); // close new marker

      marker_array.push(mark);
      bounds.extend(mark.position);
    } // end first for loop

    // attaches event listeners to each infowindow
    for (var x = 0; x < marker_array.length; x++) {
      var item = marker_array[x];

      var infowindow = new google.maps.InfoWindow({
        
      });

      google.maps.event.addListener(item, "click", function (e) {
        var id = this.id;
        var yelp_id = this.yelp_id;
        var name = this.title;
        var div = document.createElement('div');
        div.innerHTML = "<div class='iw-title'>" + this.title + "</div><div class='iw-content'>If you want content it goes here</div>";
        infowindow.setContent(div);
        div.onclick = function(){
          fillModal(name, id, yelp_id);
          $('#showModal').modal('show')
        };
        infowindow.open(map, this);  // change the map variable appropriately

      }); // close add event

      item.setMap(map);
    } // close 2nd for loop
        map.fitBounds(bounds);
        
  } // close makeMap


  $('.location_panel li').on("click", function() {
    var name = $(this).text();
    var id = $(this).attr('id');
    fillModal(name, id);
    $('#showModal').modal('show')
  })


}); // close document ready
