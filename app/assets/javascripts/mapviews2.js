$(document).ready(function() {

  // creates the content within the modal
  function fillModal(name, id, yelp_id) {
    $('#myModalLabel').text(name);
    $('#like_location_id').val(id);
    $("#addReviewButton").attr("href", "/locations/" + id)

    // modalContent is the granddaddy of the modal content
    var modalContent = "";

    /*** This will get filled by yelp content ***/
    var yelpContent = "";

    /*** This is overwritten if a review is present ***/
    var eachReviewContent = "";

    /*** This is the div that holds all the images ***/
    var imageGallery = "<div class='imageGallery'>";

    // pulls data from yelp api
    $.get('/api/locations_api/yelp/' + yelp_id, function(data) {
      console.log(data);

      /*** phone number ***/
      yelpContent = "<div>Phone: ";
      yelpContent += data.display_phone || "not available";
      yelpContent +=  "</div>";

      /*** categories ***/
      yelpContent+= "<div>Categories: ";
      for (var i = 0; i < data.categories.length; i++) {
        yelpContent += data.categories[i][0];
        if (i != data.categories.length -1 ) {
          yelpContent += ", ";
        }
      }
      yelpContent += "</div>"; 
    
    }); // close yelp get

    $.get('/api/locations_api/reviews/' + id, function(data) {
      $.each(data, function(index, item) {
        var ratingNum = parseInt(item.rating);
      
        /*** reviewer's name ***/
        eachReviewContent += "<div>Name: " + item.user_name + "</div>";

        /*** review rating as stars ***/
        eachReviewContent += "<div>Rating: ";
        for(var i = 0; i < ratingNum; i++) {
          eachReviewContent += "<span class='glyphicon glyphicon-star'></span>";
        }
        eachReviewContent += "</div>";

        /*** review content ***/
        eachReviewContent += String("<div>Content: " + item.content + "</div>");


        /*** pushes photo to image gallery ***/
        if(item.photo.url) {
          imageGallery += String("<div><img class='img-rounded' src=" + item.photo.url + "></div>");
        }
        
      }); // close .each

      /*** closes image gallery div ***/
      imageGallery += "</div>";

      /*** states there is no reviews if there is no reviews ***/
      if(eachReviewContent === "") {
        eachReviewContent =+ "<div>No reviews yet!</div>";
      }

      // appends each content section and displays it in the modal
      modalContent += yelpContent;
      modalContent += imageGallery;
      modalContent += eachReviewContent;
      $('#myModalBody').html(modalContent);

    }); // close reviews get
    
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
        icon: "/assets/mush-icon-red.svg",
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

      // 
      google.maps.event.addListener(item, "click", function (e) {
        var id = this.id;
        var yelp_id = this.yelp_id;
        var name = this.title;
        var div = document.createElement('div');
        div.innerHTML = "<div class='iw-title'>" + this.title + "</div><div class='iw-content'><strong>Click Again</strong> to See the Location</div>";
        infowindow.setContent(div);
        div.onclick = function(){
          fillModal(name, id, yelp_id);
          $('#showModal').modal('show')
        };
        infowindow.open(map, this);  

      }); // close add event

      item.setMap(map);
    } // close 2nd for loop
        map.fitBounds(bounds);

  } // close makeMap

  // makes modal pop up for nearby locations
  $('.location_panel li').on("click", function() {
    var name = $(this).text();
    var id = $(this).attr('id');
    fillModal(name, id);
    $('#showModal').modal('show')
  })


}); // close document ready
