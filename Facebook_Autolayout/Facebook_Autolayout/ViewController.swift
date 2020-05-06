//
//  ViewController.swift
//  Facebook_Autolayout
//
//  Created by Caroline Zaini on 02/04/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var profileIV: UIImageView!
    @IBOutlet weak var storyBtn: UIButton!
    @IBOutlet var squareBtn: [UIButton]!
    @IBOutlet weak var coverIV: UIImageView!
    
    var center: CGPoint?
    
    /// va être appelé dès que une vue principale de la UIView va devoir mettre à jour le layout des sous-vues. Donc la profileIV sera toujours arrondie.
    override func viewWillLayoutSubviews() {
        profileIV.layer.cornerRadius = profileIV.frame.width / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyBtn.layer.cornerRadius = 15
        
        for button in squareBtn {
            /// pour chaque bouton de la collection on lui mettra un corner radius de 15
            button.layer.cornerRadius = 15
        }
        
        profileIV.layer.cornerRadius = 75
        /// systemBackground : si on a un fond noir, ce sera blanc et si le fond est blanc ce sera noir
        profileIV.layer.borderColor = UIColor.systemBackground.cgColor
        profileIV.layer.borderWidth = 4
        
        coverIV.isUserInteractionEnabled = true
        coverIV.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(gesture)))
    }
    
  
    
    /// Gesture
    
    @objc func gesture() {
        UIView.animate(withDuration: 1) {
            if self.profileIV.layer.cornerRadius == 0 {
                self.profileIV.layer.cornerRadius = 75
            } else {
                self.profileIV.layer.cornerRadius = 0
            }
            
        }
    }

    /// Touches
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let first = touches.first {
            if first.view == profileIV {
                center = profileIV.center
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let first = touches.first {
            if first.view == profileIV {
                profileIV.center = first.preciseLocation(in: self.view)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let first = touches.first {
            if first.view == profileIV {
                if center != nil {
                     profileIV.center = center!
                }
               
            }
        }
    }
    
   
    /// Simple
    @IBAction func storyButtonPressed(_ sender: Any) {
        storyBtn.backgroundColor = UIColor.systemTeal
    }
    
    /// Multiple
    @IBAction func squareButtons(_ sender: UIButton) {
        coverIV.alpha = CGFloat(sender.tag)
    }
}

