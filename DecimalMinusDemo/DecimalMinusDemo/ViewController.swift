//
//  ViewController.swift
//  DecimalMinusDemo
//
//  Created by Jonathan Engelsma on 9/25/15.
//  Copyright (c) 2015 Jonathan Engelsma. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    
    
    @IBOutlet weak var yardsField: UITextField!
    @IBOutlet weak var metersField: UITextField!
    
    @IBOutlet weak var gallonsField: UITextField!
    @IBOutlet weak var litersField: UITextField!
    
    @IBOutlet weak var topField: UILabel!
    @IBOutlet weak var bottomField: UILabel!
    
    @IBOutlet weak var volumeTopField: UILabel!
    @IBOutlet weak var volumeBottomField: UILabel!
    
    var finalName = "Yards"
    var finalName2 = "Meters"
    var finalName3 = "Gallons"
    var finalName4 = "Liters"
    var finalName5 = "Miles"
    var finalName6 = "Quarts"
    
    var isOnLength = true; //switching screens, if is on length screen, its true, volume screen then false
    var settingHasBeenSaved = false;
    
    var isOnVolume = true;
    var volumeSettingHasBeenSaved = false;
    
    
    
    @IBAction func calculateButton(_ sender: UIButton) {
        if(metersField.text == "" && yardsField.text == ""){
            print("Please enter values")
        } else{
            metersField.text = ""
            if(topField.text == "Yards" && bottomField.text == "Meters"){
                let conversion = Double(yardsField.text!)
                let converted = conversion! * 0.9144
                metersField.text = String(converted)
            }else if (topField.text == "Meters" && bottomField.text == "Yards"){
                let conversion = Double(yardsField.text!)
                let converted = conversion! * 1.09361
                metersField.text = String(converted)
            } else if (topField.text == "Miles" && bottomField.text == "Meters"){
                let conversion = Double(yardsField.text!)
                let converted = conversion! * 1609.34
                metersField.text = String(converted)
            } else if (topField.text == "Miles" && bottomField.text == "Yards"){
                let conversion = Double(yardsField.text!)
                let converted = conversion! * 1760.0
                metersField.text = String(converted)
            } else if (topField.text == "Yards" && bottomField.text == "Miles"){
                let conversion = Double(yardsField.text!)
                let converted = conversion! * 0.000568182
                metersField.text = String(converted)
            } else if (topField.text == "Meters" && bottomField.text == "Miles"){
                let conversion = Double(yardsField.text!)
                let converted = conversion! * 0.000621371
                metersField.text = String(converted)
            }
            else {
                print("Error with input values")
            }
        }
    }
    
    @IBAction func calculateVolumeButton(_ sender: UIButton) {
        if(gallonsField.text == "" && litersField.text == ""){
            print("Please enter values")
        }else{
            litersField.text = ""
            if(volumeTopField.text == "Liters" && volumeBottomField.text == "Gallons"){
                let conversion = Double(gallonsField.text!)
                let converted = conversion! * 0.264172
                litersField.text = String(converted)
            }else if (volumeTopField.text == "Gallons" && volumeBottomField.text == "Liters"){
                let conversion = Double(gallonsField.text!)
                let converted = conversion! * 3.78541
                litersField.text = String(converted)
            } else if (volumeTopField.text == "Liters" && volumeBottomField.text == "Quarts"){
                let conversion = Double(gallonsField.text!)
                let converted = conversion! * 1.05669
                litersField.text = String(converted)
            } else if (volumeTopField.text == "Gallons" && volumeBottomField.text == "Quarts"){
                let conversion = Double(gallonsField.text!)
                let converted = conversion! * 4.0
                litersField.text = String(converted)
            } else if (volumeTopField.text == "Quarts" && volumeBottomField.text == "Liters"){
                let conversion = Double(gallonsField.text!)
                let converted = conversion! * 0.946353
                litersField.text = String(converted)
            } else if (volumeTopField.text == "Quarts" && volumeBottomField.text == "Gallons"){
                let conversion = Double(gallonsField.text!)
                let converted = conversion! * 0.25
                litersField.text = String(converted)
            }
            else{
                print("Error with input values")
            }
        }
    }
    
    @IBAction func clearVolumeButton(_ sender: UIButton) {
        gallonsField.text = ""
        litersField.text = ""
    }
    
    @IBAction func modeVolumeButton(_ sender: Any) {
        isOnLength = true
        isOnVolume = false
    }
    
    @IBAction func clearButton(_ sender: Any) {
        yardsField.text = ""
        metersField.text = ""
    }
    
    @IBAction func modeButton(_ sender: Any) {
        isOnLength = false
        isOnVolume = true
    }
    
    @IBAction func lengthSettingsButton(_ sender: Any) {
    }
    
    @IBAction func volumeSettings(_ sender: UIButton) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(isOnLength == true && settingHasBeenSaved == true){
            topField.text = finalName
            bottomField.text = finalName2
        }
        if(isOnVolume == true && volumeSettingHasBeenSaved == true){
            volumeTopField.text = finalName3
            volumeBottomField.text = finalName4
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

