//
//  ViewController.swift
//
//  Created by Richard Groeneveld on 1/17/23.
//
//  Based on code by Dogukan Yolcuoglu
//  https://github.com/dogukanyolcuoglu/TasKagitMakas

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    var myPoints = 0
    var pcPoints = 0
    var cumulativePc :Int{
        get {
            // Get the standard UserDefaults as "defaults"
            let defaults = UserDefaults.standard
            
            // Makes the "welcomeString" variable whatever the saved value for "welcome_string" is
            return defaults.integer(forKey: "Cumulativepc")
        }
        set (newValue) {
            // Get the standard UserDefaults as "defaults"
            let defaults = UserDefaults.standard
            
            // Saves what the highScore variable was just set to as the saved value for "Best"
            defaults.set(newValue, forKey: "Cumulativepc")
        }
    }
    //var cumulativeMy = 0
    var cumulativeMy :Int{
        get {
            // Get the standard UserDefaults as "defaults"
            let defaults = UserDefaults.standard
            
            // Makes the "welcomeString" variable whatever the saved value for "welcome_string" is
            return defaults.integer(forKey: "Cumulativemy")
        }
        set (newValue) {
            // Get the standard UserDefaults as "defaults"
            let defaults = UserDefaults.standard
            
            // Saves what the highScore variable was just set to as the saved value for "Best"
            defaults.set(newValue, forKey: "Cumulativemy")
        }
    }
    //var cumulativeRecord = 0.0
    var cumulativeRecord :Double{
        get {
            return Double(cumulativeMy)/(Double(cumulativeMy)+Double(cumulativePc))*100
        }
        set (newValue) {
                                    }
    }
    
    let array = ["Rock","Paper","Scissors"]
    
    // MARK: - IBOutlets
    @IBOutlet weak var myChoiseLabel: UILabel!
    @IBOutlet weak var pcChoiseLabel: UILabel!
    @IBOutlet weak var theEndLabel: UILabel!
    @IBOutlet weak var myPointsLabel: UILabel!
    @IBOutlet weak var pcPointsLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playAgain: UILabel!
    @IBOutlet weak var winPercentage: UILabel!
    // MARK: - IBActions
    
    @IBAction func rockSelected(_ sender: Any) {
        self.setwinPercentage()
        let randomSelected = Int(arc4random_uniform(3)) // 0,1,2
        let pcSelected = array[randomSelected] 
        
        if pcSelected == "Rock" {
            if pcPoints >= 10 || myPoints >= 10{
                myChoiseLabel.text = ""
                pcChoiseLabel.text = ""
                theEndLabel.text = ""
            }
            else{
                myChoiseLabel.text = "You picked : Rock"
                pcChoiseLabel.text = "Computer picked : Rock"
                theEndLabel.text = "You Tied!"
            }
            
        }else if pcSelected == "Paper" {
            myChoiseLabel.text = "You picked : Rock"
            pcChoiseLabel.text = "Computer picked : Paper"
            theEndLabel.text = "You Lost!"
            if myPoints < 10 && pcPoints < 10{
                pcPoints += 1
                cumulativePc += 1
                cumulativeRecord = Double(cumulativeMy)/(Double(cumulativeMy)+Double(cumulativePc))*100
            }
            else if (pcPoints >= 10 || myPoints >= 10) && pcPoints > myPoints{
                winnerLabel.text = "Computer Wins!"
                playAgain.text = "Press reset to play again."
                myChoiseLabel.text = ""
                pcChoiseLabel.text = ""
                theEndLabel.text = ""
            }
            else if (pcPoints >= 10 || myPoints >= 10) && myPoints > pcPoints {
                winnerLabel.text = "You Won!"
                playAgain.text = "Press reset to play again."
                myChoiseLabel.text = ""
                pcChoiseLabel.text = ""
                theEndLabel.text = ""
            }
            else{
                myChoiseLabel.text = ""
                pcChoiseLabel.text = ""
                theEndLabel.text = ""
            }
            pcPointsLabel.text = String(pcPoints)
            winPercentage.text = "Your Win Percentage: " + String(cumulativeRecord) + "%"
            
        }else if pcSelected == "Scissors" {
            myChoiseLabel.text = "You picked : Rock"
            pcChoiseLabel.text = "Computer picked : Scissors"
            theEndLabel.text = "You Won!"
            if myPoints < 10 && pcPoints < 10{
                myPoints += 1
                cumulativeMy += 1
                cumulativeRecord = Double(cumulativeMy)/(Double(cumulativeMy)+Double(cumulativePc))*100
            }
            else if (pcPoints >= 10 || myPoints >= 10) && myPoints > pcPoints {
                winnerLabel.text = "You Won!"
                playAgain.text = "Press reset to play again."
                myChoiseLabel.text = ""
                pcChoiseLabel.text = ""
                theEndLabel.text = ""
            }
            else if (pcPoints >= 10 || myPoints >= 10) && myPoints < pcPoints {
                winnerLabel.text = "Computer Wins!"
                playAgain.text = "Press reset to play again."
                myChoiseLabel.text = ""
                pcChoiseLabel.text = ""
                theEndLabel.text = ""
            }
            else{
                myChoiseLabel.text = ""
                pcChoiseLabel.text = ""
                theEndLabel.text = ""
            }
            
            myPointsLabel.text = String(myPoints)
            winPercentage.text = "Your Win Percentage: " + String(cumulativeRecord) + "%"
            
        }
    }
    
    
    // Paper ile ilgili işlemler
    @IBAction func paperSelected(_ sender: Any) {
        
        let randomSelected = Int(arc4random_uniform(3)) // 0,1,2
        let pcSelected = array[randomSelected]
        
        if pcSelected == "Rock" {
            myChoiseLabel.text = "You picked : Paper"
            pcChoiseLabel.text = "Computer picked : Rock"
            theEndLabel.text = "You Won!"
            if myPoints < 10 && pcPoints < 10{
                myPoints += 1
                cumulativeMy += 1
                cumulativeRecord = Double(cumulativeMy)/(Double(cumulativeMy)+Double(cumulativePc))*100
            }
            else if (pcPoints >= 10 || myPoints >= 10) && myPoints > pcPoints {
                winnerLabel.text = "You Won!"
                playAgain.text = "Press reset to play again."
                myChoiseLabel.text = ""
                pcChoiseLabel.text = ""
                theEndLabel.text = ""
            }
            else if (pcPoints >= 10 || myPoints >= 10) && myPoints < pcPoints {
                winnerLabel.text = "Computer Wins!"
                playAgain.text = "Press reset to play again."
                myChoiseLabel.text = ""
                pcChoiseLabel.text = ""
                theEndLabel.text = ""
            }
            else{
                myChoiseLabel.text = ""
                pcChoiseLabel.text = ""
                theEndLabel.text = ""
            }
            myPointsLabel.text = String(myPoints)
            winPercentage.text = "Your Win Percentage: " + String(cumulativeRecord) + "%"
            
            
        }else if pcSelected == "Paper" {
            if pcPoints >= 10 || myPoints >= 10{
                myChoiseLabel.text = ""
                pcChoiseLabel.text = ""
                theEndLabel.text = ""
            }
            else{
                myChoiseLabel.text = "You picked : Paper"
                pcChoiseLabel.text = "Computer picked : Paper"
                theEndLabel.text = "You Tied!"
            }
            
        }else if pcSelected == "Scissors" {
            
            myChoiseLabel.text = "You picked : Paper"
            pcChoiseLabel.text = "Computer picked : Scissors"
            theEndLabel.text = "You Lost!"
            if myPoints < 10 && pcPoints < 10{
                pcPoints += 1
                cumulativePc += 1
                cumulativeRecord = Double(cumulativeMy)/(Double(cumulativeMy)+Double(cumulativePc))*100
            }
            else if (pcPoints >= 10 || myPoints >= 10) && pcPoints > myPoints{
                winnerLabel.text = "Computer Wins!"
                playAgain.text = "Press reset to play again."
                myChoiseLabel.text = ""
                pcChoiseLabel.text = ""
                theEndLabel.text = ""
            }
            else if (pcPoints >= 10 || myPoints >= 10) && myPoints > pcPoints {
                winnerLabel.text = "You Won!"
                playAgain.text = "Press reset to play again."
                myChoiseLabel.text = ""
                pcChoiseLabel.text = ""
                theEndLabel.text = ""
            }
            else{
                myChoiseLabel.text = ""
                pcChoiseLabel.text = ""
                theEndLabel.text = ""
            }
            pcPointsLabel.text = String(pcPoints)
            winPercentage.text = "Your Win Percentage: " + String(cumulativeRecord) + "%"
            
        }
        
    }
    
    // Scissors ile ilgili işlemler
    @IBAction func scissorSelected(_ sender: Any) {
        
        let randomSelected = Int(arc4random_uniform(3)) // 0,1,2
        let pcSelected = array[randomSelected]
        
        if pcSelected == "Rock" {
            myChoiseLabel.text = "You picked : Scissors"
            pcChoiseLabel.text = "Computer picked : Rock"
            theEndLabel.text = "You Lost!"
            if myPoints < 10 && pcPoints < 10{
                pcPoints += 1
                cumulativePc += 1
                cumulativeRecord = Double(cumulativeMy)/(Double(cumulativeMy)+Double(cumulativePc))*100
            }
            else if (pcPoints >= 10 || myPoints >= 10) && pcPoints > myPoints {
                winnerLabel.text = "Computer Wins!"
                playAgain.text = "Press reset to play again."
                myChoiseLabel.text = ""
                pcChoiseLabel.text = ""
                theEndLabel.text = ""
            }
            else if (pcPoints >= 10 || myPoints >= 10) && myPoints > pcPoints {
                winnerLabel.text = "You Won!"
                playAgain.text = "Press reset to play again."
                myChoiseLabel.text = ""
                pcChoiseLabel.text = ""
                theEndLabel.text = ""
            }
            else{
                myChoiseLabel.text = ""
                pcChoiseLabel.text = ""
                theEndLabel.text = ""
            }
            
            pcPointsLabel.text = String(pcPoints)
            winPercentage.text = "Your Win Percentage: " + String(cumulativeRecord) + "%"
            
            
        }else if pcSelected == "Paper" {
            myChoiseLabel.text = "You picked : Scissors"
            pcChoiseLabel.text = "Computer picked : Paper"
            theEndLabel.text = "You Won!"
            if myPoints < 10 && pcPoints < 10{
                myPoints += 1
                cumulativeMy += 1
                cumulativeRecord = Double(cumulativeMy)/(Double(cumulativeMy)+Double(cumulativePc))*100
            }
            else if (pcPoints >= 10 || myPoints >= 10) && myPoints > pcPoints {
                winnerLabel.text = "You Won!"
                playAgain.text = "Press reset to play again."
                myChoiseLabel.text = ""
                pcChoiseLabel.text = ""
                theEndLabel.text = ""
            }
            else if (pcPoints >= 10 || myPoints >= 10) && myPoints < pcPoints {
                winnerLabel.text = "Computer Wins!"
                playAgain.text = "Press reset to play again."
                myChoiseLabel.text = ""
                pcChoiseLabel.text = ""
                theEndLabel.text = ""
            }
            else{
                myChoiseLabel.text = ""
                pcChoiseLabel.text = ""
                theEndLabel.text = ""
            }
            myPointsLabel.text = String(myPoints)
            winPercentage.text = "Your Win Percentage: " + String(cumulativeRecord) + "%"
           
            
        }else if pcSelected == "Scissors" {
            if pcPoints >= 10 || myPoints >= 10{
                myChoiseLabel.text = ""
                pcChoiseLabel.text = ""
                theEndLabel.text = ""
            }
            else{
                myChoiseLabel.text = "You picked : Scissors"
                pcChoiseLabel.text = "Computer picked : Scissors"
                theEndLabel.text = "You Tied!"
            }
        }
        
    }
    
    @IBAction func ResetButton(_ sender: Any) {
        theEndLabel.text = ""
        myChoiseLabel.text = "You picked : "
        pcChoiseLabel.text = "Computer picked : "
        myPoints = 0
        pcPoints = 0
        myPointsLabel.text = String(myPoints)
        pcPointsLabel.text = String(pcPoints)
        winnerLabel.text = "First one to ten wins!"
        winPercentage.text = "Your Win Percentage: " + String(cumulativeRecord) + "%"
        playAgain.text = " "
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func setwinPercentage() -> Void {
        winPercentage.text = "Your Win Percentage: " + String(cumulativeRecord) + "%"
    }


}

