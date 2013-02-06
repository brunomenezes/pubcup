package pubcup



import grails.test.mixin.*
import org.junit.*

import grails.test.mixin.domain.DomainClassUnitTestMixin

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(GameService)
@Mock([Game])
class GameServiceTests {

    GameService gameService

    void setUp(){
        gameService = service
    }

    void testNextGames() {

    	def teamA = new Team()
        def teamB = new Team()
        
        new Game(date: new Date(new Date().time - 3600000*4), teamA: teamA, teamB: teamB).save(validate: false)
        new Game(date: new Date(), teamA: teamA, teamB: teamB).save(validate: false)
        new Game(date: new Date(), teamA: teamA, teamB: teamB).save(validate: false)
        
        def nextGames   = gameService.nextGames()
        
        assert nextGames != null
        assert nextGames.size() == 2
    }
}
