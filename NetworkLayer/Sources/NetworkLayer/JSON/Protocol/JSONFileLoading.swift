import Foundation

protocol JSONFileLoading {
    func loadDataFromFile(named fileName: String, bundle: Bundle) -> Data?
}

extension JSONFileLoading {
    func loadDataFromFile(named fileName: String, bundle: Bundle) -> Data? {
        guard let path = bundle.url(forResource: fileName, withExtension: "json") else {
            return nil
        }
        
        return try? Data(contentsOf: path)
    }
}
