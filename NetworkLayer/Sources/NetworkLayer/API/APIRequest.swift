import Foundation

internal struct APIRequest {
    
    private let url: URL
    
    public init(url: URL?) throws {
        guard let url else {
            throw APIError.invalidURL
        }
        
        self.url = url
        
        if validateURL(url) == false {
            throw APIError.invalidURL
        }
    }
    
    public func getRequest() -> URLRequest {
        return URLRequest(url: self.url)
    }
    
    private func validateURL(_ url: URL) -> Bool {
        let urlString = url.absoluteString
        let checkingType: NSTextCheckingResult.CheckingType = [.link]
        
        if urlString.isEmpty {
            return false
        }
        
        guard let detector = try? NSDataDetector(types: checkingType.rawValue) else {
            return false
        }
        
        if detector.numberOfMatches(in: urlString, options: .reportProgress, range: NSRange(location: 0, length: urlString.count)) > 0 {
            return true
        }
        
        return false
    }
}
