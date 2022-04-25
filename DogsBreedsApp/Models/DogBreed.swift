struct DogBreed: Decodable {
    let id: Int?
    let name: String?
    let temperament: String?
    let origin: String?
    let image: BreedImage
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
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case temperament = "temperament"
        case origin = "origin"
        case image = "image"
        case bredFor = "bred_for"
        case referenceImageId = "reference_image_id"
    }
}

struct BreedImage: Decodable {
    let id: String
    let url: String
}

enum URLS: String {
    case breedURL = "https://api.thedogapi.com/v1/breeds?api_key=310b9904-95ee-4e25-92f6-30d2e43adb3b"
}
