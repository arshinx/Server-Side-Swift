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

// route '/hello/there'
drop.get("hello", "there") { request in
    
    return try JSON(node: [
        "message": "Hello, there!"
        ])
}

// Run Server
drop.run()
