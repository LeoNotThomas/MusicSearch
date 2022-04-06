//
//  ContentView.swift
//  MusicSearch
//
//  Created by Thomas (privat) Leonhardt on 03.04.22.
//

import SwiftUI

struct SearchResultsView: View {
    @StateObject var dataSource: SearchDataSource
    @State var showDetail: Bool = false
    var body: some View {
            List(dataSource.items, id: \.trackId) { item in
                NavigationLink(destination: TrackView(track: item, viewType: .detailview)) {
                    HStack {
                        TrackView(track: item)
                            .onAppear {
                                dataSource.loadMoreContentIfNeeded(currentItem: item)
                            }
                        Spacer()
                    }
                }
            }
            .navigationTitle(dataSource.term)
            .listStyle(.plain)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsView(dataSource: SearchDataSource(term: "Trompete"))
    }
}
