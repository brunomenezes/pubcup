package pubcup

class Game {
	
	Date date
	Team teamA
	Team teamB
	
	String toString(){
		"${teamA?.code} x ${teamB?.code}"
	}
		
	static mapWith = "mongo"
	
	def formattedDate() {
		def formattedDate = date.format("yyyy-MM-dd")
		formattedDate.toString()
	}
	
	def formattedTime() {
		def formattedTime = date.format("HH:mm")
		formattedTime.toString()
	}
}
