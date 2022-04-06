//
//  CoverView.swift
//  MusicSearch
//
//  Created by Thomas (privat) Leonhardt on 04.04.22.
//

import SwiftUI

struct CoverView: View {
    var track: Track
    var body: some View {
        let url =  track.coverUrl
        AsyncImage(url: url) { phase in
            if let image = phase.image {
                image.resizable()
                     .scaledToFill()
            } else if phase.error != nil {
                Color.red
            } else {
                ProgressView()
            }
        }
    }
}
