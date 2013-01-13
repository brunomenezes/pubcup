package pubcup



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(EventService)
@Mock([Game, Location, Event])
class EventServiceTests {

    void testSomething() {
		def game = new Game().save(validate: false)
		def location = new Location().save(validate: false)
		def event
		
		event = service.associate(game, location)
		
		assert event.game == game
		assert event.location == location
    }
}
