//
//  Chips.swift
//  War
//
//  Created by Apple Dev on 2016-08-12.
//  Copyright © 2016 Apple Dev. All rights reserved.
//

import UIKit

//Declaring classes to access values and functions.
let viewController = ViewController()

// Setting variables needed
var selectedChips = [Int]()
var touchedChip: Int? = nil
var totalBet: Int = 0
var isSolo: Bool! = false
var isEven: Bool! = false
var isBettingPhase: Bool! = true
var roundCount = 1

var sFX = Settings().defaults.boolForKey("soundFX")
var mute = Settings().defaults.boolForKey("Mute")

let sounds = Sounds()
let audio = Audio()


//Function for betting.
func betSum() {
    totalBet = 0
    for chips in selectedChips {
        totalBet += chips
    }
}
func resetChips() {
    selectedChips = [Int]()
    touchedChip = nil
    totalBet = 0
    isSolo = false
    isEven = false
    isBettingPhase = true
    roundCount = 1
}

class Chips: UIView {
    
    // MARK: Properties
    
    var chipButtons = [UIButton]()
    
    let spacing = 0
    let chipCount = 5
    var isHighlighted: Bool = false
    
    func translate(index: Int) -> Int {
        switch index {
        case 0:
            return 5
        case 1:
            return 10
        case 2:
            return 20
        case 3:
            return 50
        case 4:
            return 100
        default:
            return 0
        }
    }

    
    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        for x in 0..<chipCount {
            let button = UIButton()
            
            var chipImages = [UIImage(named: "bet5"), UIImage(named: "bet10"), UIImage(named: "bet20"), UIImage(named: "bet50"), UIImage(named: "bet100")]
            
            chipImages[x]?.description
            
            button.setImage(chipImages[x], forState: .Normal)

            
            button.adjustsImageWhenHighlighted = true
            button.adjustsImageWhenDisabled = true
            button.showsTouchWhenHighlighted = true
            
            button.addTarget(self, action: #selector(Chips.chipButtonTapped(_:)), forControlEvents: .TouchDown)
            chipButtons += [button]
            addSubview(button)
        }
    }
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize * chipCount) + (spacing * (chipCount - 1))
        
        return CGSize(width: width, height: buttonSize)
    }
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0,y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus spacing.
        for (index, button) in chipButtons.enumerate() {
            if index < 3 {
                buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
                button.frame = buttonFrame
            } else {
                buttonFrame.origin.y = CGFloat(1 * (buttonSize + spacing))
                buttonFrame.origin.x = CGFloat((Double(index) - 2.5) * Double((buttonSize + spacing)))
                button.frame = buttonFrame
            }
        }
        updateButtonSelectionStates()
    }
    
    func updateChipSounds() {
        sFX = Settings().defaults.boolForKey("soundFX")
    }

    
    
    // MARK: Button Action
    func chipButtonTapped(button: UIButton) {
        updateChipSounds()
        if sFX == false {
            sounds.readFileIntoAVPlayer("chipsToss", volume: 1.0)
            sounds.toggleAVPlayer()
        }
        
        
        
        touchedChip = chipButtons.indexOf(button)!
        selectedChips.append(translate(chipButtons.indexOf(button)!))
        
        print("Button has been tapped!")
        for chips in selectedChips {
            print(String(chips))
        }
        
        updateButtonSelectionStates()
    }
    func updateButtonSelectionStates() {
        betSum()
        for (index, button) in chipButtons.enumerate() {
            
            if isSolo == false {
                button.enabled = (playerOneMoney >= translate(index) && totalBet <= playerOneMoney - translate(index)) && (playerTwoMoney >= translate(index) && totalBet <= playerTwoMoney - translate(index))
                whoBets(roundCount)
            } else {
                button.enabled = (playerOneMoney >= translate(index) && totalBet <= playerOneMoney - translate(index)) && (playerTwoMoney >= translate(index) && totalBet <= playerTwoMoney - translate(index))
            }
            
            button.selected = index == touchedChip
        }
        dispatch_async(dispatch_get_main_queue(), {
            self.setNeedsLayout()
        });
        
        func chipButtonTapped(button: UIButton) {
            if sFX == false {
                sounds.readFileIntoAVPlayer("chipsToss", volume: 1.0)
                sounds.toggleAVPlayer()
            }
            touchedChip = chipButtons.indexOf(button)!
            selectedChips.append(translate(chipButtons.indexOf(button)!))
            
            updateButtonSelectionStates()
        }
    }
    
    func whoBets(round: Int) -> Int {
        if round % 2 == 0 {
            //print("Round is even, player 2 bets")
            isEven = true
            return playerTwoMoney
        } else {
            //print("Round is odd, player 1 bets")
            isEven = false
            return playerOneMoney
        }
    }
}
