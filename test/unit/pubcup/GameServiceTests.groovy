package pubcup



import grails.test.mixin.*
import org.junit.*

import grails.test.mixin.domain.DomainClassUnitTestMixin

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(GameService)
@TestMixin(DomainClassUnitTestMixin)
class GameServiceTests {

    void testNextGames() {

    	mockDomain(Game, [
    		new Game(date: new Date().hours-3, teams: [TeamsEnum.Brazil, TeamsEnum.Spain]),
    		new Game(date: new Date().hours+1, teams: [TeamsEnum.UnitedStates, TeamsEnum.Uruguay]),
    		new Game(date: new Date().hours+2, teams: [TeamsEnum.Argentina, TeamsEnum.Italy])
    	])

		def gameService = new GameService()
		def nextGames 	= gameService.nextGames()
		
		assert nextGames != null
		assert nextGames.size() == 2
    }
}
