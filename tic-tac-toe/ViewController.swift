//
//  ViewController.swift
//  Adatia_Shayn_Tic-Tac-Toe
//
//  Created by Period Two on 2019-03-22.
//  Copyright © 2019 Period Two. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        for hideButtons in positions {
            hideButtons.isEnabled = false
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
//declares outlets for each of the elements of the app that need to be manipulated throughout the program
    @IBOutlet var positions: [UIButton]!
    
    @IBOutlet weak var player1Label: UILabel!
    
    @IBOutlet weak var player1X: UIButton!
    
    @IBOutlet weak var player1Or: UILabel!
    
    @IBOutlet weak var player1Y: UIButton!
    
    @IBOutlet weak var player2Label: UILabel!
    
    @IBOutlet weak var startGameButton: UIButton!
    
    @IBOutlet weak var turnIndicator: UILabel!
    
    //disables game setup buttons and configures the game appropriately if the user chooses to be "X"
    @IBAction func player1XSelect(_ sender: UIButton) {
        player1X.isHidden = true
        player1Y.isHidden = true
        player1Or.isHidden = true
        let player1Letter = "X"
        let player2Letter = "O"
        player1Label.text = "Player 1: \(player1Letter)"
        player2Label.text = "Player 2: \(player2Letter)"
        for hideButtons in positions {
            hideButtons.isEnabled = true
        }
        turnIndicator.isHidden = false
    }
    
    //disables game setup buttons and configures the game appropriately if the user chooses to be "O"
    @IBAction func player1YSelect(_ sender: UIButton) {
        player1X.isHidden = true
        player1Y.isHidden = true
        player1Or.isHidden = true
        let player1Letter = "O"
        let player2Letter = "X"
        player1Label.text = "Player 1: \(player1Letter)"
        player2Label.text = "Player 2: \(player2Letter)"
        for hideButtons in positions {
            hideButtons.isEnabled = true
        }
        turnIndicator.isHidden = false
    }
    //enables the square positions and the game setup buttons once the user clicks start game
    @IBAction func startGame(_ sender: UIButton) {
        player1Label.isHidden = false
        player1X.isHidden = false
        player1Y.isHidden = false
        player1Or.isHidden = false
        player2Label.isHidden = false
        startGameButton.isHidden = true
    }
    
    //declares the turn of the game
    var playerTurn = 1
    
    //assigns the "X" and "O" images to their own respective variables
    var xImage = UIImage(named: "x-letter")
    var oImage = UIImage(named: "o-letter")
    
    //declares the winning combinations of the game
    let winningCombos = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    
    //creates arrays to store the squares that each player owns within a game
    var player1Squares: [Int] = []
    var player2Squares: [Int] = []
    
    //creates an outlet for the new game button
    @IBOutlet weak var newGame: UIButton!
    
    //resets all elements of the game to default when the new game button is pressed
    @IBAction func newGame(_ sender: UIButton) {
        player1Squares = []
        player2Squares = []
        for resetButtons in positions {
            resetButtons.setImage(nil, for: .normal)
        }
        player1X.isHidden = false
        player1Y.isHidden = false
        player1Or.isHidden = false
        playerTurn = 1
        newGame.isHidden = true
        turnIndicator.text = "Player 1's Turn"
        for reenableButtons in positions {
            reenableButtons.isUserInteractionEnabled = true
        }
    }
    
    //When a user clicks one of the positions, checks to see which players turn it is, updates the turn indicator, changes the position to the letter of the player, stores the position clicked in an array and disables the position so the other user cannot click it. Simultaneously checks to see if either user has achieved a winning combination and creates an alert box to be displayed if either user has won. Also checks to see if the game is a tie, in which case an appropriate alert box is displayed. When a player wins or a tie is reached, disables the positions, hides the turn indicator and reveals the new game button.
    @IBAction func changeLetter(_ sender: UIButton) {
        playerTurn += 1
        if playerTurn % 2 == 0 {
            turnIndicator.text = "Player 2's Turn"
            if player1Label.text == "Player 1: X" {
                UIButton.transition(with: sender, duration: 0.7, options: .transitionFlipFromLeft, animations: {sender.setImage(#imageLiteral(resourceName: "x-letter"), for: .normal)}, completion: nil)
            }
            else {
                UIButton.transition(with: sender, duration: 0.7, options: .transitionFlipFromLeft, animations: {sender.setImage(#imageLiteral(resourceName: "o-letter"), for: .normal)}, completion: nil)
            }
        } else {
            turnIndicator.text = "Player 1's Turn"
            if player2Label.text == "Player 2: X" {
                UIButton.transition(with: sender, duration: 0.7, options: .transitionFlipFromLeft, animations: {sender.setImage(#imageLiteral(resourceName: "x-letter"), for: .normal)}, completion: nil)
            }
            else {
                UIButton.transition(with: sender, duration: 0.7, options: .transitionFlipFromLeft, animations: {sender.setImage(#imageLiteral(resourceName: "o-letter"), for: .normal)}, completion: nil)
            }
        }
        
        switch player1Label.text {
        case "Player 1: X" :
        switch sender.currentTitle! {
        case "Position 1" :
            sender.isUserInteractionEnabled = false
            switch sender.currentImage! {
            case xImage :
                player1Squares.append(1)
            case oImage :
                player2Squares.append(1)
            default: break
            }
        case "Position 2" :
            sender.isUserInteractionEnabled = false
            switch sender.currentImage! {
            case xImage :
                player1Squares.append(2)
            case oImage :
                player2Squares.append(2)
            default: break
            }
        case "Position 3" :
            sender.isUserInteractionEnabled = false
            switch sender.currentImage! {
            case xImage :
                player1Squares.append(3)
            case oImage :
                player2Squares.append(3)
            default: break
            }
        case "Position 4" :
            sender.isUserInteractionEnabled = false
            switch sender.currentImage! {
            case xImage :
                player1Squares.append(4)
            case oImage :
                player2Squares.append(4)
            default: break
            }
        case "Position 5" :
            sender.isUserInteractionEnabled = false
            switch sender.currentImage! {
            case xImage :
                player1Squares.append(5)
            case oImage :
                player2Squares.append(5)
            default: break
            }
        case "Position 6" :
            sender.isUserInteractionEnabled = false
            switch sender.currentImage! {
            case xImage :
                player1Squares.append(6)
            case oImage :
                player2Squares.append(6)
            default: break
            }
        case "Position 7" :
            sender.isUserInteractionEnabled = false
            switch sender.currentImage! {
            case xImage :
                player1Squares.append(7)
            case oImage :
                player2Squares.append(7)
            default: break
            }
        case "Position 8" :
            sender.isUserInteractionEnabled = false
            switch sender.currentImage! {
            case xImage :
                player1Squares.append(8)
            case oImage :
                player2Squares.append(8)
            default: break
            }
        case "Position 9" :
            sender.isUserInteractionEnabled = false
            switch sender.currentImage! {
            case xImage :
                player1Squares.append(9)
            case oImage :
                player2Squares.append(9)
            default: break
            }
            
        default: break
    }
        case "Player 1: O" :
        switch sender.currentTitle! {
        case "Position 1" :
            sender.isUserInteractionEnabled = false
            switch sender.currentImage! {
            case oImage :
                player1Squares.append(1)
            case xImage :
                player2Squares.append(1)
            default: break
            }
        case "Position 2" :
            sender.isUserInteractionEnabled = false
            switch sender.currentImage! {
            case oImage :
                player1Squares.append(2)
            case xImage :
                player2Squares.append(2)
            default: break
            }
        case "Position 3" :
            sender.isUserInteractionEnabled = false
            switch sender.currentImage! {
            case oImage :
                player1Squares.append(3)
            case xImage :
                player2Squares.append(3)
            default: break
            }
        case "Position 4" :
            sender.isUserInteractionEnabled = false
            switch sender.currentImage! {
            case oImage :
                player1Squares.append(4)
            case xImage :
                player2Squares.append(4)
            default: break
            }
        case "Position 5" :
            sender.isUserInteractionEnabled = false
            switch sender.currentImage! {
            case oImage :
                player1Squares.append(5)
            case xImage :
                player2Squares.append(5)
            default: break
            }
        case "Position 6" :
            sender.isUserInteractionEnabled = false
            switch sender.currentImage! {
            case oImage :
                player1Squares.append(6)
            case xImage :
                player2Squares.append(6)
            default: break
            }
        case "Position 7" :
            sender.isUserInteractionEnabled = false
            switch sender.currentImage! {
            case oImage :
                player1Squares.append(7)
            case xImage :
                player2Squares.append(7)
            default: break
            }
        case "Position 8" :
            sender.isUserInteractionEnabled = false
            switch sender.currentImage! {
            case oImage :
                player1Squares.append(8)
            case xImage :
                player2Squares.append(8)
            default: break
            }
        case "Position 9" :
            sender.isUserInteractionEnabled = false
            switch sender.currentImage! {
            case oImage :
                player1Squares.append(9)
            case xImage :
                player2Squares.append(9)
            default: break
            }
        default: break
        }
        default: break
        }
        
        func win (player: Int) {
            let alertController = UIAlertController(title: "Game Over", message:
                "Player \(player) wins! Better luck next time loser :(", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Play again", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
        
        let player1combo1 = Set(player1Squares).isSuperset(of: winningCombos[0])
        let player1combo2 = Set(player1Squares).isSuperset(of: winningCombos[1])
        let player1combo3 = Set(player1Squares).isSuperset(of: winningCombos[2])
        let player1combo4 = Set(player1Squares).isSuperset(of: winningCombos[3])
        let player1combo5 = Set(player1Squares).isSuperset(of: winningCombos[4])
        let player1combo6 = Set(player1Squares).isSuperset(of: winningCombos[5])
        let player1combo7 = Set(player1Squares).isSuperset(of: winningCombos[6])
        let player1combo8 = Set(player1Squares).isSuperset(of: winningCombos[7])
        
        let player2combo1 = Set(player2Squares).isSuperset(of: winningCombos[0])
        let player2combo2 = Set(player2Squares).isSuperset(of: winningCombos[1])
        let player2combo3 = Set(player2Squares).isSuperset(of: winningCombos[2])
        let player2combo4 = Set(player2Squares).isSuperset(of: winningCombos[3])
        let player2combo5 = Set(player2Squares).isSuperset(of: winningCombos[4])
        let player2combo6 = Set(player2Squares).isSuperset(of: winningCombos[5])
        let player2combo7 = Set(player2Squares).isSuperset(of: winningCombos[6])
        let player2combo8 = Set(player2Squares).isSuperset(of: winningCombos[7])
        
        if player1combo1 == true || player1combo2 == true || player1combo3 == true || player1combo4 == true || player1combo5 == true || player1combo6 == true || player1combo7 == true || player1combo8 == true {
            win(player: 1)
            newGame.isHidden = false
            for hideButtons in positions {
                hideButtons.isEnabled = false
            }
            turnIndicator.isHidden = true
        } else if player2combo1 == true || player2combo2 == true || player2combo3 == true || player2combo4 == true || player2combo5 == true || player2combo6 == true || player2combo7 == true || player2combo8 == true {
            win(player: 2)
            newGame.isHidden = false
            for hideButtons in positions {
                hideButtons.isEnabled = false
            }
            turnIndicator.isHidden = true
        } else if playerTurn == 10 {
            let alertController = UIAlertController(title: "Game Over", message:
                "Tie! Learn to play better!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Play again", style: .default))
            self.present(alertController, animated: true, completion: nil)
            newGame.isHidden = false
            for hideButtons in positions {
                hideButtons.isEnabled = false
            }
            turnIndicator.isHidden = true
        }
    }
}
