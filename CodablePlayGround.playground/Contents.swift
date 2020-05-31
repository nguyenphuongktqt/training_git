
import UIKit

/// MARKED: Swift Codable basic

struct Person: Codable {
    let name: String
    let age: Int
    let page: URL
    let bio: String?
}

var json: String = """
{
    "name": "NhatHM",
    "age": 29,
    "page": "https://magz.techover.io/"
}
"""
//// Convert json string to data
//var data = Data(json.utf8)
//let decoder = JSONDecoder()
//// Decode json with dictionary
//let personEntity = try? decoder.decode(Person.self, from: data)
//if let personEntity = personEntity {
//    print(personEntity)
//}

var json2: String = """
    [{
        "name": "NhatHM",
        "age": 29,
        "page": "https://magz.techover.io/"
    },
    {
        "name": "RioV",
        "age": 19,
        "page": "https://nhathm.com/"
    }]
"""
// Convert json string to data
//var data = Data(json2.utf8)
//let decoder = JSONDecoder()
//// Decode json with dictionary
//let personEntity = try? decoder.decode([Person].self, from: data)
//if let personEntity = personEntity {
//    for person in personEntity {
//        print(person)
//    }
//}

/// MARKED: Swift Codable manual encode decode

struct PersonData: Codable {
    struct Person: Codable {
        let name: String
        let age: Int
        let page: URL
        let bio: String?
    }
    let person: Person
}

var json3: String = """
    {
        "person": {
            "name": "NhatHM",
            "age": 29,
            "page": "https://magz.techover.io/"
        }
    }
"""

//let data = Data(json3.utf8)
//let decoder = JSONDecoder()
//let personEntity = try? decoder.decode(PersonData.self, from: data)
//if let personEntity = personEntity {
//    print(personEntity)
//    print(personEntity.person.name)
//}

/// MARKED : Swift Codable key decoding strategy

let json4 = """
{
    "first_name": "Nhat",
    "last_name": "Hoang",
    "age": 29,
    "page": "https://magz.techover.io/"
}
"""
//struct PersonInfo : Codable {
//    var firstName: String
//    var lastName: String
//    var age: Int
//    var page: URL
//    var bio: String?
//}
//let data = Data(json4.utf8)
//let decoder = JSONDecoder()
//decoder.keyDecodingStrategy = .convertFromSnakeCase
//let personEntity = try? decoder.decode(PersonInfo.self, from: data)
//if let personEntity = personEntity {
//    print(personEntity)
//} else {
//    print("Decode entity failed")
//}

/// Swfit codable with date format

let json5 = """
{
    "first_name": "Nhat",
    "last_name": "Hoang",
    "age": 29,
    "dob": "1990-01-01T14:12:41+0700",
    "page": "https://magz.techover.io/"
}
"""

struct PersonInfo: Codable {
    var firstName: String
    var lastName: String
    var age: Int
    var dob: Date
    var page: URL
    var bio: String?
}

let data = Data(json5.utf8)
let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase
decoder.dateDecodingStrategy = .iso8601

do {
    let personEntity = try decoder.decode(PersonInfo.self, from: data)
    print(personEntity)
} catch {
    print(error)
}
