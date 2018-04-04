//
//  PickAPairViewController.swift
//  DemoGamePickAPair
//
//  Created by Chao Shin on 2018/4/4.
//  Copyright © 2018 Chao Shin. All rights reserved.
//

import UIKit
import GameplayKit

class PickAPairViewController: UIViewController {
    @IBOutlet weak var spendTime: UILabel!
    @IBOutlet weak var numberOfTimes: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var card1Button: UIButton!
    @IBOutlet weak var card2Button: UIButton!
    @IBOutlet weak var card3Button: UIButton!
    @IBOutlet weak var card4Button: UIButton!
    @IBOutlet weak var card5Button: UIButton!
    @IBOutlet weak var card6Button: UIButton!
    @IBOutlet weak var card7Button: UIButton!
    @IBOutlet weak var card8Button: UIButton!
    @IBOutlet weak var card9Button: UIButton!
    @IBOutlet weak var card10Button: UIButton!
    @IBOutlet weak var card11Button: UIButton!
    @IBOutlet weak var card12Button: UIButton!
    
    enum CardPosition:Int {
        case card1 = 0, card2 = 1 , card3 = 2, card4 = 3, card5 = 4, card6 = 5, card7 = 6, card8 = 7, card9 = 8, card10 = 9, card11 = 10, card12 = 11
    }
    
    enum AnimalCard:String {
        case Dolphin, Ｏctopus, Seahorse, Shark, Turtle, Whale, Mouse, Cow, Tiger, Rabbit, Dragon, Snake, Horse, Sheep, Monkey, Chicken, Dog, Pig
    }
    
    struct CardInfo {
        var position:CardPosition!
        var cardName:String?
        var isSelect:Bool = false
    }
    
    enum Images: String {
        case background1, background2, background3 , background4, background5
    }
    
    let background:[Images] = [.background1, .background2, .background3, .background4, .background5]
    
    
    var cardState = [CardInfo(position: .card1, cardName: nil, isSelect: false),
                     CardInfo(position: .card2, cardName: nil, isSelect: false),
                     CardInfo(position: .card3, cardName: nil, isSelect: false),
                     CardInfo(position: .card4, cardName: nil, isSelect: false),
                     CardInfo(position: .card5, cardName: nil, isSelect: false),
                     CardInfo(position: .card6, cardName: nil, isSelect: false),
                     CardInfo(position: .card7, cardName: nil, isSelect: false),
                     CardInfo(position: .card8, cardName: nil, isSelect: false),
                     CardInfo(position: .card9, cardName: nil, isSelect: false),
                     CardInfo(position: .card10, cardName: nil, isSelect: false),
                     CardInfo(position: .card11, cardName: nil, isSelect: false),
                     CardInfo(position: .card12, cardName: nil, isSelect: false), ]
    
    let numberOfCard:Int = 3 // 3組不同的牌
    var isSelect:Bool = false
    var firestSelect:Int?
    var secondSelect:Int?
    var isColseImage:Bool = false
    var guessWrongCount:Int = 0
    var rightCount:Int = 0
    var gameTimer:Timer?
    var speedSeconds:Int = 0
    
    func compareImage(firestPostion: Int, secondPostion: Int) -> Bool{
        if cardState[firestPostion].cardName == cardState[secondPostion].cardName{
            return true
        }else {
            return false
        }
    }
    
    func decideSelect(selectCard: Int) -> Bool{
        if isSelect == false {
            if isColseImage == true {
                closeImage()
            }
            firestSelect = cardState[selectCard].position.rawValue
            isSelect = true
            isColseImage = false
            return false
        }else {
            secondSelect = cardState[selectCard].position.rawValue
            if firestSelect == secondSelect {
                return false
            }else {
                if compareImage(firestPostion: firestSelect!, secondPostion: secondSelect!) {
                    cardState[selectCard].isSelect = true
                    isColseImage = false
                    rightCount += 1
                }else {
                    isColseImage = true
                    guessWrongCount += 1
                }
                isSelect = false
                return true
            }

        }
    }
    
