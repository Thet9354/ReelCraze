//
//  TrendingCardView.swift
//  ReelCraze
//
//  Created by Phoon Thet Pine on 9/12/23.
//

import SwiftUI

struct TrendingCardView: View {
    
    // MARK: - PROPERTIES
    let trendingItem: Movie
    
    // MARK: - BODY
    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: trendingItem.backdropURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 400, height: 200)
            } placeholder: {
                Rectangle().fill(Color(red:61/255, green: 61/255, blue: 88/255))
                    .frame(width: 400, height: 200)
            }
            
            
            VStack {
                HStack {
                    Text(trendingItem.title)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                    Spacer()
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                }
                HStack {
                    Image(systemName: "hand.thumbsup.fill")
                    Text(String(format: "%.1f", trendingItem.vote_average))
                    Spacer()
                }
                .foregroundColor(.yellow)
                .fontWeight(.heavy)
            }
            .padding()
            .background(Color(red:61/255, green: 61/255, blue: 88/255))
        }
        .cornerRadius(10)
    }
}

struct TrendingCardView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleTrendingItem = Movie(
            adult: false,
            id: 123,
            poster_path: "sample_poster_path",
            title: "Sample Movie",
            overview: "Some dope shit",
            vote_average: 7.5,
            backdrop_path: "https://image.tmdb.org/t/p/w500"
        )
        
        return TrendingCardView(trendingItem: sampleTrendingItem)
    }
}

