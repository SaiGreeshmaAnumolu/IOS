//
//  ViewController.swift
//  AnumoluWeightOnOtherPlanets
//
//  Created by Sai Greeshma Anumolu on 10/26/23.
//

import UIKit

class WeightCalculatorVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var weightTF: UITextField!
    
    @IBOutlet weak var unitsPicker: UIPickerView!
    
    @IBOutlet weak var planetPicker: UIPickerView!
    
    @IBOutlet weak var messageLBL: UILabel!
    
    
    enum Unit: Double, CaseIterable {
            case mg = 1_000_000.0
            case grams = 1_000.0
            case kgs = 1.0
            case lbs = 0.453592
            case oz = 35.274
            
            var unit: String {
                switch self {
                case .mg: return "mgs"
                case .grams: return "grams"
                case .kgs: return "kgs"
                case .lbs: return "lbs"
                case .oz: return "oz"
                }
            }
        }
        
        
    enum Planet: Double, CaseIterable {
        case marsMercury = 3.7
        case venus = 8.9
        case earth = 9.8
        case jupiter = 23.1
        case saturn = 9.0
        case uranus = 8.7
        case neptune = 11.0
        case pluto = 0.7
        case sun = 274
        case moon = 1.6
        
        var name: String {
            switch self {
            case .marsMercury: return "Mars/Mercury"
            case .venus: return "Venus"
            case .earth: return "Earth"
            case .jupiter: return "Jupiter"
            case .saturn: return "Saturn"
            case .uranus: return "Uranus"
            case .neptune: return "Neptune"
            case .pluto: return "Pluto"
            case .sun: return "Sun"
            case .moon: return "Moon"
            }
        }
    }
        
      let weightUnits: [Unit] = [.mg, .grams, .kgs, .lbs, .oz]
    let planets: [Planet] = [.marsMercury, .venus, .earth, .jupiter, .saturn, .uranus, .neptune, .pluto, .sun, .moon]
   

        
    var selectedWeightUnit: Unit?
    var selectedPlanet: Planet?
    
        override func viewDidLoad() {
            super.viewDidLoad()
            unitsPicker.delegate = self
            unitsPicker.dataSource = self
            planetPicker.delegate = self
            planetPicker.dataSource = self
        }
        
        // UIPickerViewDataSource methods
    @objc(numberOfComponentsInPickerView:) func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
    @objc func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            if pickerView == unitsPicker {
                return weightUnits.count
            } else {
                return planets.count
            }
        }
    @objc func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == unitsPicker {
            //if let selectedUnit1 = Unit(rawValue: Double(row)) {
            self.selectedWeightUnit = Unit.allCases[row]
           // }
        } else{
            //if let selectedPlanet = Planet.allCases[row] {
                self.selectedPlanet = Planet.allCases[row]
           // }
        }
    }

        // UIPickerViewDelegate methods
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == unitsPicker {
            return weightUnits[row].unit
        } else {
            return planets[row].name
        }
        //return nil
    }


        @IBAction func onCalculate(_ sender: UIButton) {
            if let userWeightText = weightTF.text, let userWeight = Double(userWeightText) {
                if selectedWeightUnit != nil{
                    if selectedPlanet != nil{
                       let weightInKilograms = convertWeightToKilograms(weight: userWeight, unit: selectedWeightUnit ?? .kgs)
                        let weight = weightInKilograms * (selectedPlanet!.rawValue / 9.8)
                        messageLBL.text = String(format: "Your weight on the planet \(selectedPlanet!) is %.2f \(selectedWeightUnit!).", (weight))
                    }else{
                        //print(selectedPlanet!)
                        messageLBL.text = "Choose a specific planet to calculate the weight"
                    }
                }else{
                    messageLBL.text = "Provide units for the weight"
                }
            } else {
                messageLBL.text = "Provide valid weight in the text field"
            }
        }
        
        @IBAction func onReset(_ sender: UIButton) {
            weightTF.text = ""
            messageLBL.text = ""
            unitsPicker.selectRow(0, inComponent: 0, animated: true)
            planetPicker.selectRow(0, inComponent: 0, animated: true)
            selectedPlanet = nil
            selectedWeightUnit = nil
        }
        
        func convertWeightToKilograms(weight: Double, unit: Unit) -> Double {
            switch unit {
            case .kgs:
                return weight
            case .mg:
                return weight / 1_000_000
            case .grams:
                return weight / 1_000
            case .lbs:
                return weight / 2.204
            case .oz:
                return weight / 35.274
            }
        }
    }

