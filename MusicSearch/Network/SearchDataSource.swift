//
//  Search.swift
//  MusicSearch
//
//  Created by Thomas (privat) Leonhardt on 03.04.22.
//

import Foundation
import Combine

struct SearchResponse<T: Codable>: Codable {
    var results: [T]
}

class SearchDataSource: ObservableObject {
    
    @Published var items = [Track]()
    @Published var isLoadingPage = false
    private var offset = 0
    private var limit = 25
    private (set) var term: String
    private var canLoadMorePages = true

    init(term: String) {
        self.term = term.trimmingCharacters(in: .whitespaces).replacingOccurrences(of: " ", with: "+")
        loadMoreContent()
    }

    func loadMoreContentIfNeeded(currentItem item: Track?) {
        guard let item = item else {
            loadMoreContent()
            return
        }

        if items.last?.trackId == item.trackId {
            loadMoreContent()
        }
    }

    private func loadMoreContent() {
        guard !isLoadingPage && canLoadMorePages else {
            return
        }

        isLoadingPage = true

        let url = URL(string: "https://itunes.apple.com/search?term=\(term)&entity=song&limit=\(limit)&media=music&offset=\(offset)")!
        print(url.absoluteString)
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: SearchResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveOutput: { response in
                self.isLoadingPage = false
                self.offset += 25
            })
            .map({ response in
                return self.items + response.results.sorted{ $0 < $1 }
            })
            .catch({ _ in Just(self.items) })
            .assign(to: &$items)
    }
}
