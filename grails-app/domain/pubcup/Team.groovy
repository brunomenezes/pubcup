package pubcup

class Team{

	String name

	String code

	String toString(){
		"${name} (${code})"
	}

	static mapWith = "mongo"

	static constraints = {
		name blank: false
		code blank: false
	}

}
