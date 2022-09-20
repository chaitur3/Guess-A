//
//  ContentView.swift
//  Guess-A
//
//  Created by Chaitu reddy on 19/9/2022.
//

import SwiftUI

struct contentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State var scoreNum = 0 
    @State private var fruits = ["Apple", "Orange", "Kiwi", "Mango", "Strawberry", "Apricot", "Banana", "Grape", "Raspberries", "Watermelon"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showHelpCard = false
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()

            VStack {
                Spacer()

                Text("Guess the Fruit")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the fruit of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))

                        Text(fruits[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }

                    ForEach(0..<3) { number in
                        Button {
                            fruitTapped(number)
                        } label: {
                            Image(fruits[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))

                Spacer()
                Spacer()

                Text("Score: " + String((scoreNum)))
                    .foregroundColor(.white)
                    .font(.title.bold())

                Spacer()
            }
            .padding()
            .toolbar {
                Button() {
                    
                showHelpCard.toggle()
                    
                } label: {
                    Image(systemName: "lightbulb.circle")
                    }
                .alert(isPresented: $showHelpCard) {
                    Alert(title: Text("Help!"), message: Text("Choose the correct fruit which is given"), dismissButton: .default(Text("Ok!"))
                )}

            }
                
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        }
       
    }
    
    
        
       

    func fruitTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            scoreNum = scoreNum + 1
        } else {
            scoreTitle = "Wrong"
        }

        showingScore = true
    }

    func askQuestion() {
        fruits.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct contentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
