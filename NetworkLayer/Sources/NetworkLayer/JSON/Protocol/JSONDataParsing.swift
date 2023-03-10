import Foundation

protocol JSONDataParsing {
    func parse<T: Decodable>(data: Data, from type: T.Type, decoder: JSONDecoder) -> T?
}

extension JSONDataParsing {
    func parse<T: Decodable>(data: Data, from type: T.Type, decoder: JSONDecoder = JSONDecoder()) -> T? {
        try? decoder.decode(type, from: data)
    }
}
