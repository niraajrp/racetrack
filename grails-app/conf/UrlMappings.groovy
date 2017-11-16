class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

//        "/"(view:"/index")
      "/"(controller: 'race', action: 'search')
        "500"(view:'/error')
	}
}
