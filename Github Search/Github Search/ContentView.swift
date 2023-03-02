//
//  ContentView.swift
//  Github Search
//
//  Created by Walter A Ramirez on 3/1/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                SearchBar()
                EmptyStateView()
            }
            .navigationBarTitle("Github Repositories")
        }
    }
}

struct EmptyStateView: View {
    var body: some View {
        VStack {
            Text("Github Search")
                .font(.title)
            Spacer()
        }
        .padding()
        .foregroundColor(Color(.systemIndigo))
    }
}

struct SearchBar: UIViewRepresentable {
    typealias UIViewType = UISearchBar
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search for Github Repositories"
        
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        
    }

    func makeCoordinator() -> SearchBarCoordinator {
        return SearchBarCoordinator()
    }
    
    class SearchBarCoordinator: NSObject, UISearchBarDelegate {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
