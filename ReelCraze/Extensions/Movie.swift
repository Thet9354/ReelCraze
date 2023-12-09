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
    let poster_path: String
    let title: String
    let vote_average: Float
    let backdrop_path: String

    
    var backdropURL: URL {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w300")!
        return baseURL.appending(path: backdrop_path)
    }
}
