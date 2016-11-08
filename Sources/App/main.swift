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

// route '/hello'
drop.get("hello") { request in

    return try JSON(node: [
        "message": "Hello, Again!"
    ])
}

// Run Server
drop.run()
