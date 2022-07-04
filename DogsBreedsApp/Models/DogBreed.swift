import Foundation

struct DogBreed: Decodable {
    let id: Int
    let name: String
    let temperament: String?
    let origin: String?
    let image: BreedImage?
    let bredFor: String?
    let referenceImageId: String
    let lifeSpan: String?
}

struct BreedImage: Decodable {
    let id: String
    let url: String
}

