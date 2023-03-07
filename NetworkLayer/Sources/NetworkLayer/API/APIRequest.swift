import Foundation

public struct APIRequest {
    
    private let url: URL
    
    public init(url: URL?) throws {
        
        guard let url else {
            throw APIError.badURL
        }
        
        self.url = url
        
        if urlIsValid(url) == false {
            throw APIError.badURL
        }
    }
    
    public func getURLRequest() -> URLRequest {
        return URLRequest(url: self.url)
    }
    
    private func urlIsValid(_ url: URL) -> Bool {
        let urlString = url.absoluteString
        let checkingType: NSTextCheckingResult.CheckingType = [.link]
        
        if let detector = try? NSDataDetector(types: checkingType.rawValue) {
            
            if detector.numberOfMatches(in: urlString, options: .reportProgress, range: NSRange(location: 0, length: urlString.count)) > 0 {
                return true
            }
        }
        
        return false
    }
}
