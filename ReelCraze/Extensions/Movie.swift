//
//  TrendingItem.swift
//  ReelCraze
//
//  Created by Phoon Thet Pine on 9/12/23.
//

import Foundation

struct Movie: Identifiable, Decodable {
    
    let adult: Bool
    let id: Int
    let poster_path: String?
    let title: String
    let overview: String
    let vote_average: Float
    let backdrop_path: String?

    
    var backdropURL: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w400")
        return baseURL?.appending(path: backdrop_path ?? "")
    }
    
    var posterThumbnail: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w100")
        return baseURL?.appending(path: poster_path ?? "")
    }
    
    var poster: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w400")
        return baseURL?.appending(path: poster_path ?? "")
    }
    
    
    static var preview: Movie {
        return Movie(
            adult: false,
            id: 123,
            poster_path: "sample_poster_path",
            title: "Sample Movie",
            overview: "dope shit",
            vote_average: 7.5,
            backdrop_path: "https://image.tmdb.org/t/p/w500"
        )
    }
}
