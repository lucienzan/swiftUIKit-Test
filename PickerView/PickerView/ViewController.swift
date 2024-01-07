//
//  ViewController.swift
//  PickerView
//
//  Created by Daniel on 1/6/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource {
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var hourLbl: UILabel!
    @IBOutlet weak var minuteLbl: UILabel!
    @IBOutlet weak var secondLbl: UILabel!

    var hourArray:Array = Array<String>();
    var minArray:Array = Array<String>();
    var secArray:Array = Array<String>();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        hourLbl.text = "00";
        minuteLbl.text = "00";
        secondLbl.text = "00";
        
        for i in 1...24 {
            hourArray.append("\(i)")
        }
        
        minArray = ["00","05","10","15","20","25","30","35","40","45","50","55","60"]
        secArray = minArray
    }
}

extension ViewController : UIPickerViewDelegate{
    
    // setting the number of wheels
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 3
    }
    
    // this is setting for each wheels row count
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var numberRows = 0
        switch component {
        case 0:
            numberRows = 24
        case 1:
            numberRows = 13
        case 2:
            numberRows = 13
        default:
            numberRows = 00
        }
        return numberRows
    }
    
    // this is setting for each wheels row count
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var titleRow = "";
        switch component {
        case 0:
            titleRow = hourArray[row]
        case 1:
            titleRow = minArray[row]
        case 2:
            titleRow = secArray[row]
        default:
            titleRow = ""
        }
        return titleRow
    }
    
    // when selected row
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            hourLbl.text = hourArray[row]
        case 1:
            minuteLbl.text = minArray[row]
        case 2:
            secondLbl.text = secArray[row]
        default:
            hourLbl.text = round(00).description;
            minuteLbl.text = round(00).description;
            secondLbl.text = round(00).description;
        }
    }
}
