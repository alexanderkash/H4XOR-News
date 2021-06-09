//
//  ContentView.swift
//  H4X0R News
//
//  Created by Alexander Kogalovsky on 4/29/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            if #available(macCatalyst 14.0, *) {
                List(networkManager.posts) { post in
                    NavigationLink(
                        destination: DetailView(url: post.url)) {
                        HStack {
                            Text(String(post.points))
                            Text(post.title)
                        }
                    }
                }
                .navigationTitle("H4X0R NEWS")
            } else {
                // Fallback on earlier versions
            }
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


