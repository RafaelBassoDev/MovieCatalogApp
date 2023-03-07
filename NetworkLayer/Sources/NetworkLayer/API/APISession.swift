import Foundation

public protocol APISession {
    func sendRequest(_ request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}
