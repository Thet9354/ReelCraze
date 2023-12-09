//
//  TrendingResults.swift
//  ReelCraze
//
//  Created by Phoon Thet Pine on 9/12/23.
//

import Foundation

struct TrendingResults: Decodable {
    let page: Int
    let results: [Movie]
    let total_pages: Int
    let total_results: Int
}
