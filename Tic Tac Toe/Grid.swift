//
//  Grid.swift
//  War
//
//  Created by Apple Dev on 2016-08-12.
//  Copyright © 2016 Apple Dev. All rights reserved.
//

import UIKit

//Declaring classes to access values and functions.
let viewController = ViewController()

// Setting variables needed
var selectedO = [Int]()
var selectedX = [Int]()
var touchedGrid: Int? = nil
var isX: Bool? = nil
var isEven: Bool = false
var roundCount = 1

func resetChips() {
    selectedO = [Int]()
    selectedX = [Int]()
    touchedGrid = nil
    isX = nil
    isEven = false
    roundCount = 1
}

class Grid: UIView {
    
    // MARK: Properties
    
    var gridButtons = [UIButton]()
    
    let spacing = 0
    let gridCount = 9
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
        
        for x in 0..<gridCount {
            let button = UIButton()
            
            let gridImages = [UIImage(named: "0"), UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4"), UIImage(named: "5"), UIImage(named: "6"), UIImage(named: "7"), UIImage(named: "8")]
            let oImages = [UIImage(named: "0_o"), UIImage(named: "1_o"), UIImage(named: "2_o"), UIImage(named: "3_o"), UIImage(named: "4_o"), UIImage(named: "5_o"), UIImage(named: "6_o"), UIImage(named: "7_o"), UIImage(named: "8_o")]
            let xImages = [UIImage(named: "0_x"), UIImage(named: "1_x"), UIImage(named: "2_x"), UIImage(named: "3_x"), UIImage(named: "4_x"), UIImage(named: "5_x"), UIImage(named: "6_x"), UIImage(named: "7_x"), UIImage(named: "8_x")]
            
            //gridImages[x]?.description
            
            button.setImage(gridImages[x], forState: .Normal)
            button.setImage(oImages[x], forState: .Selected)
            button.setImage(xImages[x], forState: .Disabled)

            
            button.adjustsImageWhenHighlighted = false
            button.adjustsImageWhenDisabled = false
            button.showsTouchWhenHighlighted = false
            
            button.addTarget(self, action: #selector(Grid.gridButtonTapped(_:)), forControlEvents: .TouchDown)
            gridButtons += [button]
            addSubview(button)
        }
    }
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        //let width = (buttonSize * gridCount) + (spacing * (gridCount - 1))
        
        return CGSize(width: buttonSize*3, height: buttonSize*3)
    }
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0,y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus spacing.
        for (index, button) in gridButtons.enumerate() {
            if index < 3 {
                buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
                button.frame = buttonFrame
            } else if (index < 6) && (index >= 3) {
                buttonFrame.origin.y = CGFloat(1 * (buttonSize + spacing))
                buttonFrame.origin.x = CGFloat((index - 3) * (buttonSize + spacing))
                button.frame = buttonFrame
            } else if (index < 9) && (index >= 6) {
                buttonFrame.origin.y = CGFloat(2 * (buttonSize + spacing))
                buttonFrame.origin.x = CGFloat((index - 6) * (buttonSize + spacing))
                button.frame = buttonFrame
            }
        }
        updateButtonSelectionStates()
    }
    
    
    // MARK: Button Action
    func gridButtonTapped(button: UIButton) {
        
        touchedGrid = gridButtons.indexOf(button)!
        
        if isEven {
            selectedO.append(translate(gridButtons.indexOf(button)!))
            
            print("Button has been tapped!")
            for x in selectedO {
                print(String(x))
            }
        } else {
           selectedX.append(translate(gridButtons.indexOf(button)!))
            
            print("Button has been tapped!")
            for x in selectedX {
                print(String(x))
            }
        }
        
        updateButtonSelectionStates()
    }
    func updateButtonSelectionStates() {
        for (index, button) in gridButtons.enumerate() {
            
            if isEven {
                if selectedO.contains(index) {
                    button.enabled = false
                    button.userInteractionEnabled = false
                }
            } else {
                if selectedX.contains(index) {
                    button.selected = true
                    button.userInteractionEnabled = false
                }
        }
        dispatch_async(dispatch_get_main_queue(), {
            self.setNeedsLayout()
        });
        
        func chipButtonTapped(button: UIButton) {
            touchedGrid = gridButtons.indexOf(button)!
            selectedGrids.append(translate(gridButtons.indexOf(button)!))
            
            updateButtonSelectionStates()
        }
    }
    
    func whoBets(round: Int) -> Bool {
        if round % 2 == 0 {
            //print("Round is even, player 2 bets")
            isEven = true
            return isEven
        } else {
            //print("Round is odd, player 1 bets")
            isEven = false
            return isEven
        }
    }
}
