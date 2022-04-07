//
//  TrackTest.swift
//  MusicSearchTests
//
//  Created by Thomas (privat) Leonhardt on 07.04.22.
//

import Foundation
@testable import MusicSearch
import XCTest

protocol TestProtocol {
    func excecute() throws
}

class TrackTest: TestProtocol {
    
    private func loadData() throws {
        guard let path = Bundle(for: type(of: self)).path(forResource: "TestTracks", ofType: "json") else {
            fatalError()
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let decoder = JSONDecoder()
             _ = try? decoder.decode(SearchResponse.self, from: data)
        } catch {
            XCTAssertTrue(false, "Could not read data!")
        }
        
    }
    
    func excecute() throws {
        try loadData()
    }
}
