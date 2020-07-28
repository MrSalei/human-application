//
//  ViewController.swift
//  apps
//
//  Created by User on 4/17/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var sexSegmentedControl: UISegmentedControl!
    @IBOutlet weak var activitySegmentControl: UISegmentedControl!
    @IBOutlet weak var resultsLabel: UILabel!
 
    var age : String!
    var height : String!
    var weight : String!
    var tempage : Double!
    var tempheight : Double!
    var tempweight : Double!
    var index : Double!
    var bmr : Double!
    var coef : Double!
    var isEqual : Bool!
    var pageStatus = "male";
    var trainStatus = "0";
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func segmentControlPressed(_ sender: Any) {
        switch sexSegmentedControl.selectedSegmentIndex{
        case 0:
            pageStatus = "male";
        case 1:
            pageStatus = "female";
        default:
            break;
        }
    }
    
    @IBAction func segmentControlPressedDays(_ sender: Any) {
        switch activitySegmentControl.selectedSegmentIndex{
        case 0:
            trainStatus = "0";
        case 1:
            trainStatus = "1-3";
        case 2:
            trainStatus = "3-5";
        case 3:
            trainStatus = "6-7";
        default:
            break;
        }
    }
    
    @IBAction func calculateTapped(_ sender: Any) {
        age = ageTextField.text;
        height = heightTextField.text;
        weight = weightTextField.text;
        tempage = NSString(string: age!).doubleValue;
        tempheight = NSString(string: height!).doubleValue;
        tempweight = NSString(string: weight!).doubleValue;
        index = (10000*tempweight)/(tempheight*tempheight);
        let x = "female";
        isEqual = (x == pageStatus);
        if(trainStatus == "0")
        {
            coef = 1.2;
        }
        else if(trainStatus == "1-3")
        {
            coef = 1.375;
        }
        else if(trainStatus == "3-5")
        {
            coef = 1.55;
        }
        else
        {
            coef = 1.725;
        }
        if(isEqual)
        {
            bmr = (447.593 + (9.247 * tempweight) + (3.098 * tempheight) - (4.33 * tempage)) * coef;
        }
        else
        {
            bmr = (88.362 + (13.397 * tempweight) + (4.799 * tempheight) - (5.677 * tempage)) * coef;
        }
        let resIndex:String = String(format:"%f", index);
        let resBmr:String  = String(format:"%f", bmr)
        resultsLabel.text = "Вы должны потреблять " + resBmr + " килокалорий для поддержания веса. Индекс массы тела " + resIndex;
    }
}

