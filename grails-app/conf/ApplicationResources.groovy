modules = {
   
   jquery {
		resource url: 'js/jquery-1.9.0.js', disposition: 'head'
   }

   functions {
      resource url: 'js/functions.js', disposition: 'head'
   }
   
   bootstrapcss {
	   resource url: '/css/bootstrap.min.css'
	   resource url: '/css/bootstrap-responsive.min.css'
   }
   
   bootstrap {
	   dependsOn 'jquery'
	   resource url: 'js/bootstrap.min.js'
   }
   
   googlemaps {
  	   resource url: 'js/map.js'
   }

   kkcountdown{
     dependsOn 'jquery'
     resource url: 'js/kkcountdown.js'
   }
   
   countdown{
     dependsOn 'kkcountdown'
     resource url: 'js/countdown.js'
   }
   
   jqueryui {
   		dependsOn 'jquery'
   		resource url: 'js/jquery.ui/jquery-ui-1.10.0.custom.min.js', disposition: 'head'
      resource url: 'js/jquery.ui/jquery-ui-timepicker-addon.js'
      resource url: 'js/jquery.ui/jquery-ui-1.10.0.custom.min.css'
      resource url: 'js/jquery.ui/jquery-ui-timepicker-addon.css'
   }
   
   index {
   		dependsOn 'jqueryui','countdown'
   		resource url: 'js/index.js'
   }
   
   games {
	   dependsOn 'jqueryui'
	   resource url: '/js/games.js'
   }
   
   showLocation {
	   dependsOn 'jquery'
	   resource url: 'js/showLocation.js'
   }
}