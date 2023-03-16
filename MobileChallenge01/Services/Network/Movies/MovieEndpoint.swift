import Foundation
import NetworkLayer

enum PosterSize: String {
    case w45
    case w300
    case w500
    case original
}

enum MovieEndpoint {
    case popular
    case genres
    case poster(size: PosterSize = .original, path: String)
}

extension MovieEndpoint: Endpoint {
    
    var acessToken: String {
        let token = Bundle.main.infoDictionary?["API_AUTH_TOKEN"] as? String
        return token ?? ""
    }
    
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
        case .genres:
            return "/3/genre/movie/list"
        case .poster(let size, let path):
            return "/t/p/\(size)/\(path)"
        }
    }
    
    var query: String? {
        switch self {
        case .popular, .genres:
            return "api_key=\(acessToken)"
        case .poster:
            return nil
        }
    }
    
    var method: NetworkLayer.HTTPMethod {
        switch self {
        case .popular, .genres, .poster:
            return .get
        }
    }
    
    var header: [String: String]? {
        return [
            "Authorization": "Bearer \(acessToken)",
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
