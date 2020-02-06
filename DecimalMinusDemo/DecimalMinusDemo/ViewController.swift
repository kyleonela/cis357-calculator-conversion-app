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
    
    var isOnLength = true; //switching screens, if is on length screen, its true, volume screen then false
    var settingHasBeenSaved = false;
    
    var isOnVolume = true;
    var volumeSettingHasBeenSaved = false;
    
    
    
    @IBAction func calculateButton(_ sender: UIButton) {
        if(metersField.text == "" && yardsField.text == ""){
            print("Please enter values")
        } else{
            if(topField.text == "Yards" && metersField.text == ""){
                let conversion = Double(yardsField.text!)
                let converted = conversion! * 0.9144
                metersField.text = String(converted)
            }else if (topField.text == "Meters" && metersField.text == ""){
                let conversion = Double(yardsField.text!)
                let converted = conversion! * 1.09361
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
            if(volumeTopField.text == "Liters" && litersField.text == ""){
                let conversion = Double(gallonsField.text!)
                let converted = conversion! * 0.264172
                litersField.text = String(converted)
            }else if (volumeTopField.text == "Gallons" && litersField.text == ""){
                let conversion = Double(gallonsField.text!)
                let converted = conversion! * 3.78541
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

