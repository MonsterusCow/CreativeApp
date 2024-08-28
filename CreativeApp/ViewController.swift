//  Created by RYAN STARK on 8/22/24.

import UIKit
import Foundation

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var rightText: UITextField!
    @IBOutlet weak var leftText: UITextField!
    @IBOutlet weak var calcText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDisplayLink()
        rightText.delegate = self
        leftText.delegate = self

    }
    
    @IBAction func divide(_ sender: UIButton) {
    }
    @IBAction func multiply(_ sender: UIButton) {
    }
    @IBAction func minus(_ sender: UIButton) {
    }
    @IBAction func add(_ sender: UIButton) {
    }
    @IBAction func percent(_ sender: UIButton) {
    }
    @IBAction func sqrt(_ sender: UIButton) {
    }
    @IBAction func equal(_ sender: UIButton) {
    }
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        leftText.resignFirstResponder()
        rightText.resignFirstResponder()

    }
    
    func createDisplayLink() {
        let displayLink = CADisplayLink(target: self, selector: #selector(fire))
        displayLink.add(to: .current, forMode: .common)
    }
    @objc func fire() {
        calcText.text = leftText.text ?? "0"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        rightText.resignFirstResponder()
        return leftText.resignFirstResponder()

    }
    //poopoo

    


}

