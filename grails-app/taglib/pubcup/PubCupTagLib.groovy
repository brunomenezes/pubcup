package pubcup

class PubCupTagLib {

	def game = { attrs ->
		def value = attrs.value
		out << value.toString() + ' - ' + formatDate(date: value.date, type:"datetime", style:"SHORT")
	}
	
}
