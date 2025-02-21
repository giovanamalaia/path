//
//  ImagePostView.swift
//  path
//
//  Created by Giovana Malaia on 20/02/25.
//

import Foundation
import UIKit

class ImagePostViewController: UIViewController {
    @IBOutlet var imagePost: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(navigateToWritePostView))
        imagePost.addGestureRecognizer(tapGesture)
        imagePost.isUserInteractionEnabled = true
    }
    
    @objc func navigateToWritePostView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let writePostVC = storyboard.instantiateViewController(withIdentifier: "WritePostView") as? WritePostView {
            writePostVC.selectedImageName = ImageData.imageList.randomElement() ?? "placeholder"
            navigationController?.pushViewController(writePostVC, animated: true)
        }
    }
}
