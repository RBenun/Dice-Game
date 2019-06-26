//
//  ViewController.swift
//  Dice
//
//  Created by n on 6/24/19.
//  Copyright © 2019 ronniebenun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dice1ImageView: UIImageView!
    @IBOutlet weak var dice2ImageView: UIImageView!
    @IBOutlet weak var outcomeLabel: UILabel!
    @IBAction func rollDie(_ sender: UIButton) {
        let dice1Roll = arc4random_uniform(6) + 1
        let dice2Roll = arc4random_uniform(6) + 1
        let rollSum = dice1Roll + dice2Roll
        UIView.transition(with: dice1ImageView, duration: 0.3, options: .transitionFlipFromTop, animations: {}, completion: nil)
        UIView.transition(with: dice2ImageView, duration: 0.3, options: .transitionFlipFromLeft, animations: {}, completion: nil)
        dice1ImageView.image = UIImage(named: "\(dice1Roll)")
        dice2ImageView.image = UIImage(named: "\(dice2Roll)")
        switch rollSum {
        case 7, 11:
            outcomeLabel.text = "\(rollSum): PASS"
            toggleAlphas(diceAlpha: 1, labelAlpha: 1)
        case 2, 3, 12:
            outcomeLabel.text = "\(rollSum): CRAPS"
            toggleAlphas(diceAlpha: 1, labelAlpha: 1)
        default:
            outcomeLabel.text = "\(rollSum): LOSE"
            toggleAlphas(diceAlpha: 1, labelAlpha: 1)
        }
    }
    func toggleAlphas(diceAlpha: CGFloat, labelAlpha: CGFloat){
        dice1ImageView.alpha = diceAlpha
        dice2ImageView.alpha = diceAlpha
        outcomeLabel.alpha = labelAlpha
    }
    
    
    
override func viewDidLoad() {
        toggleAlphas(diceAlpha: 0, labelAlpha: 0)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

