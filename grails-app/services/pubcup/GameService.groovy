package pubcup

class GameService {

    def nextGames() {
    	def initialGameTime = new Date()
		initialGameTime.hours -= 2
		return Game.withCriteria{
			gt("date", initialGameTime)
			order("date","asc")
		}
    }
    
}
