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
        
//        var dogsBreeds = [DogBreed]()
        
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
    
    /*
    // Запрос api с помощью NSURLSession
    func fetchData(from url: String?, with completion: @escaping([DogBreed]) -> Void) {
        guard let stringURL = url else { return }
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let dogBreeds = try JSONDecoder().decode([DogBreed].self, from: data)
                DispatchQueue.main.async {
                    completion(dogBreeds)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }*/
}

/*
class ImageManager {
    static let shared = ImageManager()
    
    init() {}
    
    func fetchImageOfBreed(from url: URL, completion: @escaping(Data) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "No error description")                
                return
            }
            
            guard url == response.url else { return }
            
            completion(data)
        }
    }       
}*/
