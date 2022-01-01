//
//  SpotifyArtist.swift
//  SpotifyKit
//
//  Created by Marco Albera on 16/09/2017.
//

import Foundation

public struct SpotifyArtist: SpotifySearchItem {
    public var id:   String
    public var uri:  String
    public var name: String

    public static let type: SpotifyItemType = .artist
}
