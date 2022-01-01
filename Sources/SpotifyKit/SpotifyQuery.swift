//
//  SpotifyQuery.swift
//  SpotifyKit
//
//  Created by Marco Albera on 30/01/17.
//

import Foundation

/**
 URLs for Spotify HTTP queries
 */
internal enum SpotifyQuery: String, URLConvertible {
    var url: URL? {
        switch self {
        case .main, .account:
            return URL(string: self.rawValue)
        case .search, .users, .me, .contains:
            return URL(string: SpotifyQuery.main.rawValue + self.rawValue)
        case .authorize, .token:
            return URL(string: SpotifyQuery.account.rawValue + self.rawValue)
        }
    }

    // Master URLs
    case main    = "https://api.spotify.com/v1/"
    case account = "https://accounts.spotify.com/"

    // Search
    case search    = "search"
    case users     = "users"

    // Authentication
    case authorize = "authorize"
    case token     = "api/token"

    // User's library
    case me        = "me/"
    case contains  = "me/tracks/contains"

    static func libraryUrlFor<T>(_ what: T.Type) -> URL? where T: SpotifyLibraryItem {
        return URL(string: main.rawValue + me.rawValue + what.type.searchKey.rawValue)
    }

    static func urlFor<T>(_ what: T.Type, id: String, playlistUserId: String? = nil) -> URL? where T: SpotifySearchItem {
        switch what.type {
        case .track, .album, .artist, .playlist:
            return URL(string: main.rawValue + what.type.searchKey.rawValue + "/\(id)")
        case .user:
            return URL(string: main.rawValue + users.rawValue + "/\(id)")!
        }
    }
}
