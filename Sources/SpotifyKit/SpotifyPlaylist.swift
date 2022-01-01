//
//  SpotifyPlaylist.swift
//  SpotifyKit
//
//  Created by Marco Albera on 16/09/2017.
//

import Foundation

public struct SpotifyPlaylist: SpotifySearchItem, SpotifyLibraryItem, SpotifyTrackCollection {
    struct Tracks: Decodable {
        struct Item: Decodable {
            var track: SpotifyTrack
        }
        
        var total: Int
        
        // Track list is contained only in full playlist objects
        var items: [Item]?
    }
    
    public var id:   String
    public var uri:  String
    public var name: String
    
    var tracks: Tracks
    
    public var collectionTracks: [SpotifyTrack]? {
        return tracks.items?.map { $0.track }
    }
    
    public var count: Int {
        return tracks.total
    }
    
    public static let type: SpotifyItemType = .playlist
}

