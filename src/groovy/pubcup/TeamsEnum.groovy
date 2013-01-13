package pubcup

enum TeamsEnum {
	
	Brazil("Brazil","BRA"),
	Spain("Spain","ESP"),
	SouthAfrica("South Africa","ZAF"),
	Iraq("Iraq","IRQ"),
	NewZealand("New Zealand","NZL"),
	UnitedStates("United States","USA"),
	Italy("Italy","ITA"),
	Egypt("Egypt","EGY")
	
	def name
	def code
	
	TeamsEnum(String name, String code){
		this.name = name
		this.code = code
	}
	
}
