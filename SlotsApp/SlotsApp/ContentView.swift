//
//  ContentView.swift
//  SlotsApp
//
//  Created by Harun Sasmaz on 12.08.2020.
//  Copyright © 2020 Harun Sasmaz. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numbers = [0, 1, 2, 0, 1, 2, 0, 1, 2]
    @State private var credits = 1000
    private var bet = 5
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            VStack() {
                
                Spacer()
                
                HStack {
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                    
                    Text("Slots App!")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Image(systemName: "star.fill")
                    .foregroundColor(Color.yellow)
                }
                .scaleEffect(2)
                
                Spacer()
                
                Text("Credits: \(self.credits)")
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                Spacer()
                
                CardView(numbers: $numbers)
                
                Spacer()
                
                HStack(spacing: 20) {
                    Button(action: {
                                       
                        self.numbers.shuffle()
                        
                        if self.horizontalCheck() || self.verticalCheck() || self.diagonalCheck() {
                            self.credits += self.bet * self.bet * 2
                        } else {
                            self.credits -= self.bet * self.bet
                        }
                       
                    }) {
                       Text("Spin")
                           .bold()
                           .foregroundColor(Color.white)
                           .padding(.all, 10)
                           .padding(.horizontal, 30)
                           .background(Color.pink)
                           .cornerRadius(20)
                    }
                    
                    Button(action: {
                                        
                        self.numbers.shuffle()
                        
                        if self.feelingLuckyCheck() {
                            self.credits *= 2
                        } else {
                            self.credits -= self.bet * self.bet * 4
                        }
                        
                    }) {
                        Text("Feeling Lucky")
                            .bold()
                            .foregroundColor(Color.white)
                            .padding(.all, 10)
                            .padding(.horizontal, 30)
                            .background(Color.pink)
                            .cornerRadius(20)
                    }
                }.padding(.bottom, 30)
                
                Text("Spin: If a row or a column of images match")
                    .foregroundColor(.white).bold().font(.headline)
                Text("Feeling lucky: If all three rows match")
                    .foregroundColor(.white).bold().font(.headline)
            }
        }
    }
    
    func horizontalCheck() -> Bool {
        
        if (self.numbers[0] == self.numbers[1]) && (self.numbers[1] == self.numbers[2]) {
            return true
        } else if (self.numbers[3] == self.numbers[4]) && (self.numbers[4] == self.numbers[5]) {
            return true
        } else if (self.numbers[6] == self.numbers[7]) && (self.numbers[7] == self.numbers[8]) {
            return true
        } else {
            return false
        }
    }
    
    func verticalCheck() -> Bool {
        
        if (self.numbers[0] == self.numbers[3]) && (self.numbers[3] == self.numbers[6]) {
            return true
        } else if (self.numbers[1] == self.numbers[4]) && (self.numbers[4] == self.numbers[7]) {
            return true
        } else if (self.numbers[2] == self.numbers[5]) && (self.numbers[5] == self.numbers[8]) {
            return true
        } else {
            return false
        }
    }
    
    func diagonalCheck() -> Bool {
        
        if (self.numbers[0] == self.numbers[4]) && (self.numbers[4] == self.numbers[8]) {
            return true
        } else if (self.numbers[2] == self.numbers[4]) && (self.numbers[4] == self.numbers[6]) {
            return true
        } else {
            return false
        }
    }
    
    func feelingLuckyCheck() -> Bool {
        
        var count = 0
        
        if (self.numbers[0] == self.numbers[1]) && (self.numbers[1] == self.numbers[2]) {
            count += 1
        }
        if (self.numbers[3] == self.numbers[4]) && (self.numbers[4] == self.numbers[5]) {
            count += 1
        }
        if (self.numbers[6] == self.numbers[7]) && (self.numbers[7] == self.numbers[8]) {
            count += 1
        }
        
        return (count == 3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
