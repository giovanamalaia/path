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
    let album: String
    let year: Int
}

struct SongData {
    static let songsList: [Song] = [
        Song(name: "Not Like Us", artist: "Kendrick Lamar", coverImage: "coverKendrick", album: "Not Like Us", year: 2024),
        Song(name: "Die With A Smile", artist: "Lady Gaga & Bruno Mars", coverImage: "coverBruno", album: "Die With A Smile", year: 2024),
        Song(name: "APT.", artist: "ROSÉ & Bruno Mars", coverImage: "coverApt", album: "Rosie", year: 2024),
        Song(name: "Espresso", artist: "Sabrina Carpenter", coverImage: "coverExpresso", album: "Short n' Sweet", year: 2024),
        Song(name: "Please Please Please", artist: "Sabrina Carpenter", coverImage: "coverExpresso", album: "Short n' Sweet", year: 2024),
        Song(name: "We Can't Be Friends", artist: "Ariana Grande", coverImage: "coverAriana", album: "Eternal Sunshine", year: 2024),
        Song(name: "Too Sweet", artist: "Hozier", coverImage: "coverHozier", album: "Unheard", year: 2024),
        Song(name: "BIRDS OF A FEATHER", artist: "Billie Eilish", coverImage: "coverBillie", album: "Hit Me Hard and Soft", year: 2024 ),
        Song(name: "Yes, And?", artist: "Ariana Grande", coverImage: "coverAriana", album: "Eternal Sunshine", year: 2024),
        Song(name: "Timeless", artist: "The Weeknd & Playboi Carti", coverImage: "coverTimeless", album: "Hurry Up Tomorrow", year: 2024),
        Song(name: "Blinding Lights", artist: "The Weeknd", coverImage: "coverTw", album: "Blinding Lights", year: 2020),
        Song(name: "Abracadabra", artist: "Lady Gaga", coverImage: "coverGaga", album: "Abracadabra", year: 2025 ),
        Song(name: "Wildflower", artist: "Billie Eilish", coverImage: "coverBillie", album: "Hit Me Hard and Soft", year: 2024),
        Song(name: "That's So True", artist: "Gracie Abrams", coverImage: "coverGracie", album: "The Secret of Us", year: 2024 ),    ]
}

