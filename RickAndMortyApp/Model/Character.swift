
import Foundation

struct Character: Identifiable, Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
    let location: Location
    let origin: Location
}

struct Location: Decodable {
    let name: String
    let url: String
}
