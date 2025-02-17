//
//  SongModel.swift
//  path
//
//  Created by Giovana Malaia on 17/02/25.
//

import Foundation

struct Song {
    let name: String
    let artist: String
    let coverImage: String
}

struct SongData {
    static let songsList: [Song] = [
        Song(name: "Expresso", artist: "Sabrina Carpenter", coverImage: "coverExpresso"),
        Song(name: "BIRDS OF A FEATHER", artist: "Billie Eilish", coverImage: "coverBillie"),
        Song(name: "Dance The Night", artist: "Dua Lipa", coverImage: "coverDua"),
        Song(name: "Lover", artist: "Taylor Swift", coverImage: "coverTaylor"),
        Song(name: "Save Your Tears", artist: "The Weeknd", coverImage: "coverWeeknd"),
        Song(name: "Shivers", artist: "Ed Sheeran", coverImage: "coverEd")
    ]
}
