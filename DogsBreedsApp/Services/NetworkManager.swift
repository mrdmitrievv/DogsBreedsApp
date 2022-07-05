import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let api = "https://api.thedogapi.com/v1/breeds?api_key=310b9904-95ee-4e25-92f6-30d2e43adb3b"
    
    private init() {}
    
    func fetchDataWithAF(completion: @escaping(_ dogBreeds: [DogBreed]) -> Void) {
        guard let url = URL(string: api) else { return }
        
        AF.request(url)
            .validate()
            .response { response in
                switch response.result {
                case .success(let value):
                    do {
                        guard let data = value else { return }
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let dogBreeds = try decoder.decode([DogBreed].self, from: data)
                        DispatchQueue.main.async {
                            completion(dogBreeds)
                        }
                    } catch let error {
                        print("Error serialization json", error)
                    }
                case .failure(let error):
                    print("There is some failure with response data: \(error)")
                }
            }
    }
}
