<%-- 
    Document   : map
    Created on : Jan 8, 2015, 7:47:21 PM
    Author     : vagelis_pc
--%>

<!DOCTYPE HTML>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/csstest.css" />
<title>Map</title>
    <!-- Google Maps and Places API -->
	<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?libraries=places&sensor=false"></script>
    
    <!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript">
    function initGeolocation()
    {
            if( navigator.geolocation )
            {

              // Call getCurrentPosition with success and failure callbacks
              navigator.geolocation.getCurrentPosition( success, fail );
        }
        else
        {
              alert("Sorry, your browser does not support geolocation services.");
        }
    }

     var map;
     function success(position)
     {
           // Define the coordinates as a Google Maps LatLng Object
           var coords = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);

           // Prepare the map options
           var mapOptions =
          {
                      zoom: 14,
                      center: coords,
                      mapTypeControl: false,
                      navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL},
                      mapTypeId: google.maps.MapTypeId.ROADMAP
            };

            // Create the map, and place it in the map_canvas div
            map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
			
			
			placesRequest('Tsipouro',coords,5000,['liquor_store',''],'image/wine47.png');


            
            var marker = new google.maps.Marker({
                      position: coords,
                      map: map,
                      title: "Your current location!"
            });
			
        }

        function fail()
        {
              // Could not obtain location
        }
		
		//Request places from Google
		function placesRequest(title,latlng,radius,types,icon)
		{
			//Parameters for our places request
			var request = {
				location: latlng,
				radius: radius,
				types: types
			};
			//Make the service call to google
			var callPlaces = new google.maps.places.PlacesService(map);
			callPlaces.search(request, function(results,status){
				//trace what Google gives us back
				$.each(results, function(i,place){
					var placeLoc = place.geometry.location;
					 var thisplace = new google.maps.Marker({
						 map: map,
						 position: place.geometry.location,
						 icon: icon,
						 title: place.name
					 });
				})
			});
			
		}
		
	
        </script>
</head>
<body onload="initGeolocation();">
    
        
    <div style="position:absolute; width:380px; height: 100%; overflow:auto; float:left; padding-left:10px; padding-right:10px;">
        <h1>Map</h1>
      
    </div>
    <!-- map div container -->
    
<div id="map_canvas" style="height:500px; margin-left:400px; border-right: 1px solid #666666; border-bottom: 1px solid #666666; border-top: 1px solid #AAAAAA; border-left: 1px solid #AAAAAA;"></div>

        <div id="footer">
            <h8> Designed by Vagelis Apostolidis  &copy 2015 </h8>
        </div>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>   
   <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>
