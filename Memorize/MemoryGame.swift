 //
//  MemoryGame.swift
//  Memorize
//
//  Created by Aleksandar Ivanovic on 1.2.22..
//

// MARK: - OVO JE MODEL
import Foundation
import UIKit
dasadasdadasdadsasd
MACH_MSGH_BITS_IMPHOLDASRTda
__NSDATAASSET_SHARED_SECTION__dad
asdasdas
da
__NSDATAASSET_SHARED_SECTION__d

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexofTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        // if let chosenIndex = index(of: card) {       Stari nacin
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched
        {
            
            if let potentialMatchIndex = indexofTheOneAndOnlyFaceUpCard {
                //print("entered if statement")
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    
                }
                indexofTheOneAndOnlyFaceUpCard = nil
            } else {
                //print("entered the else")
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexofTheOneAndOnlyFaceUpCard = chosenIndex
            }
            
        
            cards[chosenIndex].isFaceUp.toggle()
        }
        
        //print("\(cards)")
    }
    /* DEO STAROG NACINA KOJI JE ZAMENJEN SA FIRSTINDEX
    func index(of card: Card) -> Int? {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        
        return nil
    }
    */
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        
        
    }
      
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        
        var id: Int
        
    }
}
