//
//  ViewController.swift
//  BmiCalculator
//
//  Created by english on 2022-09-22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtHeight: UITextField!
    @IBOutlet weak var txtWeight: UITextField!
    
    @IBOutlet weak var lblResult: UILabel!
    
    
    
    @IBAction func btnCalculate(_ sender: Any) {
        guard let heightInCm = Double(txtHeight.text!), (85...250).contains(heightInCm) else{
            Toast.ok(view: self, title: "Review the height", message: "Please enter a valid height between 85 cm and 250 cm.", handler: nil)
            return
        }
        
        guard let weightInkg = Double(txtWeight.text!), (30...300).contains(weightInkg) else{
            
            Toast.ok(view: self, title : "Review the weight", message: "Please enter a valid weight between 30 kg and 300 kg.", handler: nil)
            
            return
        }
        
        let heightInMeter = heightInCm / 100
        
        let bmi = calculateBmi(heightInMeter: heightInMeter, weightInKg: weightInkg)
        switch(bmi)
        {
            case 0...18.5:
                lblResult.text = "BMI Classification = Underweight"
                lblResult.backgroundColor = UIColor.blue
                break
            
            case 18.5...24.9:
                lblResult.text = "BMI Classification = Normal"
                lblResult.backgroundColor = UIColor.green
                break
            case 25.0...29.9:
                lblResult.text = "BMI Classification = Overweight"
                lblResult.backgroundColor = UIColor.yellow
                break
            case 30.0...100.0:
                lblResult.text = "BMI Classification = Obese"
                lblResult.backgroundColor = UIColor.orange
                break
            default:
                break
            
            
        }
        lblResult.isHidden = false
        print(bmi)
    }
    
    
    
    @IBAction func txtHeightChanged(_ sender: Any) {
        lblResult.isHidden = true
    }
    
    
    @IBAction func txtWeightChanged(_ sender: Any) {
        lblResult.isHidden = true
    }
    
    
    func calculateBmi(heightInMeter: Double, weightInKg: Double) -> Double
    {
        var result = weightInKg / pow(heightInMeter, 2)
        result = round(result * 10) / 10
        
        return result
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblResult.isHidden = true
    }


}

