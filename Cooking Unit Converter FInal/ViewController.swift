//
//  ViewController.swift
//  Cooking Unit Converter FInal
//
//  Created by HChlebek on 12/19/15.
//  Copyright © 2015 HChlebek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate
{

    @IBOutlet weak var texfield: UITextField!
    
    
    var data = [["Cups", "Tablespoons", "Teaspoons"], ["Cups", "Tablespoons", "Teaspoons"]]
    // two arrays within an array.
    
    var output = 0.0
    
    var unit = ""
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return data.count
    }
    // the number of components (wheels) that there are in the picker.
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return data[component].count
    }
    // the number of rows that will be in each component.
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return data[component][row]
    }
    // populates the rows in each component with the values from the data array.
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        let item1 = data[0][pickerView.selectedRowInComponent(0)]
        let item2 = data[1][pickerView.selectedRowInComponent(1)]
        // gives the variables the values of which ever row is selected in the first and second component.
        
        let amountToConvert : Double = (texfield.text! as NSString).doubleValue
       
        
        if item1 == "Cups" && item2 == "Teaspoons"
        {
            output = amountToConvert * 48.0
            unit = "Teaspoons"
        }
        if item1 == "Cups" && item2 == "Tablespoons"
        {
            output = amountToConvert * 16
            unit = "Tablespoons"
        }
        if item1 == "Cups" && item2 == "Cups"
        {
            output = amountToConvert
            unit = "Cups"
        }
        if item1 == "Teaspoons" && item2 == "Cups"
        {
            output = amountToConvert / 48
            unit = "Cups"
        }
        if item1 == "Teaspoons" && item2 == "Teaspoons"
        {
            output = amountToConvert
            unit = "Teaspoons"
        }
        if item1 == "Teaspoons" && item2 == "Tablespoons"
        {
            output = amountToConvert / 3
            unit = "Tablespoons"
        }
        if item1 == "Tablespoons" && item2 == "Cups"
        {
            output = amountToConvert / 16
            unit = "Cups"
        }
        if item1 == "Tablespoons" && item2 == "Teaspoons"
        {
            output = amountToConvert * 3
            unit = "Teaspoons"
        }
        if item1 == "Tablespoons" && item2 == "Tablespoons"
        {
            output = amountToConvert
            unit = "Tablespoons"
        }
    }
    
    func noTextAlert()
    {
        if texfield.text == ""
        {
            let alert = UIAlertController(title: "Oh no!", message: "You need to put a number to convert!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func buttonTapped(sender: UIButton)
    {
        noTextAlert()
    }
    
    @IBAction func viewTapped(sender: UITapGestureRecognizer)
    {
        print("tapped")
        texfield.resignFirstResponder()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let segue1 = segue.destinationViewController as! SecondViewController
        let roundedOutput = Double(round(1000 * output)/1000)
        let finalOutput = "\(roundedOutput) \(unit)."
      
        
        segue1.output = finalOutput
    }
}

