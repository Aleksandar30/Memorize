//
//  MemoryGame.swift
//  Memorize
//
//  Created by Aleksandar Ivanovic on 1.2.22..
//

// MARK: - OVO JE MODEL
import Foundation


struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    private var indexofTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        // if let chosenIndex = index(of: card) {       Stari nacin
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if let potentialMatchIndex = indexofTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    
                }
            }
        
            cards[chosenIndex].isFaceUp.toggle()
        }
        
        print("\(cards)")
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
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        
        var id: Int
        
    }
}
