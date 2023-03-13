import Foundation
import NetworkLayer

enum MovieEndpoint {
    case popular
}

extension MovieEndpoint: Endpoint {
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "api.themoviedb.org"
    }
    
    var path: String {
        switch self {
        case .popular:
            return "/3/movie/popular"
        }
    }
    
    var method: NetworkLayer.HTTPMethod {
        switch self {
        case .popular:
            return .get
        }
    }
    
    var header: [String: String]? {
        let accessToken = Bundle.main.infoDictionary?["API_AUTH_TOKEN"] ?? ""
        
        return [
            "Authorization": "Bearer \(accessToken)",
            "Content-Type": "application/json;charset=utf-8"
        ]
    }
    
    var body: [String: String]? {
        switch self {
        default:
            return nil
        }
    }
}
