<!DOCTYPE html>
<html>
<head>
<title>Google Map</title>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDzFqtGZT1r_cg23MfeotGCizH8bDvoVYs&sensor=false"></script>
<script type="text/javascript">


$(document).ready(function(){  
    var gmarkers = [];
    // this variable will collect the html which will eventually be placed in the side_bar
    var side_bar_html = "";
    var mapCenter = new google.maps.LatLng(47.6145, -122.3418); //Google map Coordinates
    var map;
    var infowindow = new google.maps.InfoWindow();
    map_initialize(); // initialize google map

    //############### Google Map Initialize ##############
    function map_initialize()
    {
            var googleMapOptions =
            {
                center: mapCenter, // map center
                zoom: 17, //zoom level, 0 = earth view to higher value
                maxZoom: 18,
                minZoom: 16,
                zoomControlOptions: {
                style: google.maps.ZoomControlStyle.SMALL //zoom control size
            },
                scaleControl: true, // enable scale control
                mapTypeId: google.maps.MapTypeId.ROADMAP // google map type
            };
       
            map = new google.maps.Map(document.getElementById("google_map"), googleMapOptions);        
           
            //Load Markers from the XML File, Check (map_process.php)
            $.get("map_process.php", function (data) {
                $(data).find("marker").each(function () {
                      var name      = $(this).attr('name');
                      var address   = '<p>'+ $(this).attr('address') +'</p>';
                      var type      = $(this).attr('type');
                      var point     = new google.maps.LatLng(parseFloat($(this).attr('lat')),parseFloat($(this).attr('lng')));
                      create_marker(point, name, address, type, false, false, false, "icons/pin_blue.png");
                });
            });
           
            //Right Click to Drop a New Marker
            google.maps.event.addListener(map, 'rightclick', function(event) {
                //Edit form to be displayed with new marker
                var EditForm = '<p><div class="marker-edit">'+
                '<form action="ajax-save.php" method="POST" name="SaveMarker" id="SaveMarker">'+
                '<label for="pName"><span>Place Name :</span><input type="text" name="pName" class="save-name" placeholder="Enter Title" maxlength="40" /></label>'+
                '<label for="pDesc"><span>Description :</span><textarea name="pDesc" class="save-desc" placeholder="Enter Address" maxlength="150"></textarea></label>'+
                '<label for="pType"><span>Type :</span> <select name="pType" class="save-type"><option value="restaurant">Restaurant</option><option value="bar">Bar</option>'+
                '<option value="house">House</option></select></label>'+
                '</form>'+
                '</div></p><button name="save-marker" class="save-marker">Save Marker Details</button>';
                //Drop a new Marker with our Edit Form
                create_marker(event.latLng, 'New Marker', EditForm, '', true, true, true, "pin_green.png");
            });
           
             show("resturant");
             hide("bar");
             hide("house");
            // == create the initial sidebar ==
             makeSidebar();
    }

    //############### Create Marker Function ##############
    function create_marker(MapPos, MapTitle, MapDesc, type, InfoOpenDefault, DragAble, Removable, iconPath)
    {                
        //new marker
        var marker = new google.maps.Marker({
            position: MapPos,
            map: map,
            draggable:DragAble,
            animation: google.maps.Animation.DROP,
            title:"Hello World!",
            icon: iconPath
        });
       
        // === Store the category and name info as a marker properties ===
        marker.mycategory = type;                                
        marker.myname = MapTitle;
        gmarkers.push(marker);

        //Content structure of info Window for the Markers
        var contentString = $('<div class="marker-info-win">'+
        '<div class="marker-inner-win"><span class="info-content">'+
        '<h1 class="marker-heading">'+MapTitle+'</h1>'+
        MapDesc+ '<br />Type :'+type +'<br />'+
        '</span><button name="remove-marker" class="remove-marker" title="Remove Marker">Remove Marker</button>'+
        '</div></div>');  

       
        //set the content of infoWindow
        infowindow.setContent(contentString[0]);
        //Find remove button in infoWindow
        var removeBtn   = contentString.find('button.remove-marker')[0];
        var saveBtn     = contentString.find('button.save-marker')[0];

        //add click listner to remove marker button
        google.maps.event.addDomListener(removeBtn, "click", function(event) {
            remove_marker(marker);
        });
       
        if(typeof saveBtn !== 'undefined') //continue only when save button is present
        {
            //add click listner to save marker button
            google.maps.event.addDomListener(saveBtn, "click", function(event) {
                var mReplace = contentString.find('span.info-content'); //html to be replaced after success
                var mName = contentString.find('input.save-name')[0].value; //name input field value
                var mDesc  = contentString.find('textarea.save-desc')[0].value; //description input field value
                var mType = contentString.find('select.save-type')[0].value; //type of marker
               
                if(mName =='' || mDesc =='')
                {
                    alert("Please enter Name and Description!");
                }else{
                    save_marker(marker, mName, mDesc, mType, mReplace); //call save marker function
                }
            });
        }
       
        //add click listner to save marker button        
        google.maps.event.addListener(marker, 'click', function() {
                infowindow.open(map,marker); // click on marker opens info window
        });
         
        if(InfoOpenDefault) //whether info window should be open by default
        {
          infowindow.open(map,marker);
        }
        makeSidebar();
    }    
   
    //############### Remove Marker Function ##############
    function remove_marker(Marker)
    {
        /* determine whether marker is draggable
        new markers are draggable and saved markers are fixed */
        if(Marker.getDraggable())
        {
            Marker.setMap(null); //just remove new marker
        }
        else
        {
            //Remove saved marker from DB and map using jQuery Ajax
            var mLatLang = Marker.getPosition().toUrlValue(); //get marker position
            var myData = {del : 'true', latlang : mLatLang}; //post variables
            $.ajax({
              type: "POST",
              url: "map_process.php",
              data: myData,
              success:function(data){
                    Marker.setMap(null);
                    alert(data);
                },
                error:function (xhr, ajaxOptions, thrownError){
                    alert(thrownError); //throw any errors
                }
            });
        }

    }
   
    //############### Save Marker Function ##############
    function save_marker(Marker, mName, mAddress, mType, replaceWin)
    {
        //Save new marker using jQuery Ajax
        var mLatLang = Marker.getPosition().toUrlValue(); //get marker position
        var myData = {name : mName, address : mAddress, latlang : mLatLang, type : mType }; //post variables
        console.log(replaceWin);      
        $.ajax({
          type: "POST",
          url: "map_process.php",
          data: myData,
          success:function(data){
                replaceWin.html(data); //replace info window with new html
                Marker.setDraggable(false); //set marker to fixed
                Marker.setIcon('pin_blue.png'); //replace icon
            },
            error:function (xhr, ajaxOptions, thrownError){
                alert(thrownError); //throw any errors
            }
        });
    }
   
   
    // == a checkbox has been clicked ==
    $(".check-box").click(function(event){
          var type = $(this).attr("data-type");
            if (this.checked) {
              show(type);
            } else {
              hide(type);
            }
            // == rebuild the side bar
            makeSidebar();

    });
     
      // == shows all markers of a particular category, and ensures the checkbox is checked ==
      function show(type) {
          for (var i=0; i<gmarkers.length; i++) {
          if (gmarkers[i].mycategory == type) {
            gmarkers[i].setVisible(true);
          }
        }
      }

      // == hides all markers of a particular category, and ensures the checkbox is cleared ==
      function hide(type) {

        for (var i=0; i<gmarkers.length; i++) {
          if (gmarkers[i].mycategory == type) {
            gmarkers[i].setVisible(false);
          }
        }
        infowindow.close();
      }
     
    $( "#side_bar" ).on( "click","a.myclick", function() {
        var i = $(this).attr("data-loc");
        google.maps.event.trigger(gmarkers[i],"click");
    });

            // == rebuilds the sidebar to match the markers currently displayed ==
      function makeSidebar() {
        var html = "";
        for (var i=0; i<gmarkers.length; i++) {
          if (gmarkers[i].getVisible()) {
            html += '<a href="#" class="myclick" data-loc="'+i+'">' + gmarkers[i].myname + '<\/a><br />';
          }
        }
        $("#side_bar").html(html);
      }
});
</script>

