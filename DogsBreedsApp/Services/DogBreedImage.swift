import UIKit
import Alamofire
import AlamofireImage

class DogBreedImage: UIImageView {
    
    func fetchImageWithAF(from url: String) {
        let globalQueue = DispatchQueue.global(qos: .utility)
        globalQueue.async {
            guard let imageUrl = URL(string: url) else {
                print("url doesnt exist")
                return
            }
            
            // Загрузка изображения из кэша
            if let cachedImage = self.getCachedImage(from: imageUrl) {
                DispatchQueue.main.async {
                    self.image = cachedImage
                }
                return
            }
            
            AF.request(imageUrl).responseImage { response in
                switch response.result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.image = data
                        self.saveDataToCache(with: response.data!, and: response.response!)
                    }
                case .failure(let error):
                    print("There is an error with getting images: \(error)")
                }
            }
        }        
    }
    
    //Загрузка данных из кэша
    private func getCachedImage(from url: URL) -> UIImage? {
        let urlRequest = URLRequest(url: url)
        if let cachedResponse = URLCache.shared.cachedResponse(for: urlRequest) {
            return UIImage(data: cachedResponse.data)
        }
        
        return nil
    }
    
    //Кэширование данных
    private func saveDataToCache(with data: Data, and response: URLResponse) {
        guard let url = response.url else { return }
        let urlRequest = URLRequest(url: url)
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: urlRequest)
    }
}



