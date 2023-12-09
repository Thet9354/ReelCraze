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
    let movie: Movie
    let headerHeight: CGFloat = 200
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack {
                AsyncImage(url: movie.backdropURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: headerHeight)
                } placeholder: {
                    ProgressView()
                }
                
                Spacer()
            }
            .ignoresSafeArea()
            ScrollView {
                Spacer()
                    .frame(height: headerHeight)
                Text(movie.title)
                Text(movie.overview)
            }
        }
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
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: .preview)
    }
}
