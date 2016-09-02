//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Geoffrey Chen on 2016-09-02.
//  Copyright © 2016 PSI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        playerBarHeight.constant = view.bounds.height/12
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Mark: Outlets
    @IBOutlet weak var playerBar: UIView!
    
    
    //Mark: Constraints
    @IBOutlet weak var playerBarHeight: NSLayoutConstraint!
    
    var playerOneWinner = false
    var playerTwoWinner = false
    
    var playerOneA1: Bool? = nil
    var playerOneA2: Bool? = nil
    var playerOneA3: Bool? = nil
    var playerOneA4: Bool? = nil
    var playerOneA5: Bool? = nil
    var playerOneA6: Bool? = nil
    var playerOneA7: Bool? = nil
    var playerOneA8: Bool? = nil
    var playerOneA9: Bool? = nil
    
    
    func evaluate() {
        if playerOneA1 == true && playerOneA2 == true && playerOneA3 == true {
            print("Player 1 Wins by Row 1")
            playerOneWinner = true
        } else if playerOneA4 == true && playerOneA5 == true && playerOneA6 == true {
            print("Player 1 Wins by Row 2")
            playerOneWinner = true
        } else if playerOneA7 == true && playerOneA8 == true && playerOneA9 == true {
            print("Player 1 Wins by Row 3")
            playerOneWinner = true
        } else if playerOneA1 == true && playerOneA4 == true && playerOneA7 == true {
            print("Player 1 Wins by Column 1")
            playerOneWinner = true
        } else if playerOneA2 == true && playerOneA5 == true && playerOneA8 == true {
            print("Player 1 Wins by Column 2")
            playerOneWinner = true
        } else if playerOneA3 == true && playerOneA6 == true && playerOneA9 == true {
            print("Player 1 Wins by Column 3")
            playerOneWinner = true
        } else if playerOneA1 == true && playerOneA5 == true && playerOneA9 == true {
            print("Player 1 Wins by Diagonal 1")
            playerOneWinner = true
        } else if playerOneA3 == true && playerOneA5 == true && playerOneA7 == true {
            print("Player 1 Wins by Diagonal 2")
            playerOneWinner = true
        } else if playerOneA1 == false && playerOneA2 == false && playerOneA3 == false {
            print("Player 2 Wins by Row 1")
            playerTwoWinner = true
        } else if playerOneA4 == false && playerOneA5 == false && playerOneA6 == false {
            print("Player 2 Wins by Row 2")
            playerTwoWinner = true
        } else if playerOneA7 == false && playerOneA8 == false && playerOneA9 == false {
            print("Player 2 Wins by Row 3")
            playerTwoWinner = true
        } else if playerOneA1 == false && playerOneA4 == false && playerOneA7 == false {
            print("Player 2 Wins by Column 1")
            playerTwoWinner = true
        } else if playerOneA2 == false && playerOneA5 == false && playerOneA8 == false {
            print("Player 2 Wins by Column 2")
            playerTwoWinner = true
        } else if playerOneA3 == false && playerOneA6 == false && playerOneA9 == false {
            print("Player 2 Wins by Column 3")
            playerTwoWinner = true
        } else if playerOneA1 == false && playerOneA5 == false && playerOneA9 == false {
            print("Player 2 Wins by Diagonal 1")
            playerTwoWinner = true
        } else if playerOneA3 == false && playerOneA5 == false && playerOneA7 == false {
            print("Player 2 Wins by Diagonal 2")
            playerTwoWinner = true
        } else if playerOneWinner == false && playerTwoWinner == false {
            print("Cats Game")
        }
            
        }
    func winner() {
        if playerOneWinner == true {
            //Animate a win screen for player one
        } else if playerTwoWinner == true {
            //Animate a win screen for player two
        } else if playerOneWinner == false && playerTwoWinner == false {
            //Animate a Big C ontop of the entire game board.
        }
        
    }
    
    }




