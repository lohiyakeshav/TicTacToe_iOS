//
//  ViewController.swift
//  TicTacToe
//
//  Created by Batch-2 on 03/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        turnLabel.text = "Tic Tac Toe"
    }
    
    
    var grid = [0,0,0,0,0,0,0,0,0]
    var playerTurn = true
    var turnLeft = 9
    
    
    @IBAction func resetButton(_ sender: UIButton) {
        resetBoard()
    }
    
    func resetBoard(){
        grid = [0,0,0,0,0,0,0,0,0]
        playerTurn = true
        turnLeft = 9
        turnLabel.text = "X"
        for empty in boardButtons{
            empty.isEnabled = true
            empty.setImage(UIImage(systemName: "scribble"), for: .normal)
            
        }
        print(grid )
        
    }

    @IBOutlet weak var turnLabel: UILabel!
    

    
    @IBOutlet var boardButtons: [UIButton]!
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        sender.isEnabled = false
        turnLeft -= 1
        
        if playerTurn{
            sender.setImage(UIImage(systemName: "xmark"), for: .normal)
            turnLabel.text = "O"
            grid[sender.tag] = 1
        }else{
            sender.setImage(UIImage(systemName: "circle.fill"), for: .normal)
            grid[sender.tag] = -1
            turnLabel.text = "X"
        }
        playerTurn = !playerTurn
        checkStatusOfGame()
    }
    
    func checkStatusOfGame(){
        let r1 = grid[0] + grid [1] + grid[2]
        let r2 = grid[3] + grid [4] + grid[5]
        let r3 = grid[6] + grid [7] + grid[8]
        
        let c1 = grid[0] + grid [3] + grid[6]
        let c2 = grid[1] + grid [4] + grid[7]
        let c3 = grid[2] + grid [5] + grid[8]
        
        let d1 = grid[0] + grid [4] + grid[8]
        let d2 = grid[6] + grid [4] + grid[2]
        
        
        
        if (r1 == 3 || r2 == 3 || r3 == 3 || c1 == 3 || c2 == 3 || c3 == 3 || d1 == 3 || d2 == 3 ){
            print("P1 Winner")
            turnLabel.text = "P1 Winner"
            for button in boardButtons{
                button.isEnabled = false
            }
        }else if (r1 == -3 || r2 == -3 || r3 == -3 || c1 == -3 || c2 == -3 || c3 == -3 || d1 == -3 || d2 == -3 ){
            print("P2 Winner")
            turnLabel.text = "P2 Winner"
            for button in boardButtons{
                button.isEnabled = false
            }
        }
        else if turnLeft == 0 {
            print("Tie")
            turnLabel.text = "It's A Tie!"
        }
    }
    
  
    
}
