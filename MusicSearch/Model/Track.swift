//
//  Track.swift
//  SimpleLoadData
//
//  Created by Thomas Leonhardt on 01.04.22.
//

import Foundation

struct Track: Codable, Comparable {
    static func < (lhs: Track, rhs: Track) -> Bool {
        return lhs.artistName < rhs.artistName
    }
    
    var trackId: Int
    var trackName: String
    var artistName: String
    var artworkUrl100: String
    var artworkUrl60: String
    var collectionName: String
    var releaseDate: String
    var primaryGenreName: String
    var trackViewUrl: String
    
    var coverUrl: URL? {
        return URL(string: artworkUrl60)
    }
    
    var year: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from:releaseDate)!
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour], from: date)
        if let year = components.year {
            return String(year)
        }
        return releaseDate
    }
}
