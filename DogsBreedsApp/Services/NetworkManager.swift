import Foundation
import UIKit
import Alamofire
import AlamofireImage

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchDataWithAF(from url: String?, with completion: @escaping([DogBreed]) -> Void) {
        guard let stringURL = url else { return }
        guard let url = URL(string: stringURL) else { return }
        
        AF.request(url)
            .validate()
            .response { response in
                switch response.result {
                case .success(let value):
                    do {
                        let dogBreeds = try JSONDecoder().decode([DogBreed].self, from: value!)
                        DispatchQueue.main.async {
                            completion(dogBreeds)
                        }
                    } catch let error {
                        print(error)
                    }
                case .failure(let error):
                    print("There is some failure with response data: \(error)")
                }
            }
    }
}
