// Server

import Vapor


// Droplet class handles GET/POST (HTTP Verbs) and routes
let drop = Droplet()

// Closure - single parameter for http request
drop.get { request in
    
    // return (an object that converts to response)
    return try JSON(node: [
        "message": "Hello, Vapor!"
    ])
    
}

// Run Server
drop.run()
