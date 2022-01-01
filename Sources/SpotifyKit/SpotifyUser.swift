//
//  SpotifyUser.swift
//  SpotifyKit
//
//  Created by Marco Albera on 16/09/2017.
//

import Foundation

public struct SpotifyUser: SpotifySearchItem {
    public var id:   String
    public var uri:  String
    public var name: String { return display_name ?? id }
    
    public static let type: SpotifyItemType = .user
    
    public var email: String?
    
    var display_name: String?
    var images:       [SpotifyImage]
    
    public var artUri: String {
        return images.first?.url ?? ""
    }
}
