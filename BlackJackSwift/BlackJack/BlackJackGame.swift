//
//  Game.swift
//  BlackJack
//
//  Created by RENO1 on 2020/08/04.
//  Copyright © 2020 RENO1. All rights reserved.
//

import Foundation

struct BlackJackGame {
    private var isRunning = true
    private let dealer: DealerAble
    private let user: Player
    private let ai: Player
    
    init() {
        self.dealer = Dealer()
        self.user = Player()
        self.ai = Player()
    }
    
    mutating func run() {
        print("BackJack is Started")
        
        while isRunning {
            // 딜러가 카드를 섞는다
            dealer.shuffle()
            // 유저에게 카드를 줄지 물어본다
            // 유저가 카드를 받는다면
            if(askUserToGetCard()) {
                // 딜러가 카드를 준다
                dealer.giveCard(cardHolder: user)
                dealer.giveCard(cardHolder: ai)
                showPlayerCards(userCards: user.getCardList(), aiCards: ai.getCardList())
            } else {
                // 아닐 경우 점수 계산을 한다
                let isUserWin = calculateScore(userCardList: user.getCardList(), aiCardList: ai.getCardList())
                // 승패를 확인한다.
                showMessage(isUserWin: isUserWin)
                // 게임을 계속할지 묻는다
                askGameAgain()
            }
        }
        print("The End")
    }
    
    private func askUserToGetCard() -> Bool {
        print("카드를 받으시겠습니다. (Y/N)")
        let answer = readLine()
        
        if(answer == nil) {
            return false
        }
        
        if(answer == "Y") {
            return true
        } else {
            return false
        }
    }
    
    private func calculateScore(userCardList:[Card], aiCardList:[Card]) -> Bool {
        var userScore = 0
        var aiScore = 0
        
        for userCard in userCardList {
            userScore += userCard.getRank().values.first
        }
        
        for aiCard in aiCardList {
            aiScore += aiCard.getRank().values.first
        }
        
        if (21 > userScore && userScore > aiScore){
            return true
        }
        
        return false
    }
    
    private func showMessage(isUserWin:Bool) {
        if(isUserWin) {
            print("유저가 승리하였습니다 !!")
        } else {
            print("Ai가 승리하였습니다 !!")
        }
    }
    
    private mutating func askGameAgain() {
        print("한판 더 하시겠습니까? (Y/N)")
        let answer = readLine()
        
        if(answer == nil) {
            isRunning = false
        }
        
        if(answer == "Y") {
            isRunning = true
        } else {
            isRunning = false
        }
    }
    
    private func showCardList(cardList:[Card]) {
        var cardListDesc = ""

        for card in cardList {
            cardListDesc.append("\(card.description)\n")
        }
        print(cardListDesc)
    }
    
    private func showPlayerCards(userCards:[Card], aiCards:[Card]) {
        print("당신의 카드들")
        showCardList(cardList: userCards)
        print("컴퓨터의 카드들")
        showCardList(cardList: aiCards)
    }
    
    private func giveCardToPlayer(user: Player, ai: Player, dealer: DealerAble) {
        let userCard = dealer.getCard()
        if(userCard != nil) {
            user.addCard(card: userCard!)
        }
        let aiCard = dealer.getCard()
        if(aiCard != nil) {
            ai.addCard(card: aiCard!)
        }
    }
}
