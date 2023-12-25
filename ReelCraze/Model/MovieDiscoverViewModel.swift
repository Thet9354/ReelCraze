//
//  MovieDBViewModel.swift
//  ReelCraze
//
//  Created by Phoon Thet Pine on 9/12/23.
//

import Foundation

@MainActor
class MovieDiscoverViewModel: ObservableObject {
    
    @Published var trending: [Movie] = []
    @Published var searchResults: [Movie] = []
//    @Published var movie
    
    static let apiKey = "b7be815eb9592c94b6990ee4246aaaf7"
    //static let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiN2JlODE1ZWI5NTkyYzk0YjY5OTBlZTQyNDZhYWFmNyIsInN1YiI6IjY1NzNkMDlmYmJlMWRkMDBmZTJhYmY3OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KmIKbwqwPNTeSa5r9dj6YP59XONO8O9SH327KLo9Nks"
    
    //https://api.themoviedb.org/3/movie/550?api_key=ab8ca7862f2733af2356c592de5f9d45
    
    func loadTrending() {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day?api_key=\(MovieDiscoverViewModel.apiKey)")!
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let trendingReults = try JSONDecoder().decode(TrendingResults.self, from: data)
                trending = trendingReults.results
            } catch {
                print(error.localizedDescription)
            }

        }
    }
    
    func search(term: String) {
        Task {
            
            let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=\(MovieDiscoverViewModel.apiKey)&language=en=US&page=1&include_adult=false&query=\(term)"
                .addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!)!
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let trendingReults = try JSONDecoder().decode(TrendingResults.self, from: data)
                searchResults = trendingReults.results
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func movieCredits(for movieID: Int) {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)/credits?api_key=\(MovieDiscoverViewModel.apiKey)&language=en=US")!
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let credits = try JSONDecoder().decode(MovieCredits.self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

class MovieDetailsViewModel: ObservableObject {
    
}

struct MovieCredits: Decodable {
    
    let id: Int
    let cast: [Cast]
    
    struct Cast: Decodable {
        let name: String
        let id: Int
        let character: String
    }
}
