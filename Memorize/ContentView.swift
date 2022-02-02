//
//  ContentView.swift
//  Memorize
//
//  Created by Aleksandar Ivanovic on 3.1.22..
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame     //Obicno se nece zvati ovako
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards, id: \.self, content: {emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    })
                }//: LazyVGrid
                .foregroundColor(.red)
            }//: ScrollView
            
            Spacer()

            
        }//: VSTACK
        .padding(.horizontal)
    }//: BODY
    
}

struct CardView: View {
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
            
        }//: ZSTACK
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
        
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
