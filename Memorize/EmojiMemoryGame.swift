//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Aleksandar Ivanovic on 1.2.22..
//

// MARK: - OVO JE VIEWMODEL
//OVo je deo UI pa izbacujem foundation
//import Foundation
import SwiftUI

func makeCardContent(index: Int) -> String {
    return "😀"
}

class EmojiMemoryGame {
    private var model: MemoryGame<String> =
    MemoryGame<String>(numberOfPairsOfCards: 4) {_ in "😀"}
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    

}
