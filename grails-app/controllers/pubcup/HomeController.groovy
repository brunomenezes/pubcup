package pubcup

import java.awt.GraphicsConfiguration.DefaultBufferCapabilities;
import grails.converters.JSON


class HomeController {

	def locationService
	def gameService

    def index() {
    	[games: gameService.nextGames()]
	}

	def showLocationToaster(){
		def location = Location.get(params.locationId)
		def initialGameTime = new Date()
		initialGameTime.hours -= 2
		def events = location.events.findAll{ it.game.date > initialGameTime }.sort{it.game.date}
		def event
		if(events){
			event = events.remove(0)
		}
		render(template: "toaster", model: [event: event, events: events, location: location])
	}	

	def showToaster() {
		def event = Event.get(params.id)
		def location = event.location
		render(template: "toaster", model: [event: event, location: location])
	}

	def find = {
        def locations = locationService.find(params?.q)
        render locations
    }

    def near(Double lat1, Double long1, Double lat2, Double long2, String gameId ){
        def locations

    	def box = [ [ lat2 , long2 ], [ lat1 , long1 ] ]
    	
    	if(gameId)
    		locations = Location.findAllByLocationWithinBoxAndEventGameId(box, gameId)
    	else
    		locations = Location.findAllByLocationWithinBox(box)

    	if(!locations)
    		locations = []

    	render locations as JSON

    }
	
	def nextGames() {
		def games = gameService.nextGames()
		render(view:"nextGames", model:[games : games])
	}
}
