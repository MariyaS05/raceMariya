//
//  MenuViewController.swift
//  raceMariya
//
//  Created by Мария  on 1.10.22.
//

import UIKit
enum Buttons {
    case settings
    case game
    case score
}
class MenuViewController: UIViewController {
    private var backagroundImage = UIImageView()
    private  var buttonSettings = UIButton()
    private var buttonToGame = UIButton()
    private var buttonToScore = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customImageView()
       
        buttonsInit()
    
        backagroundImage.addSubview(buttonSettings)
        backagroundImage.addSubview(buttonToGame)
        backagroundImage.addSubview(buttonToScore)
        
        
        buttonToGame.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        buttonSettings.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        buttonToScore.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    private func customImageView (){
        backagroundImage.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        backagroundImage.image = UIImage(named: "main")
        view.addSubview(backagroundImage)
    }
    
    private func buttonsInit (){
        buttonSettings.frame = CGRect(x: 0, y: self.view.center.y - 40, width: 0, height: 0)
        buttonToGame.frame = CGRect(x: 0, y: self.view.center.y + 10, width: 0, height: 40)
        buttonToScore.frame = CGRect(x: 0, y: self.buttonToGame.frame.maxY + 10, width: 0, height: 0)
        buttonSettings.makeMenuButtons()
        buttonToGame.makeMenuButtons()
        buttonToScore.makeMenuButtons()
        buttonSettings.center.x = self.view.center.x
        buttonToGame.center.x = self.view.center.x
        buttonToScore.center.x = self.view.center.x
        
        makeTitle(.settings)
        makeTitle(.score)
        makeTitle(.game)
    }
    
    private func makeTitle ( _ buttons: Buttons ) {
        switch buttons {
        case .game :
            buttonToGame.setTitle("Start Game", for: .normal)
        case.score :
            buttonToScore.setTitle("Score", for: .normal)
        case .settings :
            buttonSettings.setTitle("Setting", for: .normal)
        }
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        switch sender {
        case buttonSettings :
            var storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc1 = storyboard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
            self.navigationController?.pushViewController(vc1, animated: true)
        case buttonToGame :
            var storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc1 = storyboard.instantiateViewController(withIdentifier: "Game") as! Game
            self.navigationController?.pushViewController(vc1, animated: true)
        case buttonToScore :
            var storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc1 = storyboard.instantiateViewController(withIdentifier: "ScoreViewController") as! ScoreViewController
            self.navigationController?.pushViewController(vc1, animated: true)
        default:
            return
            
        }
    }
    
}
