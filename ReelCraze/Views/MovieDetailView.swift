//
//  MovieDetailView.swift
//  ReelCraze
//
//  Created by Phoon Thet Pine on 9/12/23.
//

import SwiftUI

struct MovieDetailView: View {
    
    // MARK: - PROPERTIES
    @Environment(\.dismiss) var dismiss
    @StateObject var model = MovieDetailsViewModel()
    let movie: Movie
    let headerHeight: CGFloat = 400
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color(red:39/255, green: 40/255, blue: 59/255).ignoresSafeArea()

            GeometryReader { geo in
                VStack {
                    AsyncImage(url: movie.backdropURL) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: geo.size.width, maxHeight: headerHeight)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                }
            }
            
            ScrollView {
                VStack(spacing: 20) {
                    Spacer()
                        .frame(height: headerHeight)
                    HStack {
                        Text(movie.title)
                            .font(.title)
                            .fontWeight(.heavy)
                        Spacer()
                        // ratings here
                    }
                    
                    HStack {
                        // genre tag
                        
                        // running time
                    }
                    
                    HStack {
                        Text("About film")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Spacer()
                        // see all button
                    }
                    
                    Text(movie.overview)
                        .lineLimit(2)
                        .foregroundColor(.secondary)
                    
                    HStack {
                        Text("Cast & Crew")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Spacer()
                        // see all button
                    }
                    
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(model.castProfiles) { cast in
                                CastView(cast: cast)
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .ignoresSafeArea()
        .overlay(alignment: .topLeading) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .fontWeight(.bold)
            }
            .padding(.leading)
        }
        .toolbar(.hidden, for: .navigationBar)
        .onAppear {
            
        }
        .task {
            await model.movieCredits(for: movie.id)
            await model.loadCastProfiles()
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: .preview)
    }
}

struct CastView: View {
    
    let cast: CastProfile
    
    var body: some View {
        VStack {
            Text(cast.name)
        }
    }
}
