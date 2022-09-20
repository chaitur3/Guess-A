//
//  fruitView.swift
//  Guess-A
//
//  Created by Sarah Tor on 29/6/2022.
//

import SwiftUI

struct fruitLevels: View {
    @State private var showHelps = false
    var body: some View {
        VStack {
            VStack {
                Text("GUESS")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(0.2)
                Text("THE")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(0.2)
                Text("FRUIT")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(0.2)
                Text("🍎")
                    .font(.largeTitle)
                    .padding(0.2)
            }
            .padding()
            VStack {
                Text("Difficulty Selection")
                RoundedRectangle(cornerRadius: 100, style: .continuous)
                    .frame(width: 160, height: 1)
                VStack {
                    NavigationLink(destination: contentView()) {
                        Text("Easy")
                            .foregroundColor(.black)
                            .background(RoundedRectangle(cornerRadius: 18).fill(Color.orange).frame(width: 165, height: 50))
                    }
                    .padding(20)
                    
                        Text("Hard")
                            .foregroundColor(.black)
                            .background(RoundedRectangle(cornerRadius: 18).fill(Color.purple).frame(width: 165, height: 50))
                    }
                    .padding(20)
                }
                .padding(25)
            }
            .padding(.vertical, 80)

        }
     
    }
    


struct fruitLevels_Previews: PreviewProvider {
    static var previews: some View {
        fruitLevels()
    }
}
