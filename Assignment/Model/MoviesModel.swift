//
//  MoviesModels.swift
//  Assignment
//
//  Created by Chandan on 27/02/22.
//

import Foundation


    
    struct Movies : Decodable {
        var page: Int?
        var results: [Result]?
        var totalPages : Int  = 0
          var  totalResults: Int = 0
        enum CodingKeys: String, CodingKey {
               case page, results
               case totalPages = "total_pages"
               case totalResults = "total_results"
           }
}

struct Result: Codable {
    var adult: Bool?
    var backdropPath: String?
    var genreIDS: [Int]?
    var id: Int = 0
    var originalLanguage : String = ""
    var originalTitle, overview: String?
    var popularity: Double = 0.0
    var posterPath, releaseDate : String?
    var title : String = ""
        
        
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
