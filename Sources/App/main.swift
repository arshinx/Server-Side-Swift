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

// Template route for hello.leaf
drop.get("template") { request in
    return try drop.view.make("hello", Node(node: ["name": "Ray"])) // passing data from db, etc.
}

// "/template2/name" route
drop.get("template2", String.self) { request, name in
    return try drop.view.make("hello", Node(node: ["name": name])) // passing data from db, etc.
}

// "/list" route
drop.get("list") { request in
    
    // Fruits collection
    let fruits = try ["Apple", "Persimmon", "Grapes", "Watermellon"].makeNode()
    
    // return list template with fruits collection in a dictionary
    return try drop.view.make("list", Node(node: ["fruits": fruits]))
}

// "/users" route
drop.get("users") { request in
    
    // Fruits collection
    let users = try [
        ["name": "James", "email": "james@email.com"].makeNode(),
        ["name": "Diana", "email": "diana@email.com"].makeNode(),
        ["name": "Ally",  "email": "ally@email.com" ].makeNode()
    ].makeNode()
    
    // return list template with fruits collection in a dictionary
    return try drop.view.make("users", Node(node: ["users": users]))
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

// Parameter based Route
// route '/apples/#'
drop.get("apples", Int.self) { request, apples in
    return try JSON(node: [
        "message": "Pluck one out, pass it around, \(apples-1) number of apples on the wall..."
    ])
}

// Post request (use data dictionary to receive data
drop.post("post") { request in
    guard let name = request.data["name"]?.string else {
        throw Abort.badRequest
    }
    
    return try JSON(node: [
        "message": "Hello, \(name)!"
    ])
}

// Run Server
drop.run()
