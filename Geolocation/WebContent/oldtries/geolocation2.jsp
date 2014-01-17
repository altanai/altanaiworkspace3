<!DOCTYPE html>
<html>
  <head>
    <title>Geolocation</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <link href="http://code.google.com//apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css">
   

   
   <!-- code for geolocation -->
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=true"></script>

    <script>
 var arr;
    
var map;

function initialize() {
	
	alert("maps initialised 2 ");
	
  var mapOptions = {
    zoom: 6,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);

  // Try HTML5 geolocation
  if(navigator.geolocation) {
    
	  navigator.geolocation.getCurrentPosition(function(position) {
      
		  alert(" lat:  "+position.coords.latitude+" long: "+ position.coords.longitude);
		  
		    arr=new Array(); 
			arr[arr.length]="sip:altanai@tcs.com";
			arr[arr.length]=position.coords.latitude;
			arr[arr.length]=position.coords.longitude;
			
			var DateTime=new Date();
			arr[arr.length]=DateTime.getTime();
			arr[arr.length]=DateTime.getDate();
			
		 // sendDataToUpload();
		  
      var pos = new google.maps.LatLng(position.coords.latitude,
                                       position.coords.longitude);

      var infowindow = new google.maps.InfoWindow({
        map: map,
        position: pos,
        content: 'current location -> here'
      });

      map.setCenter(pos);
    }, function() {
      handleNoGeolocation(true);
    });
  } else {
    // Browser doesn't support Geolocation
    handleNoGeolocation(false);
  }


}

function handleNoGeolocation(errorFlag) {
  if (errorFlag) {
    var content = 'Error: The Geolocation service failed.';
  } else {
    var content = 'Error: Your browser doesn\'t support geolocation.';
  }

  var options = {
    map: map,
    position: new google.maps.LatLng(60, 105),
    content: content
  };

  var infowindow = new google.maps.InfoWindow(options);
  map.setCenter(options.position);
}

google.maps.event.addDomListener(window, 'load', initialize);




/* <!-- -ajax to send data to server --> */

var arr;  //Array Variable declared globally
var xmlHttpRequest;
if(window.XMLHttpRequest)
	{
	xmlHttpRequest=new XMLHttpRequest();
	}
else if(window.ActiveXObject)
	{
	xmlHttpRequest=new ActiveXObject(MICROSOFT.XMLHTTP);
	}
	

/* <!-- - end ajax code  --> */ 

function sendDataToUpload() //This function makes use of AJAX To Call the Servlet
{
	alert("uploading data to servlet 2");
	xmlHttpRequest.open('POST', 'http://10.1.5.3:8080/Geolocation/GeolocationstoreServlet?'+
			'sipuri='+arr[0]+
			'&latitude='+arr[1]+
			'&longitude='+arr[2]+
			'&date='+arr[3]+
			'&time='+arr[4],
			true);
	xmlHttpRequest.onreadystatechange=receiveMessageFromServer;
	xmlHttpRequest.send();
}

    </script>
    <!-- end geolocation code  -->
    
    
  </head>
  <body>
  
   <button onclick="sendDataToUpload()">Try it</button>
   
    <div id="map-canvas"></div>
   
  </body>
</html>