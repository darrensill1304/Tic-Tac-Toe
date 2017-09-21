//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Darren Sill on 21/09/2017.
//  Copyright © 2017 darren.sill. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Results Label
    @IBOutlet weak var resultsLabel: UILabel!
    
    // variables
    var activeGame = true
    var whichPlayerTurn = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] // 0 = Empty, 1 = Noughts, 2 = Crosses
    
    let winningCombinations = [[0, 1, 2],[3, 4, 5], [6, 7, 8],[0, 3, 6],[1, 4, 7],[2, 5, 8],[0, 4, 8],[2, 4, 6]]
    
    @IBAction func ButtonPressed(_ sender: AnyObject) {
        
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame {
            
            gameState[activePosition] = whichPlayerTurn
            
            if whichPlayerTurn == 1{
                sender.setImage(UIImage(named: "nought.png"), for: [])
                whichPlayerTurn = 2
            } else {
                sender.setImage(UIImage(named: "cross.png"), for: [])
                whichPlayerTurn = 1
            }
            
            for combination in winningCombinations {
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                    
                    // Winner
                    
                    activeGame = false
                    
                    var winner: String
                    
                    if gameState[combination[0]] == 1 {
                        winner = "Noughts"
                    } else {
                        winner = "Crosses"
                    }
                    
                    resultsLabel.text = winner + " Wins!"
                    
                    UIView.animate(withDuration: 1, animations: {
                        self.resultsLabel.center = CGPoint(x: self.resultsLabel.center.x + 500, y: self.resultsLabel.center.y)
                    })
                    
                }
                
            }
            
        }
        
    }
    
    
    @IBAction func ResetButtonPressed(_ sender: Any) {
        
        for i in 1..<10 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [])
            }
        }
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        resultsLabel.text = ""
        resultsLabel.center = CGPoint(x: resultsLabel.center.x - 500, y: resultsLabel.center.y)
        
        activeGame = true
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resultsLabel.center = CGPoint(x: resultsLabel.center.x - 500, y: resultsLabel.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}


