class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
		"/near"(controller: "home", action: "near")
		"/"(controller: "home", action: "index")
		"500"(view:'/error')

		// TODO: somente para testar o js
		"/countdown"(view: '/countdown')
	}
}