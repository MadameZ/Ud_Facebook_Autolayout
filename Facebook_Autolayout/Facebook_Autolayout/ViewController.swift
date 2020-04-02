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
    }

}

