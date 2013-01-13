package pubcup

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.*
import java.net.URLDecoder;

class LocationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [locationInstanceList: Location.list(params), locationInstanceTotal: Location.count()]
    }

    def create() {
        params.address = URLDecoder.decode(params.address, "iso-8859-1")
        [params:params,locationInstance: new Location(params)]
    }
	
	def create2() {
		params.address = params.address
		render(view: "create", model: [locationInstance: new Location(params)])
		
	}
	
	def create3() {
		params.address = URLDecoder.decode(params.address, "UTF-8")
		render(view: "create", model: [locationInstance: new Location(params)])
	}

    def save() {
        def locationInstance = new Location()
		bindData(locationInstance, params, [exclude: ['location', 'lat', 'lng']])
		def locs = [Double.parseDouble(params.lat), Double.parseDouble(params.lng)]
		locationInstance.location = locs
		def gameList = params.list('gameId').collect{ Game.get(it) }
		
        if (!gameList || !locationInstance.save(flush: true)) {
			if(!gameList){
				flash.message = message(code: 'location.choose.game.error', default: 'Choose a game!')
			}
            render(view: "create", model: [locationInstance: locationInstance])
            return
        }
		
		gameList.each{ game ->
			if(game && locationInstance){
				new Event(game: game, location: locationInstance).save()
			}
		}
		
        flash.message = message(code: 'default.created.message', args: [message(code: 'location.label', default: 'Location'), locationInstance.id])
        redirect(action: "show", id: locationInstance.id)
    }

    def show(String id) {
        def locationInstance = Location.findById(id)
        if (!locationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'location.label', default: 'Location'), id])
            redirect(action: "list")
            return
        }

        [locationInstance: locationInstance]
    }

    def edit(Long id) {
        def locationInstance = Location.get(id)
        if (!locationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'location.label', default: 'Location'), id])
            redirect(action: "list")
            return
        }

        [locationInstance: locationInstance]
    }

    def update(Long id, Long version) {
        def locationInstance = Location.get(id)
        if (!locationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'location.label', default: 'Location'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (locationInstance.version > version) {
                locationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'location.label', default: 'Location')] as Object[],
                          "Another user has updated this Location while you were editing")
                render(view: "edit", model: [locationInstance: locationInstance])
                return
            }
        }

        locationInstance.properties = params

        if (!locationInstance.save(flush: true)) {
            render(view: "edit", model: [locationInstance: locationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'location.label', default: 'Location'), locationInstance.id])
        redirect(action: "show", id: locationInstance.id)
    }

    def delete(Long id) {
        def locationInstance = Location.get(id)
        if (!locationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'location.label', default: 'Location'), id])
            redirect(action: "list")
            return
        }

        try {
            locationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'location.label', default: 'Location'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'location.label', default: 'Location'), id])
            redirect(action: "show", id: id)
        }
    }

    def circle() {
        def center = [params.lat, params.long]
        def radius = params.radius
        def locations = Location.findByLocationWithinCircle([center, radius])
        render(text: locations, contenType: "text/json")
    }
	
	def associate(){
		def location = pubcup.Location.get(params.id)
        def gameList = Game.withCriteria{
            not{
                'in'('id', location.events.game.id)
            }
        }
		return [location: location, gameList: gameList]
	}
	
    def eventSave(){
        def location = Location.get(params.id)
        params.list("gameId").each{ gameId ->
            def game = Game.get(gameId)
            if(game && location){
                new Event(location: location, game: game).save(flush: true)
            }    
        }
		flash.message = message(code: 'default.created.message', args: [message(code: 'event.label', default: 'Event'), ''])
		redirect(action: "show", id: location.id)
    }
	
	def updateDescription(String locationId, String description) {
		try {
			def location = Location.get(locationId)
			location.description = description
			location.save()
			render(text: "true")
		} catch (Exception e) {
			log.error "Ocorreu um erro ao atualizar a descricao da localidade", e
			render(text: "false")
		}
	}

    def findAllByGameId() {

        def events = []

        if( params.id != null ) {
            def game      = Game.get(params.id)
            events        += Event.createCriteria().list() {
                eq("game", game)
            }
        } else {
            def games     = Game.findAll()

            games.each { game -> 
                events        += Event.createCriteria().list() {
                    eq("game", game)
                }
            }
        }

        def filteredEvents = events.findAll { event ->
            event.location && event.location.name 
        }

        render filteredEvents.collect{ event ->
            def location = event.location

            [lng: location.lng, lat: location.lat, name: location.name, id: location.id] 
        } as JSON
    }


}
