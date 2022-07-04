import Foundation

class ImageManager {
    
    static let shared = ImageManager()
    
    private init() {}

    func fetchImageData(from url: String?) -> Data? {
        guard let stringURL = url else { return nil }
        
        if let cachedImageData = getCachedImage(from: stringURL) {
            return cachedImageData
        }
        
        guard let url = URL(string: stringURL) else { return nil }
        guard let imageData = try? Data(contentsOf: url) else { return nil }
        URLSession.shared.dataTask(with: url) { _, response, _ in
            guard let response = response else { return }
            self.saveDataToCache(with: imageData, and: response)
        }
        return imageData
    }
    
    private func getCachedImage(from url: String?) -> Data? {
        guard let stringURL = url else { return nil }
        guard let url = URL(string: stringURL) else { return nil }
        let urlRequest = URLRequest(url: url)
        if let cachedResponse = URLCache.shared.cachedResponse(for: urlRequest) {
            return cachedResponse.data
        }
        return nil
    }
    
    private func saveDataToCache(with data: Data, and response: URLResponse) {
        guard let url = response.url else { return }
        let urlRequest = URLRequest(url: url)
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: urlRequest)
    }
}



