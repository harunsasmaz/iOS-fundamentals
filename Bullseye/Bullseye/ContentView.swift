//
//  ContentView.swift
//  Bullseye
//
//  Created by Harun Sasmaz on 1.08.2020.
//  Copyright © 2020 Harun Sasmaz. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var hitState = false
    @State var sliderVal = 50.0
    @State var target = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    
    let midnightBlue = Color(red: 0.0 / 255.0, green: 51.0 / 255.0, blue: 102.0 / 255.0)
    
    struct labelStyle : ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
                .foregroundColor(Color.white)
                .modifier(Shadow())
        }
    }
    
    struct valueStyle : ViewModifier {
        func body(content: Content) -> some View {
            return content
            .font(Font.custom("Arial Rounded MT Bold", size: 24))
            .foregroundColor(Color.yellow)
            .modifier(Shadow())
        }
    }
    
    struct Shadow : ViewModifier {
        func body(content: Content) -> some View {
            return content.shadow(color: Color.black, radius: 5, x: 2, y: 2)
        }
    }
    
    struct buttonLargeTextStyle : ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
                .foregroundColor(Color.black)
        }
    }
    
    struct buttonSmallTextStyle : ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Arial Rounded MT Bold", size: 12))
                .foregroundColor(Color.black)
        }
    }
    
    var body: some View {
        VStack {
            
            Spacer()
            
            // Title row
            HStack {
                Text("Put the bullseye as close as you can to:").modifier(labelStyle())
                Text("\(self.target)").modifier(valueStyle())
            }
            
            Spacer()
            
            // Slider Row
            HStack {
                Text("1").modifier(labelStyle())
                Slider(value: $sliderVal, in: 1...100)
                Text("100").modifier(labelStyle())
            }
                
            Spacer()
            
            Button(action: {
                self.hitState = true
            }){
                Text("Hit me!").modifier(buttonLargeTextStyle())
            }
            .alert(isPresented: $hitState) { () -> Alert in
                return Alert(title: Text(alertTitle()), message: Text("The Slider value is \(roundedSlider())\n" + "You scored \(calculateScore()) in this round"),
                             dismissButton: .default(Text("Awesome!")) {
                                self.score = self.score + self.calculateScore()
                                self.target = Int.random(in: 1...100)
                                self.round = self.round + 1
                            })
            }
            .background(Image("Button"))
            .modifier(Shadow())
            
            Spacer()
            
            // Bottom row
            HStack {
                Button(action: {
                    self.resetGame()
                }) {
                    HStack {
                        Image("StartOverIcon")
                        Text("Start Over").modifier(buttonSmallTextStyle())
                    }
                }
                .background(Image("Button"))
                .modifier(Shadow())
                
                Spacer()
                
                HStack {
                    Text("Score: ").modifier(labelStyle())
                    Text("\(score)").modifier(valueStyle())
                }
                
                Spacer()
                
                HStack {
                    Text("Round: ").modifier(labelStyle())
                    Text("\(self.round)").modifier(valueStyle())
                }
                
                Spacer()
                
                NavigationLink(destination: AboutView()) {
                    HStack {
                        Image("InfoIcon")
                        Text("Info").modifier(buttonSmallTextStyle())
                    }
                }
                .background(Image("Button"))
                .modifier(Shadow())
            }
            .padding(.bottom, 20)
            
        }
        .background(Image("Background"), alignment: .center)
        .accentColor(midnightBlue)
        .navigationBarTitle("Bull's Eye")
    }
    
    func roundedSlider() -> Int {
        return Int(self.sliderVal.rounded())
    }
    
    func calculateScore() -> Int {
        return 100 - differ() + calculateBonus()
    }
    
    func differ() -> Int {
        return abs(target - roundedSlider())
    }
    
    func alertTitle() -> String {
        let difference = differ()
        let title : String
        if difference == 0 {
            title = "Perfect!"
        } else if difference < 6 {
            title = "You almost had it!"
        } else if difference <= 10 {
            title = "Not bad!!"
        } else {
            title = "Are you even trying?"
        }
        
        return title
    }
    
    func calculateBonus() -> Int {
        let diff = differ()
        let bonus : Int
        if diff == 0 {
            bonus = 100
        } else if diff == 1 {
            bonus = 50
        } else {
            bonus = 0
        }
        
        return bonus
    }
    
    func resetGame() {
        self.score = 0
        self.round = 1
        self.target = Int.random(in: 1...100)
        self.sliderVal = 50.0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
