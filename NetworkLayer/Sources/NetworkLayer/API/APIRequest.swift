import Foundation

public struct APIRequest {
    
    private let url: URL
    
    public var urlRequest: URLRequest {
        URLRequest(url: self.url)
    }
    
    public init?(url: URL?) {
        
        guard let url else { return nil }
        
        self.url = url
        
        if urlIsValid(url) == false { return nil }
    }
}

extension APIRequest {
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
