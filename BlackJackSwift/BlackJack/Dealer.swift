//
//  Dealer.swift
//  BlackJack
//
//  Created by RENO1 on 2020/08/04.
//  Copyright © 2020 RENO1. All rights reserved.
//

import Foundation

class Dealer: CardHolder, DealerAble {
    override init() {
        // generate Card
        var initCardList = [Card]()
        
        for suit in Card.Suit.allCases {
            for rank in Card.Rank.allCases {
                initCardList.append(Card(suit: suit, rank: rank))
            }
        }
        
        super.init(cardList: initCardList)
    }
    
    // shuffle Card
    func shuffle() {
         cardList.shuffled()
    }
    
    func getCard() -> Card? {
        if(cardList.count > 0) {
            let cardIdx = Int.random(in: 0..<cardList.count)
            let card = cardList[cardIdx]
            cardList.remove(at: cardIdx)
            return card
        } else {
            return nil
        }
    }
    
    func giveCard(cardHolder: CardHolder) {
        let card = self.getCard()
        if (card != nil) {
            cardHolder.addCard(card: card!)
        }
    }
}

protocol DealerAble {
    func shuffle()
    func getCard() -> Card?
    func giveCard(cardHolder: CardHolder)
}
