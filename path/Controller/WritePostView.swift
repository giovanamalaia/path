//
//  WritePostView.swift
//  path
//
//  Created by Giovana Malaia on 20/02/25.
//

import Foundation
import UIKit

class WritePostView: UIViewController {
    
    @IBOutlet weak var textFielPost: UITextField!
    @IBOutlet weak var shareButton: UIButton!
    var selectedSong: Song?
    var selectedPlace: Place?
    var selectedPerson: Person?
    var selectedImageName: String?

    
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
        } else if let selectedImageName = selectedImageName {
            NotificationCenter.default.post(name: NSNotification.Name("NewImagePost"), object: nil, userInfo: ["imageName": selectedImageName])
        }else if let text = textFielPost.text, !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            NotificationCenter.default.post(name: NSNotification.Name("NewTextPost"), object: nil, userInfo: ["text": text])
        } else {
            let alert = UIAlertController(title: "No Content", message: "Please write a message before sharing.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }

        navigationController?.popToRootViewController(animated: true)
    }


}

