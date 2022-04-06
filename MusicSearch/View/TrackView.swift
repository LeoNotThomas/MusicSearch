//
//  TrackView.swift
//  MusicSearch
//
//  Created by Thomas (privat) Leonhardt on 03.04.22.
//

import SwiftUI

enum TrackViewType: Int {
    case previeview
    case detailview
}

struct TrackView: View {
    @State private var showingDetail = false
    var track: Track
    var viewType: TrackViewType
    var body: some View {
        switch viewType {
        case .previeview:
            VStack(alignment: .leading) {
                HStack(alignment: .top, spacing: 4) {
                    CoverView(track: track)
                        .frame(width: 100, height: 100)
                    VStack(alignment: .leading) {
                        Text(track.artistName)
                            .font(.headline)
                        Text(track.trackName)
                            .padding(EdgeInsets(top: 4, leading: 0, bottom: 0, trailing: 0))
                    }
                }
            }
        case .detailview:
            GeometryReader { geo in
                Form {
                    VStack (alignment: .leading, spacing: 8) {
                        CoverView(track: track)
                            .frame(width: geo.size.width * 0.8)
                        Text("Title: \(track.trackName)")
                        Text("Album: \(track.collectionName)")
                        Text("Genre: \(track.primaryGenreName)")
                        Text("Release: \(track.releaseDate)")
                        HStack {
                            Text("Link:")
                            Text("Go To Song")
                                .foregroundColor(.blue)
                                .onTapGesture {
                                    showingDetail.toggle()
                                }
                                .sheet(isPresented: $showingDetail) {
                                    DetailTrackView(track: track)
                                }
                        }
                    }
                }
                .navigationTitle("Artist: \(track.artistName)")
            }
        }
    }
    
    init(track: Track, viewType: TrackViewType = .previeview) {
        self.viewType = viewType
        self.track = track
    }
}

