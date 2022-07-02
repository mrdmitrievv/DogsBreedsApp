import Foundation

class DogBreedImage {
    static let shared = DogBreedImage()
    
    private init() {}
    
    func fetchImageData(from url: String?) -> Data? {
        guard let stringURL = url else { return nil }
        guard let url = URL(string: stringURL) else { return nil }
        guard let imageData = try? Data(contentsOf: url) else { return nil }
        return imageData
    }
}

// Загрузка изображения из кэша
/*
 if let cachedImage = getCachedImage(from: imageUrl) {
 image = cachedImage
 return
 }
 */

/*
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
 */



