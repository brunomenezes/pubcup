package pubcup

import org.springframework.dao.DataIntegrityViolationException
import java.net.HttpURLConnection
import java.net.URL
import java.util.Properties
import java.net.HttpURLConnection
import java.net.URL
import grails.converters.*
import groovy.json.JsonSlurper

class LocationService {

    static find(String searchKey) {
    	def locations = Location.findAllByNameIlikeOrAddressIlike("%${searchKey}%", "%${searchKey}%")
        return locations.collect{ [lat: it.location[0],lng:it.location[1], id: it.id, name: it.name] } as JSON
    }
	
}
