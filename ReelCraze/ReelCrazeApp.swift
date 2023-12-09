//
//  ReelCrazeApp.swift
//  ReelCraze
//
//  Created by Phoon Thet Pine on 9/12/23.
//

import SwiftUI

@main
struct ReelCrazeApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                DiscoverView()
                    .tabItem {
                        Image(systemName: "popcorn")
                    }
                Text("Favourites")
                    .tabItem {
                        Image(systemName: "heart.fill")
                    }
                Text("Tickets")
                    .tabItem {
                        Image(systemName: "bookmark.fill")
                    }
            }
        }
    }
}
