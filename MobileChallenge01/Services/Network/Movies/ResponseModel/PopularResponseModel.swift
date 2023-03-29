import Foundation

struct PopularResponseModel: Codable {
    let page: Int
    let results: [MovieResponseModel]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
