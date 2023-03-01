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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
