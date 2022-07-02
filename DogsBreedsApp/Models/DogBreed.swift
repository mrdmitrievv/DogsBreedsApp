import Foundation

struct DogBreed: Decodable {
    let id: Int?
    let name: String?
    let temperament: String?
    let origin: String?
    let image: BreedImage?
    let bredFor: String?
    let referenceImageId: String?

    var description: String {
        """
        Breed: \(name ?? "not stated")
        
        Temperament: \(temperament ?? "not stated")
        
        Origin: \(origin ?? "not stated")
        
        Bred for: \(bredFor ?? "not stated")
        """
    }
}

struct BreedImage: Decodable {
    let id: String
    let url: String
}

