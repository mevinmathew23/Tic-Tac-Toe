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
        playGridWidth.constant = view.bounds.width/1.25
        
        playerBar.backgroundColor = red
        
        restartButton.hidden = true
        winLabel.hidden = true
        catsLabel.hidden = true
        
        setButton()
        setHeights()
        
    }
    
    func setHeights() {
        height0.constant = playGridWidth.constant/3
        height1.constant = playGridWidth.constant/3
        height2.constant = playGridWidth.constant/3
        height3.constant = playGridWidth.constant/3
        height5.constant = playGridWidth.constant/3
        height6.constant = playGridWidth.constant/3
        height7.constant = playGridWidth.constant/3
        height8.constant = playGridWidth.constant/3
    }
    func setButton() {
        restartWidth.constant = view.bounds.width/1.5
        restartButton.titleLabel?.minimumScaleFactor = 0.05
        restartButton.titleLabel?.numberOfLines = 1
        restartButton.titleLabel?.adjustsFontSizeToFitWidth = true
        restartButton.titleLabel?.textAlignment = NSTextAlignment.Center
        restartButton.titleLabel?.baselineAdjustment = UIBaselineAdjustment.AlignCenters
        
        winLabelWidth.constant = view.bounds.width/1.5
        winLabel.minimumScaleFactor = 0.05
        winLabel.adjustsFontSizeToFitWidth = true
        winLabel.textAlignment = NSTextAlignment.Center
        winLabel.baselineAdjustment = UIBaselineAdjustment.AlignCenters
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Mark: Outlets
    @IBOutlet weak var catsLabel: UILabel!
    @IBOutlet weak var catsLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var winLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var winLabelX: NSLayoutConstraint!
    @IBOutlet weak var playerBar: UIView!
    @IBOutlet weak var playGrid: UIView!
    @IBOutlet weak var playGridWidth: NSLayoutConstraint!
    @IBOutlet weak var height0: NSLayoutConstraint!
    @IBOutlet weak var height1: NSLayoutConstraint!
    @IBOutlet weak var height2: NSLayoutConstraint!
    @IBOutlet weak var height3: NSLayoutConstraint!
    @IBOutlet weak var height5: NSLayoutConstraint!
    @IBOutlet weak var height6: NSLayoutConstraint!
    @IBOutlet weak var height7: NSLayoutConstraint!
    @IBOutlet weak var height8: NSLayoutConstraint!
    @IBOutlet weak var square0: UIButton!
    @IBOutlet weak var square1: UIButton!
    @IBOutlet weak var square2: UIButton!
    @IBOutlet weak var square3: UIButton!
    @IBOutlet weak var square4: UIButton!
    @IBOutlet weak var square5: UIButton!
    @IBOutlet weak var square6: UIButton!
    @IBOutlet weak var square7: UIButton!
    @IBOutlet weak var square8: UIButton!
    
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var restartWidth: NSLayoutConstraint!
    
    let blue = UIColor(red: 0/255, green: 191/255, blue: 243/255, alpha: 1.0)
    let red = UIColor(red: 243/255, green: 46/255, blue: 0/255, alpha: 1.0)
    
    @IBAction func restartAction(sender: AnyObject) {
        isEven = false
        roundCount = 1
        playerOneWinner = false
        playerTwoWinner = false
        
        playerOneA1 = nil
        playerOneA2 = nil
        playerOneA3 = nil
        playerOneA4 = nil
        playerOneA5 = nil
        playerOneA6 = nil
        playerOneA7 = nil
        playerOneA8 = nil
        playerOneA9 = nil
    }
    
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
        roundCount += 1
        nextRound(roundCount)
        
        if isEven {
            
            UIView.animateWithDuration(0.5, animations: {
                self.playerBar.backgroundColor = self.blue
            })
        } else {
            UIView.animateWithDuration(0.5, animations: {
                self.playerBar.backgroundColor = self.red
            })
        }
        
        if playerOneA1 == true && playerOneA2 == true && playerOneA3 == true {
            print("Player 1 Wins by Row 1")
            playerOneWinner = true
            restartButton.hidden = false
            winner()
        } else if playerOneA4 == true && playerOneA5 == true && playerOneA6 == true {
            print("Player 1 Wins by Row 2")
            playerOneWinner = true
            restartButton.hidden = false
            winner()
        } else if playerOneA7 == true && playerOneA8 == true && playerOneA9 == true {
            print("Player 1 Wins by Row 3")
            playerOneWinner = true
            restartButton.hidden = false
            winner()
        } else if playerOneA1 == true && playerOneA4 == true && playerOneA7 == true {
            print("Player 1 Wins by Column 1")
            playerOneWinner = true
            restartButton.hidden = false
            winner()
        } else if playerOneA2 == true && playerOneA5 == true && playerOneA8 == true {
            print("Player 1 Wins by Column 2")
            playerOneWinner = true
            restartButton.hidden = false
            winner()
        } else if playerOneA3 == true && playerOneA6 == true && playerOneA9 == true {
            print("Player 1 Wins by Column 3")
            playerOneWinner = true
            restartButton.hidden = false
            winner()
        } else if playerOneA1 == true && playerOneA5 == true && playerOneA9 == true {
            print("Player 1 Wins by Diagonal 1")
            playerOneWinner = true
            restartButton.hidden = false
            winner()
        } else if playerOneA3 == true && playerOneA5 == true && playerOneA7 == true {
            print("Player 1 Wins by Diagonal 2")
            playerOneWinner = true
            restartButton.hidden = false
            winner()
        } else if playerOneA1 == false && playerOneA2 == false && playerOneA3 == false {
            print("Player 2 Wins by Row 1")
            playerTwoWinner = true
            restartButton.hidden = false
            winner()
        } else if playerOneA4 == false && playerOneA5 == false && playerOneA6 == false {
            print("Player 2 Wins by Row 2")
            playerTwoWinner = true
            restartButton.hidden = false
            winner()
        } else if playerOneA7 == false && playerOneA8 == false && playerOneA9 == false {
            print("Player 2 Wins by Row 3")
            playerTwoWinner = true
            restartButton.hidden = false
            winner()
        } else if playerOneA1 == false && playerOneA4 == false && playerOneA7 == false {
            print("Player 2 Wins by Column 1")
            playerTwoWinner = true
            restartButton.hidden = false
            winner()
        } else if playerOneA2 == false && playerOneA5 == false && playerOneA8 == false {
            print("Player 2 Wins by Column 2")
            playerTwoWinner = true
            restartButton.hidden = false
            winner()
        } else if playerOneA3 == false && playerOneA6 == false && playerOneA9 == false {
            print("Player 2 Wins by Column 3")
            playerTwoWinner = true
            restartButton.hidden = false
            winner()
        } else if playerOneA1 == false && playerOneA5 == false && playerOneA9 == false {
            print("Player 2 Wins by Diagonal 1")
            playerTwoWinner = true
            restartButton.hidden = false
            winner()
        } else if playerOneA3 == false && playerOneA5 == false && playerOneA7 == false {
            print("Player 2 Wins by Diagonal 2")
            playerTwoWinner = true
            restartButton.hidden = false
            winner()
        } else if playerOneWinner == false && playerTwoWinner == false && roundCount == 10 {
            print("Cats Game")
            restartButton.hidden = false
            winner()
        }
        
    }
    func winner() {
        winLabel.hidden = false
        if playerOneWinner == true {
            winLabel.textColor = red
            winLabel.text = "X WINS!"
            winLabel.transform = CGAffineTransformScale(self.winLabel.transform, 1.0, 1.0)
            
            
            //Animate a win screen for player one
            view.layoutIfNeeded()
            UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseOut, animations: {
                self.winLabel.transform = CGAffineTransformScale(self.winLabel.transform, 1.5, 1.5)
                }, completion: {
                    finished in
                    UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseIn, animations: {
                        self.winLabel.transform = CGAffineTransformScale(self.winLabel.transform, 0.667, 0.667)
                        }, completion: nil)
            })
            
        }
        if playerTwoWinner == true {
            winLabel.textColor = blue
            winLabel.text = "O WINS!"
            winLabel.transform = CGAffineTransformScale(self.winLabel.transform, 1.0, 1.0)
            winLabel.hidden = false
            
            //Animate a win screen for player two
            view.layoutIfNeeded()
            UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseOut, animations: {
                self.winLabel.transform = CGAffineTransformScale(self.winLabel.transform, 1.5, 1.5)
                }, completion: {
                    finished in
                    UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseIn, animations: {
                        self.winLabel.transform = CGAffineTransformScale(self.winLabel.transform, 0.667, 0.667)
                        }, completion: nil)
            })
        }
        if playerOneWinner == false && playerTwoWinner == false {
            //Animate a Big C ontop of the entire game board.
            catsLabel.hidden = false
            catsLabelWidth.constant = playGridWidth.constant
            catsLabel.transform = CGAffineTransformScale(self.winLabel.transform, 0.2, 0.2)
            view.layoutIfNeeded()
            UIView.animateWithDuration(1, animations: {
                self.catsLabel.transform = CGAffineTransformScale(self.winLabel.transform, 2.75, 2.75)
            })
        }
        
    }
    
    
    @IBAction func press0(sender: AnyObject) {
        if isEven == true {
            playerOneA1 = false
            square0.setBackgroundImage(UIImage(named: "0_o"), forState: .Normal)
        } else {
            playerOneA1 = true
            square0.setBackgroundImage(UIImage(named: "0_x"), forState: .Normal)
        }
        square0.userInteractionEnabled = false
        evaluate()
    }
    @IBAction func press1(sender: AnyObject) {
        if isEven {
            playerOneA2 = false
            square1.setBackgroundImage(UIImage(named: "1_o"), forState: .Normal)
        } else {
            playerOneA2 = true
            square1.setBackgroundImage(UIImage(named: "1_x"), forState: .Normal)
        }
        square1.userInteractionEnabled = false
        evaluate()
    }
    @IBAction func press2(sender: AnyObject) {
        if isEven {
            playerOneA3 = false
            
            square2.setBackgroundImage(UIImage(named: "2_o"), forState: .Normal)
        } else {
            playerOneA3 = true
            square2.setBackgroundImage(UIImage(named: "2_x"), forState: .Normal)
        }
        square2.userInteractionEnabled = false
        evaluate()
    }
    @IBAction func press3(sender: AnyObject) {
        if isEven {
            playerOneA4 = false
            square3.setBackgroundImage(UIImage(named: "3_o"), forState: .Normal)
        } else {
            playerOneA4 = true
            square3.setBackgroundImage(UIImage(named: "3_x"), forState: .Normal)
        }
        square3.userInteractionEnabled = false
        evaluate()
    }
    @IBAction func press4(sender: AnyObject) {
        if isEven {
            playerOneA5 = false
            square4.setBackgroundImage(UIImage(named: "4_o"), forState: .Normal)
        } else {
            playerOneA5 = true
            square4.setBackgroundImage(UIImage(named: "4_x"), forState: .Normal)
        }
        square4.userInteractionEnabled = false
        evaluate()
    }
    @IBAction func press5(sender: AnyObject) {
        if isEven {
            playerOneA6 = false
            square5.setBackgroundImage(UIImage(named: "5_o"), forState: .Normal)
        } else {
            playerOneA6 = true
            square5.setBackgroundImage(UIImage(named: "5_x"), forState: .Normal)
        }
        square5.userInteractionEnabled = false
        evaluate()
    }
    @IBAction func press6(sender: AnyObject) {
        if isEven {
            playerOneA7 = false
            square6.setBackgroundImage(UIImage(named: "6_o"), forState: .Normal)
        } else {
            playerOneA7 = true
            square6.setBackgroundImage(UIImage(named: "6_x"), forState: .Normal)
        }
        square6.userInteractionEnabled = false
        evaluate()
    }
    @IBAction func press7(sender: AnyObject) {
        if isEven {
            playerOneA8 = false
            square7.setBackgroundImage(UIImage(named: "7_o"), forState: .Normal)
        } else {
            playerOneA8 = true
            square7.setBackgroundImage(UIImage(named: "7_x"), forState: .Normal)
        }
        square7.userInteractionEnabled = false
        evaluate()
    }
    @IBAction func press8(sender: AnyObject) {
        if isEven {
            playerOneA9 = false
            square8.setBackgroundImage(UIImage(named: "8_o"), forState: .Normal)
        } else {
            playerOneA9 = true
            square8.setBackgroundImage(UIImage(named: "8_x"), forState: .Normal)
        }
        square8.userInteractionEnabled = false
        evaluate()
    }
    
    func nextRound(round: Int){
        if round % 2 == 0 {
            print("Round is even, player 2 bets")
            isEven = true
        } else {
            print("Round is odd, player 1 bets")
            isEven = false
        }
    }
    
}




