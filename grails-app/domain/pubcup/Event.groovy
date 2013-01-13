package pubcup

class Event {

	Game game
		
	static belongsTo = [location: Location]
	
	static mapWith = "mongo"
	
	public String toString() {
		return "${game.teams.join(" vs ")} - ${game.date.format('dd/MM/yyyy')}" 
	}
}
