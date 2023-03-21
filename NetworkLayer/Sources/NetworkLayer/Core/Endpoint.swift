import Foundation

public protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var query: String? { get }
    var method: HTTPMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
}
