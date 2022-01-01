//
//  SpotifyKitTests.swift
//  SpotifyKitTests
//
//  Created by Marco Albera on 26/09/2017.
//

import XCTest
import SpotifyKit

class SpotifyKitTests: XCTestCase {
    
    // MARK: Spotify responses - decoding tests
    
    func testTrack() {
        let track = try? JSONDecoder().decode(SpotifyTrack.self,
                                              from: sampleResponses[.track]!)
        
        XCTAssertNotNil(track)
    }
    
    func testAlbum() {
        let album = try? JSONDecoder().decode(SpotifyAlbum.self,
                                              from: sampleResponses[.album]!)
        
        XCTAssertNotNil(album)
    }
    
    func testPlaylist() {
        let playlist = try? JSONDecoder().decode(SpotifyPlaylist.self,
                                                 from: sampleResponses[.playlist]!)
        
        XCTAssertNotNil(playlist)
    }
    
    func testArtist() {
        let artist = try? JSONDecoder().decode(SpotifyArtist.self,
                                               from: sampleResponses[.artist]!)
        
        XCTAssertNotNil(artist)
    }
    
    func testUser() {
        let user = try? JSONDecoder().decode(SpotifyUser.self,
                                             from: sampleResponses[.user]!)
        
        XCTAssertNotNil(user)
    }
    
    func testSearchArtist() {
        let foundArtists = try? JSONDecoder().decode(SpotifySearchResponse<SpotifyArtist>.self,
                                                     from: sampleResponses[.searchArtist]!)
        
        XCTAssertNotNil(foundArtists)
    }
    
    func testSearchTrack() {
        let foundTracks = try? JSONDecoder().decode(SpotifySearchResponse<SpotifyTrack>.self,
                                                    from: sampleResponses[.searchTrack]!)
        
        XCTAssertNotNil(foundTracks)
    }
    
}
