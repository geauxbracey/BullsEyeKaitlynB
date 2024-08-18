//
//  ViewController.swift
//  BullsEyeKaitlynB
//
//  Created by Kaitlyn Bracey on 8/18/24.
//

import UIKit

class ViewController: UIViewController {
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       startNewGame()
        //replaced the random number generator code with call to method instead
    }
    
    @IBAction func showAlert(){
        // action method
        let difference = abs(targetValue - currentValue)
        //difference now a constant rather than variable
        var points = 100 - difference
        
        //adds points to total score
        
        // difference *= -1 is same thing as saying difference = difference * -1
        // could also use if statement to make difference always positive
        
        let title: String
        if difference == 0 {
            title = "Unbelievable!"
            points += 100
        } else if difference < 5 {
            title = "Aaaalmost there"
            if difference == 1{
                points += 50
            }
            // if statement within if statement
        } else if difference < 10{
            title = "You could've done better than that"
        } else {
            title = "That was so embarrassing for you"
        }
        score += points
        
        let message = "You scored \(points) points"
            // \n = new line
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "OK",
            style: .default) {_ in
                self.startNewRound()}
        // got rid of handler call above
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        //startNewRound() I placed the call to startNewRound inside the closure above and got rid of this line
    }
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf (slider.value)
    }
    
    
    
    func startNewRound() {
        // this method repeats the cycle of the game to generate new numbers for the user
        round += 1
            //updates number of rounds there have been
        targetValue = Int.random (in:1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    @IBAction func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
    func updateLabels() {
        // using this method in tandem with startNewRound so called this method in startNewRound
        targetLabel.text = String (targetValue)
            // converts int to string
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}
