class UrlMappings {

	static mappings = {

		"/admin/manage/$action?"(controller: "adminManage")
		"/adminManage/$action?"(controller: "errors", action: "urlMapping")

		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
		"500"(view:'/error')
	}
}
