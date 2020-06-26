//
//  ViewController.swift
//  project2
//
//  Created by 정기웅 on 2020/06/26.
//  Copyright © 2020 정기웅. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var answer = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        
        button1.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.green.cgColor
        button2.layer.borderWidth = 1
        button2.layer.borderColor = UIColor.green.cgColor
        button3.layer.borderWidth = 1
        button3.layer.borderColor = UIColor.green.cgColor
        
        askQuestion()

    }

    func askQuestion(_: UIAlertAction! = nil) {
        countries.shuffle()
        answer = Int.random(in: 0...2)
        self.title = countries[answer].uppercased()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        
        button3.isHighlighted = true
        button3.setImage(UIImage(named: countries[10]), for: .highlighted)
        button3.setImage(UIImage(named: countries[10]), for: .selected)
        
    }
    
    
    @IBAction func btnClicked(_ sender: UIButton) {
        var alertTitle = ""
        
        
        if(sender.tag == answer) {
            score += 1
            alertTitle = "right"
        }
        else {
            score -= 1
            alertTitle = "wrong"
        }
        
        
        let ac = UIAlertController(title: alertTitle, message: "Score : \(score)", preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "continue", style: .default, handler: askQuestion))
        present(ac, animated: true, completion: nil)
    }
}

