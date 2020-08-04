//
//  CardHolder.swift
//  BlackJack
//
//  Created by RENO1 on 2020/08/04.
//  Copyright © 2020 RENO1. All rights reserved.
//

import Foundation

class CardHolder {
    var cardList: [Card]
    
    init() {
        self.cardList = [Card]()
    }
    
    init(cardList: [Card]) {
        self.cardList = cardList
    }
    
    func getCardList() -> [Card] {
        return cardList
    }
    
    func setCardList(cardList: [Card]) {
        self.cardList = cardList
    }
    
    func addCard(card:Card) {
        cardList.append(card)
    }
    
}
