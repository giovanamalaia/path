//
//  WritePostView.swift
//  path
//
//  Created by Giovana Malaia on 20/02/25.
//

import Foundation
import UIKit

class WritePostView: UIViewController {
    
    @IBOutlet weak var shareButton: UIButton!
    var selectedSong: Song?
    var selectedPlace: Place?
    var selectedPerson: Person?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let song = selectedSong {
            print("Selected song: \(song.name) by \(song.artist)")
        } else if let place = selectedPlace {
            print("Selected place: \(place.name), \(place.address)")
        } 
        else {
            print("No content selected")
        }
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        if let selectedSong = selectedSong {
            NotificationCenter.default.post(name: NSNotification.Name("NewSongPost"), object: nil, userInfo: ["song": selectedSong])
        } else if let selectedPlace = selectedPlace {
            NotificationCenter.default.post(name: NSNotification.Name("NewPlacePost"), object: nil, userInfo: ["place": selectedPlace])
        } else if let selectedPerson = selectedPerson {
            NotificationCenter.default.post(name: NSNotification.Name("NewPersonPost"), object: nil, userInfo: ["person": selectedPerson])
        }

        navigationController?.popToRootViewController(animated: true)
    }


}

