//
//  SettingsViewControlller.swift
//  DecimalMinusDemo
//
//  Created by Xcode User on 2/4/20.
//  Copyright © 2020 Jonathan Engelsma. All rights reserved.
//
import UIKit

//protocol SettingsViewControllerDelegate{
//    func settingsChanged(fromUnits: LengthUnit, toUnits: LengthUnit)
////    func settingsChanged(fromUnits: VolumeUnit, toUnits: VolumeUnit)
//}

class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var pickerView2: UIPickerView!
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!

    var nameText = ""
    var settingSaved = true

    @IBAction func SaveButton(_ sender: Any) {
        self.settingSaved = true
        self.nameText = Label1.text!
        performSegue(withIdentifier: "name", sender: self)
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        var vc = segue.destination as! ViewController
        vc.finalName = Label1.text!
        vc.finalName2 = Label2.text!
        vc.settingHasBeenSaved = self.settingSaved
    }

    
    var picker = UIPickerView()
    var picker2 = UIPickerView()
    var lengthConversion: [String] = [String]()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Label1.numberOfLines = 0
        Label2.numberOfLines = 0

        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        lengthConversion = ["Yards", "Meters"]
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

        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap(gestureReconizer:)))
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(tap2(gestureReconizer:)))
        
        
        Label1.addGestureRecognizer(tap)
        Label1.isUserInteractionEnabled = true
//
        Label2.addGestureRecognizer(tap2)
        Label2.isUserInteractionEnabled = true
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            picker.isHidden = true
            picker2.isHidden = true
    
    }
    

    @IBAction func backButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func tap(gestureReconizer: UITapGestureRecognizer) {
            picker.isHidden = false

    }
    
    @objc func tap2(gestureReconizer: UITapGestureRecognizer) {
 
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
            Label1.text = lengthConversion[row]

        }
        else{
            Label2.text = lengthConversion[row]
        }
    }
    

    
    
}
