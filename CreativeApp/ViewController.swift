//  Created by RYAN STARK on 8/22/24.

import UIKit
import Foundation

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var rightText: UITextField!
    @IBOutlet weak var leftText: UITextField!
    @IBOutlet weak var calcText: UILabel!
    var previous = ""
    var empty = true
    @IBOutlet weak var leftLabel: UILabel!
    var first = 0
    var second = 0
    var operatorr = ""
    var complete = false
    var softfix = false
    override func viewDidLoad() {
        super.viewDidLoad()
        calcText.text = ""
//        createDisplayLink()
        rightText.delegate = self
        leftText.delegate = self
        leftText.text = ""
        rightText.text = ""

    }
    
    @IBAction func divide(_ sender: UIButton) {
            if !leftText.isEditing && !rightText.isEditing{
                if !empty{
                    if calcText.text?.suffix(1) != "+" && calcText.text?.suffix(1) != "/" && calcText.text?.suffix(1) != "-" && calcText.text?.suffix(1) != "*"{
                        if !complete {
                        calcText.text = calcText.text! + "/"
                        operatorr = "/"
                        leftLabel.text = ""
                        } else {
                            leftLabel.text = "The equation is done, press equal or clear"
                        }
                    } else {
                        leftLabel.text = "There is already an operator there"
                    }
                } else {
                    leftLabel.text = "There arent any numbers"
                }
            }
        
    }
    @IBAction func multiply(_ sender: UIButton) {
        if !leftText.isEditing && !rightText.isEditing{
            if !empty{
                if calcText.text?.suffix(1) != "+" && calcText.text?.suffix(1) != "/" && calcText.text?.suffix(1) != "-" && calcText.text?.suffix(1) != "*"{
                    if !complete {

                    calcText.text = calcText.text! + "*"
                    operatorr = "*"
                    leftLabel.text = ""
                    } else {
                        leftLabel.text = "The equation is done, press equal or clear"
                    }
                } else {
                    leftLabel.text = "There is already an operator there"
                }
            } else {
                leftLabel.text = "There arent any numbers"
            }
        }
        
    }
    @IBAction func minus(_ sender: UIButton) {
        if !leftText.isEditing && !rightText.isEditing{
            if !empty{
                if calcText.text?.suffix(1) != "+" && calcText.text?.suffix(1) != "/" && calcText.text?.suffix(1) != "-" && calcText.text?.suffix(1) != "*"{
                    if !complete {

                    calcText.text = calcText.text! + "-"
                    operatorr = "-"
                    leftLabel.text = ""
                    } else {
                        leftLabel.text = "The equation is done, press equal or clear"
                    }
                } else {
                    leftLabel.text = "There is already an operator there"
                }
            } else {
                leftLabel.text = "There arent any numbers"
            }
        }
    }
    @IBAction func add(_ sender: UIButton) {
        if !leftText.isEditing && !rightText.isEditing{
            if !empty{
                if calcText.text?.suffix(1) != "+" && calcText.text?.suffix(1) != "/" && calcText.text?.suffix(1) != "-" && calcText.text?.suffix(1) != "*"{
                    if !complete {

                    calcText.text = calcText.text! + "+"
                    operatorr = "+"
                    leftLabel.text = ""
                    } else {
                        leftLabel.text = "The equation is done, press equal or clear"
                    }
                } else {
                    leftLabel.text = "There is already an operator there"
                }
            } else {
                leftLabel.text = "There arent any numbers"
            }
        }
    }
//    @IBAction func sqrt(_ sender: UIButton) {
//        if !calcText.isEqual(""){
//            calcText.text = "√" + calcText.text!
//            operatorr = "√"
//            leftLabel.text = ""
//        } else {
//            leftLabel.text = "There arent any numbers"
//        }
//    }
    @IBAction func equal(_ sender: UIButton) {
        if !calcText.isEqual(""){
            if complete{
                calcText.text = calcText.text! + "="
                leftLabel.text = ""
                if operatorr == "+"{
                    calcText.text = calcText.text! + String(first + second)
                    complete = true
                }
                if operatorr == "-"{
                    calcText.text = calcText.text! + String(first - second)
                    complete = true

                }
                if operatorr == "*"{
                    calcText.text = calcText.text! + String(first * second)
                    complete = true

                }
                if operatorr == "/"{
                    calcText.text = calcText.text! + String(first / second)
                    complete = true

                }
            }
        } else {
            leftLabel.text = "There arent any numbers"
        }
    }
    @IBAction func clear(_ sender: UIButton) {
        calcText.text = ""
        leftLabel.text = ""
        empty = true
        leftText.text = ""
        rightText.text = ""
        first = 0
        second = 0
        operatorr = ""
    }
    
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        leftText.resignFirstResponder()
        rightText.resignFirstResponder()

    }
    
//    func createDisplayLink() {
//        let displayLink = CADisplayLink(target: self, selector: #selector(fire))
//        displayLink.add(to: .current, forMode: .common)
//    }
//    @objc func fire() {
//    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        rightText.resignFirstResponder()
        return leftText.resignFirstResponder()

    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if empty{
            if let blah = leftText.text{
                if (Int(blah) != nil){
                    calcText.text = calcText.text! + blah
                    first = Int(leftText.text!)!
                    empty = false
                    leftLabel.text = ""
                } else {
                    leftLabel.text = "Those arent numbers >:("
                    leftText.text = ""
                }
            }
        }
        if !empty{
            if calcText.text?.suffix(1) == "+" || calcText.text?.suffix(1) == "/" || calcText.text?.suffix(1) == "-" || calcText.text?.suffix(1) == "*"{
                print("yes")
                if let blah2 = rightText.text{
                    if (Int(blah2) != nil){
                        calcText.text = calcText.text! + blah2
                        second = Int(rightText.text!)!
                        leftLabel.text = ""
                        complete = true
                    } else {
                        leftLabel.text = "Those arent numbers >:("
                        rightText.text = ""
                    }
                }
            } else {
                if softfix{
                    leftLabel.text = "Put an operator first"
                } else {
                    softfix = true
                }
            }
        } else {
            leftLabel.text = "Put the first numbers first"
        }
    }

    


}

