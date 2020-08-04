//
//  Card.swift
//  BlackJack
//
//  Created by RENO1 on 2020/08/04.
//  Copyright © 2020 RENO1. All rights reserved.
//

import Foundation

struct Card: CustomStringConvertible {
    var description: String {
        return "[ \(self.suit.rawValue) | \(self.rank.rawValue) ]"
    }
    
    private let suit:Suit
    private let rank:Rank
    
    init(suit: Suit, rank:Rank) {
        self.suit = suit
        self.rank = rank
    }
    
    func getSuit() -> Suit {
        return suit
    }
    
    func getRank() -> Rank {
        return rank
    }
    
    // nested Suit enumeration
      // struct 안에 enum이 들어갈 수 있습니다.
    enum Suit: Character, CaseIterable {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }

    // nested Rank enumeration
    enum Rank: Int, CaseIterable {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        struct Values { // enum안에 struct가 들어가는 것도 가능합니다.
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
}
