//
//  ViewController.swift
//  CardGame
//
//  Created by 钢铁侠 on 2020/10/8.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var player1card1: UIImageView!
    @IBOutlet weak var player1card2: UIImageView!
    @IBOutlet weak var player1card3: UIImageView!
    @IBOutlet weak var player2card1: UIImageView!
    @IBOutlet weak var player2card2: UIImageView!
    @IBOutlet weak var player2card3: UIImageView!
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    @IBAction func playAction(_ sender: Any) {
        var cards = Set<String>()
        while(cards.count < 6){
            let char = arc4random() % 4
            var card = ""
            switch char {
            case 0:
                do{
                    card = "C"
                }
            case 1:
                do{
                    card = "D"
                }
            case 2:
                do{
                    card = "S"
                }
            case 3:do{
                card = "H"
            }
            default:
                card = "S"
            }
            let num = arc4random()%13
            switch num {
            case 0:
                do{
                   card = "A" + card
                }
            case 10:do{
                card = "J" + card
            }
            case 11: do{
                card = "Q" + card
            }
            case 12: do{
                card = "K" + card
            }
            default:
                card = "\(num + 1)" + card
            }
            cards.insert(card)
        }
        var arr = Array(cards)
        if(!arr.contains("AS")){
            winnerLabel.text = "no one wins"
        }
        player1card1.image = UIImage(named: arr[0])
        player1card2.image = UIImage(named: arr[1])
        player1card3.image = UIImage(named: arr[2])
        player2card1.image = UIImage(named: arr[3])
        player2card2.image = UIImage(named: arr[4])
        player2card3.image = UIImage(named: arr[5])
        if(arr[0] == "AS" || arr[1] == "AS" || arr[2] == "AS"){
            winnerLabel.text = "player1 wins!!!!!"
        }
        if(arr[3] == "AS" || arr[4] == "AS" || arr[5] == "AS"){
            winnerLabel.text = "player2 wins!!!!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        player1card1.image = #imageLiteral(resourceName: "green_back")
        player1card2.image = #imageLiteral(resourceName: "green_back")
        player1card3.image = #imageLiteral(resourceName: "green_back")
        player2card1.image = #imageLiteral(resourceName: "purple_back")
        player2card2.image = #imageLiteral(resourceName: "purple_back")
        player2card3.image = #imageLiteral(resourceName: "purple_back")
    }


}

