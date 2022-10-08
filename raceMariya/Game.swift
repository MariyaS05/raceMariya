//
//  ViewController.swift
//  raceMariya
//
//  Created by Мария  on 29.09.22.
//дз 3: Гонки - основной экран игры, анимированное перемещение машинки
//по кнопкам вправо-влево, анимированное перемещение препятствий,
//кустов и разметки сверху-вниз за край экрана. Столкновение с
//препятствием или выезд с трассы разбивает машину => возврат на
//экран меню

import UIKit

class Game: UIViewController {
    var car = UIImageView()
    var bush = UIImageView()
    private var buttonRight = UIButton()
    private var buttonLeft = UIButton()
    var secondCar = UIImageView()
    var crash = UIImageView()
    var road = UIImageView()
    let viewFrame = CGRect()
    private var timerForBush = Timer()
    private var timerForCar = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        road = .init(frame: CGRect(x: 0, y: -900, width: view.frame.width, height: view.frame.height + 900))
        car = .init(frame: CGRect(x: 0,y: 0, width: 90, height: 100))
        bush = .init(frame: CGRect(x: randomPoint(), y: -100, width: 50, height: 50))
        secondCar = .init(frame: CGRect(x: randomPoint(), y: -300, width: 60, height: 90))
        car.center.x = self.view.center.x
        car.center.y = self.view.center.y + 220
        buttonRight = .init(frame: CGRect(x: self.view.center.x + 30, y: 750, width: 90, height: 50))
        buttonRight.setTitle("right", for: .normal)
        buttonLeft = .init(frame: CGRect(x: self.view.center.x - 120, y: 750, width: 90, height: 50))
        buttonLeft.setTitle("left", for: .normal)
        
        buttonRight.makeButton()
        buttonLeft.makeButton()
        
        buttonLeft.addTarget(self, action: #selector(buttonTouch), for: .touchUpInside)
        buttonRight.addTarget(self, action: #selector(buttonTouch), for: .touchUpInside)
        road.image = UIImage(named: "road")
        car.image = UIImage(named: "car")
        bush.image = UIImage(named: "bush")
        secondCar.image = UIImage(named: "greenCar")
        
        view.addSubview(road)
        view.addSubview(car)
        view.addSubview(bush)
        view.addSubview(secondCar)
        view.addSubview(buttonRight)
        view.addSubview(buttonLeft)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        UIView.animate(withDuration : 5 ,delay :0,options: [.repeat,.curveLinear]){
            self.road.frame.origin.y += 900
        }
        timerForBush = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(bushRun), userInfo: nil, repeats: true)
        timerForCar = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { timer in
    UIView.animate(withDuration:4,delay: 0.5,options: [.curveLinear,.repeat]){
                self.secondCar.frame.origin.y = self.view.bounds.maxY + 10
                if self.secondCar.frame.contains(self.car.frame.origin) {
                    self.timerForCar.invalidate()
                }
            }completion: { _ in
                print("ghjh")
                self.secondCar.frame.origin.x = CGFloat(self.randomPoint())
            }
        }
    }
  @objc private func buttonTouch(_ sender: UIButton){
        switch sender {
        case buttonRight:
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear) {
                self.car.frame.origin.x += 40
            }
        case buttonLeft:
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveLinear) {
                self.car.frame.origin.x -= 40
            }
        default:
            return
        }
    }
    private func randomPoint() -> Int {
        let randomX = Int.random(in: 100...200)
        return randomX
    }
    
   private func returnToMenu(){
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
       let vc1 = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
       self.navigationController?.pushViewController(vc1, animated: true)
    }
    @objc func bushRun(){
        UIView.animate(withDuration: 5, delay: 0.5, options: [.curveLinear,.repeat]) {
            self.bush.frame.origin.y = self.view.frame.maxY + 10
        }
    }
    }
