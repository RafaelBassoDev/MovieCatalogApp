import Foundation

struct PopularResponseModel: Codable {
    let results: [MovieResponseModel]
    let totalResults, totalPages: Int

    enum CodingKeys: String, CodingKey {
        case results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
