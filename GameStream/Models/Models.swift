//
//  Models.swift
//  GameStream
//
//  Created by Jose Daniel Corredor Zambrano on 26/07/22.
//

import Foundation

struct Games: Codable {
    
    var game: [Game]
}

struct Results: Codable {
    
    var results: [Game]
}

struct Game: Codable, Hashable {
    var title: String
    var studio: String
    var contentRaiting: String
    var publicationYear: String
    var description: String
    var platforms: [String]
    var tags: [String]
    var videosUrls: videoUrl
    var galleryImages: [String]
}

struct videoUrl: Codable, Hashable {
    var mobile: String
    var tablet: String
}
