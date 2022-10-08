//
//  SettingsViewController.swift
//  raceMariya
//
//  Created by Мария  on 4.10.22.
//1)Экран настроек для гонок - смена цвета машины, вида препятствия, ввод имени гонщика, опционально скорость игры
//2) Сохранение настроек гонок
//3) Сохранение результатов каждой гонки - кастомным классом

import UIKit

class SettingsViewController: UIViewController {
    private var nameLabel =  UILabel()
    var textFieldForLabel = UITextField()
    private var chooseCarLabel = UILabel()
    private var chooseRoad = UILabel()
    private var chooseVelocityLabel = UILabel()
    var pickerForCars = UIPickerView()
    var pickerForRoad = UIPickerView()
    private var pickerForVelocity = UIPickerView()
    private var buttonSave = UIButton()
    let  dataForCars = ["Red","White"]
    let dataForVelocity = ["1.0","2.0"]
    let dataForRoad = ["City","Village"]
    let choiseOfPickers = Int()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "road2")!)
        
        initLabels()
        makeButton()
        initTextField()
        
        pickerForCars.dataSource =  self
        pickerForRoad.dataSource = self
        pickerForVelocity.dataSource = self
        pickerForRoad.delegate = self
        pickerForVelocity.delegate = self
        pickerForCars.delegate = self
        
        view.addSubview(pickerForRoad)
        view.addSubview(pickerForCars)
        view.addSubview(pickerForVelocity)
        initpickers()
        buttonSave.addTarget(self, action: #selector(saveData), for: .touchUpInside)
    
    }
    
    func initLabels (){
        nameLabel = .init(frame: CGRect(x: self.view.frame.width/6 + 10, y: self.view.frame.height/4, width: self.view.frame.width/3, height: 20))
        nameLabel.text = "Name"
        view.addSubview(nameLabel)
        nameLabel.makeLabel()
        
        chooseCarLabel = .init(frame: CGRect(x: self.view.frame.width/6 + 10, y: nameLabel.frame.maxY + 100, width: self.view.frame.width/3, height: 20))
        
        chooseCarLabel.text = "Car"
        view.addSubview(chooseCarLabel)
        chooseCarLabel.makeLabel()
        
        chooseRoad = .init(frame: CGRect(x: self.view.frame.width/6 + 10, y: chooseCarLabel.frame.maxY + 100, width: self.view.frame.width/3, height: 20))
        chooseRoad.text = "Road"
        view.addSubview(chooseRoad)
        chooseRoad.makeLabel()

        chooseVelocityLabel = .init(frame: CGRect(x: self.view.frame.width/6 + 10, y: chooseRoad.frame.maxY + 100, width: self.view.frame.width/3, height: 20))
        chooseVelocityLabel.text = "Speed"
        view.addSubview(chooseVelocityLabel)
        chooseVelocityLabel.makeLabel()
    
    }
    private func makeButton (){
        buttonSave = .init(frame: CGRect(x: 0, y: self.view.frame.height - 100, width: 0, height: 0))
        buttonSave.makeMenuButtons()
        buttonSave.center.x =  self.view.center.x
        buttonSave.setTitle("Save", for: .normal)
        view.addSubview(buttonSave)
    }
    private func initTextField (){
        textFieldForLabel = .init(frame: CGRect(x: self.view.center.x, y: nameLabel.frame.origin.y, width: self.view.frame.width/2 - 20, height: 30))
        textFieldForLabel.placeholder = "Enter your name"
        textFieldForLabel.backgroundColor = .white
        textFieldForLabel.borderStyle = .roundedRect
        view.addSubview(textFieldForLabel)
    }
   private func initpickers () {
        pickerForCars.frame.origin = CGPoint(x: self.view.center.x, y: chooseCarLabel.frame.origin.y - 100)
        pickerForRoad.frame.origin = CGPoint(x: self.view.center.x, y: chooseRoad.frame.origin.y - 100)
        pickerForVelocity.frame.origin = CGPoint(x: self.view.center.x, y: chooseVelocityLabel.frame.origin.y - 100)
       pickerForCars.frame.size.width = self.view.bounds.width / 2 - 20
       pickerForRoad.frame.size.width = self.view.bounds.width / 2 - 20
       pickerForVelocity.frame.size.width = self.view.bounds.width / 2 - 20
    }
    @ objc func saveData(){
        let userName = textFieldForLabel.text
      UserDefaults.standard.set(userName, forKey: "userName")
    
    }
}





extension  SettingsViewController :UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        let data = [String]()
        switch pickerView {
        case pickerForCars :
            return dataForCars[row]
        case pickerForRoad :
            return dataForRoad[row]
        case pickerForVelocity :
            return dataForVelocity[row]
        default:
            break
        }
        return data[row]
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 150
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var choosedRow = choiseOfPickers
        switch pickerView {
        case pickerForCars :
            choosedRow = row
        case pickerForRoad :
            choosedRow = row
        case pickerForVelocity :
            choosedRow = row
        default:
            break
        }
    }
}
