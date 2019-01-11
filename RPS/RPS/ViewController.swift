//
//  ViewController.swift
//  RPS
//
//  Created by Louis Shinohara on 1/10/19.
//  Copyright © 2019 Louis Shinohara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        resetBoard()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var scissor: UIButton!
    @IBOutlet weak var playAgain: UIButton!
    
    func play(_ playerTurn: Sign) {
        rock.isEnabled = false
        paper.isEnabled = false
        scissor.isEnabled = false
        playAgain.isHidden = false
        
        let opponent = randomSign()
        appSign.text = opponent.emoji
        
        let gameResult = playerTurn.takeTurn(opponent)
        switch gameResult {
        case .draw:
            gameStatus.text = "It's a draw."
        case .win:
            gameStatus.text = "You Won!"
        case .lose:
            gameStatus.text = "You Lose"
        case .start:
            gameStatus.text = "Rock, Paper, Scissors?"
        }
        switch playerTurn {
        case .rock:
            rock.isHidden = false
            paper.isHidden = true
            scissor.isHidden = true
        case .paper:
            rock.isHidden = true
            paper.isHidden = false
            scissor.isHidden = true
        case .scissor:
            rock.isHidden = true
            paper.isHidden = true
            scissor.isHidden = false
        }
    }
    
    @IBAction func rockButton(_ sender: Any) {
        play(Sign.rock)
    }
    @IBAction func paperButton(_ sender: Any) {
        play(Sign.paper)
    }
    @IBAction func scissorButton(_ sender: Any) {
        play(Sign.scissor)
    }    
    @IBAction func playAgainButton(_ sender: Any) {
        resetBoard()
    }
    
    func resetBoard() {
        appSign.text = "🤖"
        gameStatus.text = "Rock, Paper, Scissors?"
        rock.isHidden = false
        rock.isEnabled = true
        paper.isHidden = false
        paper.isEnabled = true
        scissor.isHidden = false
        scissor.isEnabled = true
        playAgain.isHidden = true
        
    }
}

