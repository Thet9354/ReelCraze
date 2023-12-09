//
//  ContentView.swift
//  ReelCraze
//
//  Created by Phoon Thet Pine on 9/12/23.
//

import SwiftUI

struct DiscoverView: View {
    
    // MARK: - PROPERTIES
    @StateObject var viewModel = MovieDBViewModel()
    
    @State var searchText = ""
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ScrollView {
                if searchText.isEmpty {
                    if viewModel.trending.isEmpty {
                        Text("No Results")
                    } else {
                        HStack {
                            Text("Trending")
                                .font(.title)
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                            Spacer()
                        }
                        .padding(.horizontal)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(viewModel.trending) { trendingItem in
                                    TrendingCardView(trendingItem: trendingItem)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                } else {
                    LazyVStack() {
                        ForEach(viewModel.searchResults) { item in
                            HStack {
                                AsyncImage(url: item.backdropURL) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 80, height: 120)
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 80, height: 120)
                                }
                                .clipped()
                                .cornerRadius(10)
                                
                                VStack(alignment: .leading) {
                                    Text(item.title)
                                        .foregroundColor(.white)
                                        .font(.headline)
                                    
                                    HStack {
                                        Image(systemName: "hand.thumbsup.fill")
                                        Text(String(format: "%.1f", item .vote_average))
                                        Spacer()
                                    }
                                    .foregroundColor(.yellow)
                                    .fontWeight(.heavy)
                                }
                                Spacer()
                            }
                            .padding()
                            .background(Color(red:61/255, green: 61/255, blue: 88/255))
                            .cornerRadius(20)
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .background(Color(red:39/255, green: 40/255, blue: 59/255)
                .ignoresSafeArea())
            
        }
        .searchable(text: $searchText)
        .onChange(of: searchText, perform: { newValue in
            if newValue.count > 2 {
                viewModel.search(term: searchText)
            }
        })
        .onAppear {
            viewModel.loadTrending()
         }
    }
}



#Preview {
    DiscoverView()
}
