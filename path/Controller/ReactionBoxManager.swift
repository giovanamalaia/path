//
//  ReactionBoxManager.swift
//  path
//
//  Created by Giovana Malaia on 14/02/25.
//

import Foundation
import UIKit

class ReactionBoxManager {
    
    static let shared = ReactionBoxManager()
    
    private var reactionBox: ReactionBoxView?
    private var backgroundOverlay: UIView?
    
    private init() {}
    
    func toggleReactionBox(from sender: UIButton) {
        if reactionBox != nil {
            removeReactionBox()
        } else {
            let reactionBoxXib = UINib(nibName: "ReactionBoxView", bundle: nil)
            if let reactionBoxView = reactionBoxXib.instantiate(withOwner: nil, options: nil).first as? ReactionBoxView,
               let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first {
                
                //overlay para toques fora
                let overlay = UIView(frame: window.bounds)
                overlay.backgroundColor = UIColor.black.withAlphaComponent(0.01)
                overlay.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(removeReactionBox)))
                window.addSubview(overlay)

              
                reactionBoxView.translatesAutoresizingMaskIntoConstraints = false
                window.addSubview(reactionBoxView)
                
                //converte posição do botão clicado para coordenadas absolutas
                let buttonFrame = sender.convert(sender.bounds, to: window)

                //constraints para ficar próximo do botao
                NSLayoutConstraint.activate([
                    reactionBoxView.topAnchor.constraint(equalTo: window.topAnchor, constant: buttonFrame.maxY),
                    reactionBoxView.trailingAnchor.constraint(equalTo: window.leadingAnchor, constant: buttonFrame.maxX)
                ])
                

                
                self.reactionBox = reactionBoxView
                self.backgroundOverlay = overlay

                print("Reaction apareceu")
            }
        }
    }
    
    @objc func removeReactionBox() {
        reactionBox?.removeFromSuperview()
        reactionBox = nil
        backgroundOverlay?.removeFromSuperview()
        backgroundOverlay = nil
        print("Reaction sumiu")
    }
}

