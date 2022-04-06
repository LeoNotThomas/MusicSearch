//
//  SearchInputView.swift
//  MusicSearch
//
//  Created by Thomas (privat) Leonhardt on 04.04.22.
//

import SwiftUI

struct SearchInputView: View {
    @State private var searchText = "Taylor"
    var body: some View {
        NavigationView {
            NavigationLink(destination: SearchResultsView(dataSource: SearchDataSource(term: searchText))) {
                Text("Searching for \(searchText)")
                    .searchable(text: $searchText)
                    .navigationTitle("Search")
            }
        }
    }
}

struct SearchInputView_Previews: PreviewProvider {
    static var previews: some View {
        SearchInputView()
    }
}
