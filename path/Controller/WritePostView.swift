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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func shareButtonTapped(_ sender: Any) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let navController = storyboard.instantiateViewController(withIdentifier: "NavController") as? UINavigationController {
                navController.modalPresentationStyle = .fullScreen
                present(navController, animated: false, completion: nil)
            }
        }
}

