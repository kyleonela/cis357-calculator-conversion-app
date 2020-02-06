//
//  SettingsVolumeViewController.swift
//  DecimalMinusDemo
//
//  Created by Xcode User on 2/4/20.
//  Copyright © 2020 Jonathan Engelsma. All rights reserved.
//
import UIKit

class SettingsVolumeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    @IBOutlet weak var volPicker: UIPickerView!
    @IBOutlet weak var volPicker2: UIPickerView!
    @IBOutlet weak var volLabel1: UILabel!
    @IBOutlet weak var volLabel2: UILabel!
    
    var nameText = ""
    var volSettingSaved = true
   
    @IBAction func volumeSettingsSaveButton(_ sender: Any) {
        self.volSettingSaved = true
        self.nameText = volLabel1.text!
        performSegue(withIdentifier: "name2", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        var vcs = segue.destination as! ViewController
        vcs.finalName3 = volLabel1.text!
        vcs.finalName4 = volLabel2.text!
        vcs.volumeSettingHasBeenSaved = self.volSettingSaved
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

    var picker = UIPickerView()
    var picker2 = UIPickerView()
    var lengthConversion: [String] = [String]()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        volLabel1.numberOfLines = 0
        volLabel2.numberOfLines = 0

        
        self.volPicker.delegate = self
        self.volPicker.dataSource = self
        lengthConversion = ["Gallons", "Liters"]
        var pickerReact = picker.frame
        pickerReact.origin.x = 30
        pickerReact.origin.y = 400
        picker.frame =  pickerReact
        picker.delegate = self
        picker.dataSource = self
        picker.isHidden = true
        picker.tag = 1
        view.addSubview(picker)

        
        var pickerReact2 = picker2.frame
        pickerReact2.origin.x = 30
        pickerReact2.origin.y = 400
        picker2.frame = pickerReact2
        picker2.dataSource = self
        picker2.delegate = self
        picker2.isHidden = true
        picker2.tag = 2
        

        view.addSubview(picker2)

        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(tap3(gestureReconizer:)))
        
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(tap4(gestureReconizer:)))
        
        
        volLabel1.addGestureRecognizer(tap3)
        volLabel1.isUserInteractionEnabled = true
        volLabel2.addGestureRecognizer(tap4)
        volLabel2.isUserInteractionEnabled = true
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            picker.isHidden = true
            picker2.isHidden = true
    
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func tap3(gestureReconizer: UITapGestureRecognizer) {
            picker.isHidden = false

    }
    
    @objc func tap4(gestureReconizer: UITapGestureRecognizer) {
 
            picker2.isHidden = false
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lengthConversion.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return lengthConversion[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
        if(pickerView.tag == 1){
            volLabel1.text = lengthConversion[row]

        }
        else{
            volLabel2.text = lengthConversion[row]
        }
    }
}
