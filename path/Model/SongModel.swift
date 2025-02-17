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
        Song(name: "Not Like Us", artist: "Kendrick Lamar", coverImage: "coverKendrick"),
        Song(name: "Die With A Smile", artist: "Lady Gaga & Bruno Mars", coverImage: "coverBruno"),
        Song(name: "APT.", artist: "ROSÉ & Bruno Mars", coverImage: "coverApt"),
        Song(name: "Espresso", artist: "Sabrina Carpenter", coverImage: "coverExpresso"),
        Song(name: "Please Please Please", artist: "Sabrina Carpenter", coverImage: "coverExpresso"),
        Song(name: "We Can't Be Friends", artist: "Ariana Grande", coverImage: "coverAriana"),
        Song(name: "Fortnight", artist: "Taylor Swift & Post Malone", coverImage: "coverTaylor"),
        Song(name: "Too Sweet", artist: "Hozier", coverImage: "coverHozier"),
        Song(name: "BIRDS OF A FEATHER", artist: "Billie Eilish", coverImage: "coverBillie"),
        Song(name: "Yes, And?", artist: "Ariana Grande", coverImage: "coverAriana"),
        Song(name: "Timeless", artist: "The Weeknd & Playboi Carti", coverImage: "coverTimeless"),
        Song(name: "Blinding Lights", artist: "The Weeknd", coverImage: "coverTw"),
        Song(name: "Abracadabra", artist: "Lady Gaga", coverImage: "coverGaga"),
        Song(name: "Wildflower", artist: "Billie Eilish", coverImage: "coverBillie"),
        Song(name: "DtMF", artist: "Bad Bunny", coverImage: "coverBad"),
        Song(name: "That's So True", artist: "Gracie Abrams", coverImage: "coverGracie"),    ]
}

