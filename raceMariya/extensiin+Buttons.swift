//
//  extensiin+Buttons.swift
//  raceMariya
//
//  Created by Мария  on 1.10.22.
//

import Foundation
import UIKit

extension   UIButton {
   func makeButton() {
        backgroundColor = .systemBlue
        layer.cornerRadius = 20
        alpha = 0.5
    }
    func makeMenuButtons () {
        backgroundColor = UIColor(red: 254/255, green: 195/255, blue: 69/255, alpha: 1)
        layer.cornerRadius = 20
        frame.size.height = 40
        frame.size.width = 150
        setTitleColor(.black, for: .normal)
        
    }
}