    @IBAction func selectCardAction(_ sender: UIButton) {
        var renewView:Bool = false
        if rightCount < 6 {
            switch sender{
            case card1Button:
                if let tempName = cardState[0].cardName, cardState[0].isSelect == false {
                    card1Button.setBackgroundImage(UIImage(named: tempName), for: .normal)
                    renewView = decideSelect(selectCard: 0)
                }
                
            case card2Button:
                if let tempName = cardState[1].cardName, cardState[1].isSelect == false {
                    card2Button.setBackgroundImage(UIImage(named: tempName), for: .normal)
                    renewView = decideSelect(selectCard: 1)
                }
                
            case card3Button:
                if let tempName = cardState[2].cardName, cardState[2].isSelect == false {
                    card3Button.setBackgroundImage(UIImage(named: tempName), for: .normal)
                    renewView = decideSelect(selectCard: 2)
                }
                
            case card4Button:
                if let tempName = cardState[3].cardName, cardState[3].isSelect == false {
                    card4Button.setBackgroundImage(UIImage(named: tempName), for: .normal)
                    renewView = decideSelect(selectCard: 3)
                }
                
                
            case card5Button:
                if let tempName = cardState[4].cardName, cardState[4].isSelect == false {
                    card5Button.setBackgroundImage(UIImage(named: tempName), for: .normal)
                    renewView = decideSelect(selectCard: 4)
                }
                
            case card6Button:
                if let tempName = cardState[5].cardName, cardState[5].isSelect == false {
                    card6Button.setBackgroundImage(UIImage(named: tempName), for: .normal)
                    renewView = decideSelect(selectCard: 5)
                }
                
            case card7Button:
                if let tempName = cardState[6].cardName, cardState[6].isSelect == false {
                    card7Button.setBackgroundImage(UIImage(named: tempName), for: .normal)
                    renewView = decideSelect(selectCard: 6)
                }
                
            case card8Button:
                if let tempName = cardState[7].cardName, cardState[7].isSelect == false {
                    card8Button.setBackgroundImage(UIImage(named: tempName), for: .normal)
                    renewView = decideSelect(selectCard: 7)
                }
                
            case card9Button:
                if let tempName = cardState[8].cardName, cardState[8].isSelect == false {
                    card9Button.setBackgroundImage(UIImage(named: tempName), for: .normal)
                    renewView = decideSelect(selectCard: 8)
                }
                
            case card10Button:
                if let tempName = cardState[9].cardName, cardState[9].isSelect == false {
                    card10Button.setBackgroundImage(UIImage(named: tempName), for: .normal)
                    renewView = decideSelect(selectCard: 9)
                }
                
            case card11Button:
                if let tempName = cardState[10].cardName, cardState[10].isSelect == false {
                    card11Button.setBackgroundImage(UIImage(named: tempName), for: .normal)
                    renewView = decideSelect(selectCard: 10)
                }
                
            case card12Button:
                if let tempName = cardState[11].cardName, cardState[11].isSelect == false {
                    card12Button.setBackgroundImage(UIImage(named: tempName), for: .normal)
                    renewView = decideSelect(selectCard: 11)
                }
                
            default:
                break
            }
            
            if renewView == true {
                numberOfTimes.text = "\(guessWrongCount)"
            }
        }
    }
    
    func closeImage(){
        resetCardImage(button: firestSelect!)
        resetCardImage(button: secondSelect!)
    }
    
    
    @IBAction func resetButtonPress(_ sender: UIButton) {
        gameTimer?.invalidate()
        speedSeconds = 0
        initCards()
        resetAllCardImage()
        isColseImage = false
        isSelect = false
        rightCount = 0
        guessWrongCount = 0
        firestSelect = nil
        secondSelect = nil
        numberOfTimes.text = "0"
        spendTime.text = "00:00"
        changeBackground()

    }
    
    func resetCardImage(button: Int) {
        var resetButton:UIButton?
        
        switch button {
        case 0:
            resetButton = card1Button
        case 1:
            resetButton = card2Button
        case 2:
            resetButton = card3Button
        case 3:
            resetButton = card4Button
        case 4:
            resetButton = card5Button
        case 5:
            resetButton = card6Button
        case 6:
            resetButton = card7Button
        case 7:
            resetButton = card8Button
        case 8:
            resetButton = card9Button
        case 9:
            resetButton = card10Button
        case 10:
            resetButton = card11Button
        case 11:
            resetButton = card12Button
        default:
            break
        }
        resetButton?.setBackgroundImage(UIImage(named: "cardImage"), for: .normal)
    }
    
