//
//  ContentView.swift
//  Memorize
//
//  Created by Aleksandar Ivanovic on 3.1.22..
//

import SwiftUI

struct ContentView: View {
    let viewModel: EmojiMemoryGame     //Obicno se nece zvati ovako
    
    var body: some View {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) {card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }//: LazyVGrid
                .foregroundColor(.red)
                .padding(.horizontal)
            }//: ScrollView

    }//: BODY
    
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else {
                shape.fill()
            }
            
        }//: ZSTACK
        //.onTapGesture {
            //card.isFaceUp = !card.isFaceUp
        //}
        
    }
}



// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        //ContentView()
            //.preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
            
    }
}
