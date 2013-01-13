package pubcup

class GameService {

    def nextGames() {
    	def initialGameTime = new Date()
		initialGameTime.hours -= 2

		return Game.createCriteria().list() {
			gt("date", initialGameTime)
			order("date","asc")
		}
    }
    
}