    func resetAllCardImage(){
        card1Button.setBackgroundImage(UIImage(named: "cardImage"), for: .normal)
        card2Button.setBackgroundImage(UIImage(named: "cardImage"), for: .normal)
        card3Button.setBackgroundImage(UIImage(named: "cardImage"), for: .normal)
        card4Button.setBackgroundImage(UIImage(named: "cardImage"), for: .normal)
        card5Button.setBackgroundImage(UIImage(named: "cardImage"), for: .normal)
        card6Button.setBackgroundImage(UIImage(named: "cardImage"), for: .normal)
        card7Button.setBackgroundImage(UIImage(named: "cardImage"), for: .normal)
        card8Button.setBackgroundImage(UIImage(named: "cardImage"), for: .normal)
        card9Button.setBackgroundImage(UIImage(named: "cardImage"), for: .normal)
        card10Button.setBackgroundImage(UIImage(named: "cardImage"), for: .normal)
        card11Button.setBackgroundImage(UIImage(named: "cardImage"), for: .normal)
        card12Button.setBackgroundImage(UIImage(named: "cardImage"), for: .normal)
    }
    
    func initCards() {
        var tempAnimalName:AnimalCard?
        
        let number = GKRandomDistribution(lowestValue: 0, highestValue: numberOfCard - 1)
        let playCardNumber = number.nextInt()
        let randomDistribution = GKShuffledDistribution(lowestValue: 0, highestValue:
            cardState.count - 1)
        
        for number in 0 ..< 12 {
            let postion = randomDistribution.nextInt()
            
            switch postion {
            case 0, 1:
                if playCardNumber == 0 {
                    tempAnimalName = AnimalCard.Dolphin
                }else if playCardNumber == 1{
                    tempAnimalName = AnimalCard.Mouse
                }else {
                    tempAnimalName = AnimalCard.Cow
                }
                
                
            case 2, 3:
                if playCardNumber == 0 {
                    tempAnimalName = AnimalCard.Ｏctopus
                }else if playCardNumber == 1{
                    tempAnimalName = AnimalCard.Tiger
                }else {
                    tempAnimalName = AnimalCard.Rabbit
                }
                
                
            case 4, 5:
                if playCardNumber == 0 {
                    tempAnimalName = AnimalCard.Seahorse
                }else if playCardNumber == 1{
                    tempAnimalName = AnimalCard.Dragon
                }else {
                    tempAnimalName = AnimalCard.Snake
                }
                
            case 6, 7:
                if playCardNumber == 0 {
                    tempAnimalName = AnimalCard.Shark
                }else if playCardNumber == 1{
                    tempAnimalName = AnimalCard.Horse
                }else {
                    tempAnimalName = AnimalCard.Sheep
                }
                
            case 8, 9:
                if playCardNumber == 0 {
                    tempAnimalName = AnimalCard.Turtle
                }else if playCardNumber == 1{
                    tempAnimalName = AnimalCard.Monkey
                }else {
                    tempAnimalName = AnimalCard.Chicken
                }
                
            case 10, 11:
                if playCardNumber == 0 {
                    tempAnimalName = AnimalCard.Whale
                }else if playCardNumber == 1{
                    tempAnimalName = AnimalCard.Dog
                }else {
                    tempAnimalName = AnimalCard.Pig
                }
                
            default:
                break
            }
            
            if let tempAnimalName = tempAnimalName{
                cardState[number].cardName = "pickAPair\(tempAnimalName.rawValue)"
                cardState[number].isSelect = false
            }
            else {
                print("Error! ... (self) :(#function)")
            }
        }
        

        gameTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(PickAPairViewController.countingSpeedTime) , userInfo: nil, repeats: true)

    }
    @objc func countingSpeedTime(){
        if rightCount < 6 {
            let showMinutes = String(format: "%02d", speedSeconds / 60)
            let ShowSeconds = String(format: "%02d", speedSeconds % 60)
            spendTime.text = "\(showMinutes):\(ShowSeconds)"
            speedSeconds += 1
        }
    }
    
    func changeBackground() {
        let randomNumber = GKRandomDistribution( lowestValue: 0, highestValue: background.count - 1 )
        let randomBackground = background[randomNumber.nextInt()]
        backgroundImageView.image = UIImage(named: "\(randomBackground)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCards()
        changeBackground()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        gameTimer?.invalidate()  // 停止Timer
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
