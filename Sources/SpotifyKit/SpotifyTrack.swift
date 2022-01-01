//
//  SpotifyTrack.swift
//  SpotifyKit
//
//  Created by Marco Albera on 16/09/2017.
//

import Foundation

public struct SpotifyTrack: SpotifySearchItem, SpotifyLibraryItem {
    public var id:    String
    public var uri:   String
    public var name:  String
    
    // Simplified track objects don't contain album reference
    // so it should be an optional
    public var album: SpotifyAlbum?
    
    public static let type: SpotifyItemType = .track
    
    var artists = [SpotifyArtist]()
    
    public var artist: SpotifyArtist {
        return artists.first!
    }
}

public protocol SpotifyTrackCollection {
    var collectionTracks: [SpotifyTrack]? { get }
}
