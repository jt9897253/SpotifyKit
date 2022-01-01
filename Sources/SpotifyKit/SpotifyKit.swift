//
//  SpotifyKit.swift
//  SpotifyKit
//
//  Created by Marco Albera on 30/01/17.
//

#if !os(OSX)
    import UIKit
#else
    import AppKit
#endif

// MARK: Token saving options

enum TokenSavingMethod {
    case preference
}

// MARK: Spotify queries addresses

/**
 Parameter names for Spotify HTTP requests
 */
internal struct SpotifyParameter {
    // Search
    static let name = "q"
    static let type = "type"
    
    // Authorization
    static let clientId     = "client_id"
    static let responseType = "response_type"
    static let redirectUri  = "redirect_uri"
    static let scope        = "scope"
    
    // Token
    static let clientSecret = "client_secret"
    static let grantType    = "grant_type"
    static let code         = "code"
    static let refreshToken = "refresh_token"
    
    // User's library
    static let ids          = "ids"
}

/**
 Header names for Spotify HTTP requests
 */
internal struct SpotifyHeader {
    // Authorization
    static let authorization = "Authorization"
}

/**
 Scopes (aka permissions) required by our app
 during authorization phase
 // TODO: test this more
 */
internal enum SpotifyScope: String {
    case readPrivate   = "user-read-private"
    case readEmail     = "user-read-email"
    case libraryModify = "user-library-modify"
    case libraryRead   = "user-library-read"
    
    /**
     Creates a string to pass as parameter value
     with desired scope keys
     */
    static func string(with scopes: [SpotifyScope]) -> String {
        return String(scopes.reduce("") { "\($0) \($1.rawValue)" }.dropFirst())
    }
}

internal enum SpotifyAuthorizationResponseType: String {
    case code = "code"
}

internal enum SpotifyAuthorizationType: String {
    case basic  = "Basic "
    case bearer = "Bearer "
}

/**
 Spotify authentication grant types for obtaining token
 */
internal enum SpotifyTokenGrantType: String {
    case authorizationCode = "authorization_code"
    case refreshToken      = "refresh_token"
}
