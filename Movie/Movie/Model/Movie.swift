import Foundation

struct TrendingMoviesResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int
    let media_type: String?
    let original_title: String?
    let original_name: String?
    let poster_path: String?
    let overview: String?
    let vote_average: Double
    let vote_count: Int
    let release_date: String?
    let title: String?

}
