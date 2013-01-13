package pubcup

class EventService {

    def associate(game, location) {
		def event = new Event()
		event.location = location
		event.game = game
		event.save(failOnError: true)
    }
}
