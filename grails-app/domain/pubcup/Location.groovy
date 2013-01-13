package pubcup

class Location {
	String id
	String name
	String description
	String address
	List location
	String lat
	String lng
	String phone

	public void setLocation(List locs){
		this.@location = locs
		lat = "${locs[0]}"
		lng = "${locs[1]}"
	}

	static mapWith = "mongo"
	
	static hasMany = [ events:Event ]
	
	static mappings = {
		location geoIndex: true
	}

	static constraints = {
		name blank: false
		phone nullable: true
	}
}
