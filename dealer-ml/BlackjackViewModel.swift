//
//  BlackjackViewModel.swift
//  dealer-ml
//
//  Created by Steven Lee on 9/18/18.
//  Copyright © 2018 leavenstee. All rights reserved.
//

import UIKit

class BlackjackViewModel: NSObject {
    
    private let deck = [2,3,4,5,6,7,8,9,10,10,10,10,11,
                        2,3,4,5,6,7,8,9,10,10,10,10,11,
                        2,3,4,5,6,7,8,9,10,10,10,10,11,
                        2,3,4,5,6,7,8,9,10,10,10,10,11]
    
    private let numberOfDecks = 4
    private let shufflePercent = 0.75
    
    private var shuffledDeck : [Int] = []
    
    private var player : [Int]!
    private var dealer : [Int]!
    
    public func shuffleDeck() {
        for _ in 0...numberOfDecks-1 {
            self.shuffledDeck.append(contentsOf: deck)
        }
        
        self.shuffledDeck = self.shuffledDeck.shuffled()
    }
    
    public func dealCards() -> (Int, Int) {
        return (shuffledDeck.popLast() ?? 0, shuffledDeck.popLast() ?? 0)
    }
    
    public func hit() -> Int {
        return shuffledDeck.popLast() ?? 0
    }

    public func startRound() {
        let playerHand = self.dealCards()
        let dealerHand = self.dealCards()
        
        self.player = [playerHand.0, playerHand.1]
        self.dealer = [dealerHand.0, dealerHand.1]
        
        print("Player \(checkHand(self.player))")
        print("Dealer \(checkHand(self.dealer))")
        
        while(dealerLoop()) {
            print("Dealer \(checkHand(self.dealer))")
        }
    }
    
    private func checkHand(_ cards:[Int]) -> Int {
        var total = 0
        for i in cards {
            total = total + i
        }
        return total
    }
    
    private func dealerLoop() -> Bool{
        if checkHand(self.dealer) > 21 {
            print("game over")
            return false
        } else if checkHand(self.dealer) == 21 {
            print("dealer winner")
            return false
        } else if checkHand(self.dealer) < 17 {
            print("keep going")
            self.dealer.append(self.hit())
            return true
        } else {
             print("dealer holds 17")
            return false
        }
    }
}