<style type="text/css">
h1.heading{padding:0px;margin: 0px 0px 10px 0px;text-align:center;font: 18px Georgia, "Times New Roman", Times, serif;}
/* width and height of google map */
#google_map {margin-top:0px;margin-left:auto;margin-right:auto;width:100%;height:100%;}

/* Marker Edit form */
.marker-edit label{display:block;margin-bottom: 5px;}
.marker-edit label span {width: 100px;float: left;}
.marker-edit label input, .marker-edit label select{height: 24px;}
.marker-edit label textarea{height: 60px;}
.marker-edit label input, .marker-edit label select, .marker-edit label textarea {width: 60%;margin:0px;padding-left: 5px;border: 1px solid #DDD;border-radius: 3px;}

/* Marker Info Window */
h1.marker-heading{color: #585858;margin: 0px;padding: 0px;font: 18px "Trebuchet MS", Arial;border-bottom: 1px dotted #D8D8D8;}
div.marker-info-win {max-width: 300px;margin-right: -20px;}
div.marker-info-win p{padding: 0px;margin: 10px 0px 10px 0;}
div.marker-inner-win{padding: 5px;}
button.save-marker, button.remove-marker{border: none;background: rgba(0, 0, 0, 0);color: #00F;padding: 0px;text-decoration: underline;margin-right: 10px;cursor: pointer;
}
</style>
</head>
<body>            
  
   <table style="width: 100%; height: 600px;" border=1>
      <tr>
        <td>
           <div id="google_map"></div>
        </td>
        <td valign="top" style="width:150px; text-decoration: underline; color: #4444ff;">
           <div id="side_bar"></div>
        </td>
      </tr>
    </table>
    <form action="#">
      Resturant: <input type="checkbox" id="resturantbox" data-type="restaurant" class="check-box" checked /> &nbsp;&nbsp;
      Bar: <input type="checkbox" id="barbox" data-type="bar" class="check-box" checked /> &nbsp;&nbsp;
      House: <input type="checkbox" id="housebox" data-type="house" class="check-box" checked  /><br />
    </form>  
</body>
</html>