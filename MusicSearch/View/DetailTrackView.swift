//
//  DetailView.swift
//  MusicSearch
//
//  Created by Thomas (privat) Leonhardt on 05.04.22.
//

import SwiftUI

struct DetailTrackView: View {
    @Environment(\.dismiss) var dismiss
    var track: Track
    var body: some View {
        WebView(url: track.trackViewUrl)
    }
}
