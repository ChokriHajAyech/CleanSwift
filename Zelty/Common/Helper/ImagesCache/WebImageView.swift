import UIKit
import os.log

extension UIImageView {
    
    public func loadImage(url: URL,  completionHandler: @escaping ((Data?)->Void)) {
        
        let session = getSession()
        let request = requestFor(url: url)
        
        if let cachedImage = cachedImageFrom(request: request) {
            completionHandler(cachedImage.pngData())
        }else {
            let task = session.dataTask(with: request, completionHandler: {  (data, response, error) in
                if error == nil {
                    let httpResponse = response as? HTTPURLResponse
                    if httpResponse?.isStatusCode200() == true {
                        if let data = data {
                            completionHandler(data)
                        }
                    }
                }
            })
            task.resume()
        }
    }
    
    // MARK: - Private (Network)
    
    private func getSession() -> URLSession {
        return URLSession.shared
    }
    
    private func requestFor(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        return request
    }
    
    // MARK: - Private (Cache)
    
    private func cachedImageFrom(request: URLRequest) -> UIImage? {
        if let cachedResponse = URLCache.shared.cachedResponse(for: request) {
            return UIImage(data: cachedResponse.data)
        }
        
        return nil
    }
    
}

extension HTTPURLResponse {
    public func isStatusCode200() -> Bool {
        if statusCode == 200 {
            return true
        }
        
        return false
    }
}
