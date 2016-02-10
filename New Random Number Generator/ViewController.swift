//
//  ViewController.swift
//  New Random Number Generator
//
//  Created by David Song on 03/02/2016.
//  Copyright © 2016 david. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var numberLabel1: UILabel!
    @IBOutlet weak var numberLabel2: UILabel!
    @IBOutlet weak var numberLabel3: UILabel!
    @IBOutlet weak var numberLabel4: UILabel!
    @IBOutlet var Label: UILabel!
    @IBOutlet var Label2: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    let p = 3.5
    let r = 0.8
    var alpha = 1.1
    var R = 1.35

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Label.hidden = true
        Label2.hidden = true
        numberLabel1.hidden = true
        numberLabel2.hidden = true
        numberLabel3.hidden = true
        numberLabel4.hidden = true
        
        nameTextField.delegate = self
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
////////////////////////////////////////////////////////////////////////////////
    
    func textFieldDidEndEditing(textField: UITextField) {
        
//        numberLabel1.text = textField.text
//        numberLabel2.text = textField.text
//        numberLabel3.text = textField.text
//        numberLabel4.text = textField.text
        
        
        if textField.text == "1" {
            
            let q_w = 0.25
            let grad_l = -(1-q_w)/q_w
            let a = alpha / R
            let intcept_l = (a + r * (1 - a) / p)/q_w
            let Start = max(r/p, q_w * intcept_l)
            let End = min(1,(r/p - intcept_l)/grad_l)
            let d_l_decimal = (1-q_w)*(End - Start) + Start
            let d_w_decimal = grad_l*d_l_decimal + intcept_l
            let s_l_decimal = p * (1 - d_l_decimal)
            let s_w_decimal = p * (1 - d_w_decimal)
            let s_l = String(format:"%.2f", s_l_decimal)
            let s_w = String(format:"%.2f", s_w_decimal)
            
            numberLabel1.hidden = false
            numberLabel2.hidden = true
            numberLabel3.hidden = true
            numberLabel4.hidden = true
            
            numberLabel1.text = "Odds are \(q_w), next round win & save \(s_w), lose & save \(s_l)"
            
            
        } else if textField.text == "2" {
            
            let q_w = 0.5
            let grad_l = -(1-q_w)/q_w
            let a = alpha / R
            let intcept_l = (a + r * (1 - a) / p)/q_w
            let Start = max(r/p, q_w * intcept_l)
            let End = min(1,(r/p - intcept_l)/grad_l)
            let d_l_decimal = (1-q_w)*(End - Start) + Start
            let d_w_decimal = grad_l*d_l_decimal + intcept_l
            let s_l_decimal = p * (1 - d_l_decimal)
            let s_w_decimal = p * (1 - d_w_decimal)
            let s_l = String(format:"%.2f", s_l_decimal)
            let s_w = String(format:"%.2f", s_w_decimal)
            
            numberLabel1.hidden = true
            numberLabel2.hidden = false
            numberLabel3.hidden = true
            numberLabel4.hidden = true
            
            numberLabel2.text = "Odds are \(q_w), next round win & save \(s_w), lose & save \(s_l)"
            
        } else if textField.text == "3" {
            
            let q_w = 0.75
            let grad_l = -(1-q_w)/q_w
            let a = alpha / R
            let intcept_l = (a + r * (1 - a) / p)/q_w
            let Start = max(r/p, q_w * intcept_l)
            let End = min(1,(r/p - intcept_l)/grad_l)
            let d_l_decimal = (1-q_w)*(End - Start) + Start
            let d_w_decimal = grad_l*d_l_decimal + intcept_l
            let s_l_decimal = p * (1 - d_l_decimal)
            let s_w_decimal = p * (1 - d_w_decimal)
            let s_l = String(format:"%.2f", s_l_decimal)
            let s_w = String(format:"%.2f", s_w_decimal)
            
            numberLabel1.hidden = true
            numberLabel2.hidden = true
            numberLabel3.hidden = false
            numberLabel4.hidden = true
            
            numberLabel3.text = "Odds are \(q_w), next round win & save \(s_w), lose & save \(s_l)"
            
        } else if textField.text == "4" {
            
            let q_w = 1.0
            let grad_l = -(1-q_w)/q_w
            let a = alpha / R
            let intcept_l = (a + r * (1 - a) / p)/q_w
            let Start = max(r/p, q_w * intcept_l)
            let End = min(1,(r/p - intcept_l)/grad_l)
            let d_l_decimal = (1-q_w)*(End - Start) + Start
            let d_w_decimal = grad_l*d_l_decimal + intcept_l
            let s_l_decimal = p * (1 - d_l_decimal)
            let s_w_decimal = p * (1 - d_w_decimal)
            let s_l = String(format:"%.2f", s_l_decimal)
            let s_w = String(format:"%.2f", s_w_decimal)
            
            numberLabel1.hidden = true
            numberLabel2.hidden = true
            numberLabel3.hidden = true
            numberLabel4.hidden = false
            
            numberLabel4.text = "Odds are \(q_w), next round win & save \(s_w), lose & save \(s_l)"
            
        } else {
            
            numberLabel1.text = "invalid choice!!"
            numberLabel2.text = "invalid choice!!"
            numberLabel3.text = "invalid choice!!"
            numberLabel4.text = "invalid choice!!"
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
////////////////////////////////////////////////////////////////////////////////
    
    
    @IBAction func RandomNumber(sender: UIButton) {
        
        Label.hidden = false
        Label2.hidden = false
        
        let Number = Float(drand48())
        let DecimalNumber = String(format:"%.2f", Number)
        Label.text = String(DecimalNumber)
        
        
        bingo()
        
    }
    
    func bingo () {
        
        numberLabel1.hidden = true
        numberLabel2.hidden = true
        numberLabel3.hidden = true
        numberLabel4.hidden = true
        
        if nameTextField.text == "1" {
            
            if Label.text < "0.25" {
                
                Label2.text = "Congrats you win!!!!"
                
            } else {
                
                Label2.text = "Sorry you lose :("
                
            }
            
        }
        else if nameTextField.text == "2" {
            
            if Label.text < "0.5" {
                
                Label2.text = "Congrats you win!!!!"
                
            } else {
                
                Label2.text = "Sorry you lose :("
                
            }
            
        } else if nameTextField.text == "3" {
            
            if Label.text < "0.75" {
                
                Label2.text = "Congrats you win!!!!"
                
            } else {
                
                Label2.text = "Sorry you lose :("
                
            }
            
        } else if nameTextField.text == "4" {
            
            if Label.text < "1" {
                
                Label2.text = "Congrats you win!!!!"
                
            } else {
                
                Label2.text = "Sorry you lose :("
                
            }
            
        } else {
            
            Label.hidden = true
            Label2.hidden = true
            
        }
        
    }
//////////////////////////////////////////////////////////////////////////////////////
    @IBAction func continueButton(sender: UIButton) {
        
        var q_w_T = [0.25, 0.5, 0.75, 1.0]
        let range_alpha = [1.0, 1.35]
        let no_inc = 10.0
        let width_inc = (range_alpha[1] - range_alpha[0])/no_inc
        let gambler_type = 4
        let weight  = [1.0, 0.75, 0.5, 0.25]
        let a = alpha / R
        
        let grad_l_a = [-(1-q_w_T[0]),-(1-q_w_T[1]), -(1-q_w_T[2]), -(1-q_w_T[3])]
        let grad_l = [grad_l_a[0]/q_w_T[0], grad_l_a[1]/q_w_T[1], grad_l_a[2]/q_w_T[2], grad_l_a[3]/q_w_T[3]]
        
        let intcept_l = [(a + r * (1 - a) / p)/q_w_T[0], (a + r * (1 - a) / p)/q_w_T[1], (a + r * (1 - a) / p)/q_w_T[2], (a + r * (1 - a) / p)/q_w_T[3]]
        
        let Start = [max(r/p, q_w_T[0] * intcept_l[0]),max(r/p, q_w_T[1] * intcept_l[1]),max(r/p, q_w_T[2] * intcept_l[2]),max(r/p, q_w_T[3] * intcept_l[3])]
        
        let End = [min(1,(r/p - intcept_l[0])/grad_l[0]),min(1,(r/p - intcept_l[1])/grad_l[1]),min(1,(r/p - intcept_l[2])/grad_l[2]),min(1,(r/p - intcept_l[3])/grad_l[3])]
        
        let d_l_decimal = [(1-q_w_T[0])*(End[0] - Start[0]) + Start[0],(1-q_w_T[1])*(End[1] - Start[1]) + Start[1],(1-q_w_T[2])*(End[2] - Start[2]) + Start[2],(1-q_w_T[3])*(End[3] - Start[3]) + Start[3]]
        
        let d_w_decimal = [grad_l[0]*d_l_decimal[0] + intcept_l[0],grad_l[1]*d_l_decimal[1] + intcept_l[1],grad_l[2]*d_l_decimal[2] + intcept_l[2],grad_l[3]*d_l_decimal[3] + intcept_l[3]]
        
        let s_l_decimal = [p * (1 - d_l_decimal[0]),p * (1 - d_l_decimal[1]),p * (1 - d_l_decimal[2]),p * (1 - d_l_decimal[3])]
        
        let s_w_decimal = [p * (1 - d_w_decimal[0]),p * (1 - d_w_decimal[1]),p * (1 - d_w_decimal[2]),p * (1 - d_w_decimal[3])]
        
        let s_l = [String(format:"%.2f", s_l_decimal[0]),String(format:"%.2f", s_l_decimal[1]),String(format:"%.2f", s_l_decimal[2]),String(format:"%.2f", s_l_decimal[3])]
        
        let s_w = [String(format:"%.2f", s_w_decimal[0]),String(format:"%.2f", s_w_decimal[1]),String(format:"%.2f", s_w_decimal[2]),String(format:"%.2f", s_w_decimal[3])]
        
        numberLabel1.hidden = false
        numberLabel2.hidden = false
        numberLabel3.hidden = false
        numberLabel4.hidden = false
        

        if Label.text < "0.25" {
            
            if (alpha - width_inc*weight[gambler_type-1]) > range_alpha[0] {
                alpha -= width_inc*weight[gambler_type-1]
            } else {
                alpha = range_alpha[0]
            }
            
            numberLabel1.text = "Odds are \(q_w_T[0]), next round win & save \(s_w[0]), lose & save \(s_l[0])"
            
        } else {
            
            if (alpha + width_inc*weight[gambler_type-1]) < range_alpha[1] {
                alpha += width_inc*weight[gambler_type-1]
            } else {
                alpha = range_alpha[1]
            }
            
            numberLabel1.text = "Odds are \(q_w_T[0]), next round win & save \(s_w[0]), lose & save \(s_l[0])"
            
        }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        if Label.text < "0.5" {
            
            if (alpha - width_inc*weight[gambler_type-1]) > range_alpha[0] {
                alpha -= width_inc*weight[gambler_type-1]
            } else {
                alpha = range_alpha[0]
            }
            
            numberLabel2.text = "Odds are \(q_w_T[1]), next round win & save \(s_w[1]), lose & save \(s_l[1])"
            
        } else {
            
            if (alpha + width_inc*weight[gambler_type-1]) < range_alpha[1] {
                alpha += width_inc*weight[gambler_type-1]
            } else {
                alpha = range_alpha[1]
            }
            
            numberLabel2.text = "Odds are \(q_w_T[1]), next round win & save \(s_w[1]), lose & save \(s_l[1])"
            
        }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        if Label.text < "0.75" {
            
            if (alpha - width_inc*weight[gambler_type-1]) > range_alpha[0] {
                alpha -= width_inc*weight[gambler_type-1]
            } else {
                alpha = range_alpha[0]
            }
            
            numberLabel3.text = "Odds are \(q_w_T[2]), next round win & save \(s_w[2]), lose & save \(s_l[2])"
            
        } else {
            
            if (alpha + width_inc*weight[gambler_type-1]) < range_alpha[1] {
                alpha += width_inc*weight[gambler_type-1]
            } else {
                alpha = range_alpha[1]
            }
            
            numberLabel3.text = "Odds are \(q_w_T[2]), next round win & save \(s_w[2]), lose & save \(s_l[2])"
            
        }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        if Label.text < "1.0" {
            
            if (alpha - width_inc*weight[gambler_type-1]) > range_alpha[0] {
                alpha -= width_inc*weight[gambler_type-1]
            } else {
                alpha = range_alpha[0]
            }
            
            numberLabel4.text = "Odds are \(q_w_T[3]), next round win & save \(s_w[3]), lose & save \(s_l[3])"
            
        } else {
            
            if (alpha + width_inc*weight[gambler_type-1]) < range_alpha[1] {
                alpha += width_inc*weight[gambler_type-1]
            } else {
                alpha = range_alpha[1]
            }
            
            numberLabel4.text = "Odds are \(q_w_T[3]), next round win & save \(s_w[3]), lose & save \(s_l[3])"
            
        }
        
                
//                numberLabel1.text = "Odds are \(q_w_T[0]), next round win & save \(s_w[0]), lose & save \(s_l[0])"
//                numberLabel2.text = "Odds are \(q_w_T[1]), next round win & save \(s_w[1]), lose & save \(s_l[1])"
//                numberLabel3.text = "Odds are \(q_w_T[2]), next round win & save \(s_w[2]), lose & save \(s_l[2])"
//                numberLabel4.text = "Odds are \(q_w_T[3]), next round win & save \(s_w[3]), lose & save \(s_l[3])"
        


        

        
        
    }
   
}




