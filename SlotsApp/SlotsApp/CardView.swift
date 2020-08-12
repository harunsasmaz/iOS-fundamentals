//
//  CardView.swift
//  SlotsApp
//
//  Created by Harun Sasmaz on 12.08.2020.
//  Copyright © 2020 Harun Sasmaz. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    @Binding var numbers : [Int]
    var symbols = ["apple", "donut", "lemon"]
    
    var body: some View {
        
        VStack {
            HStack {
                Image(symbols[numbers[0]])
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                Image(symbols[numbers[1]])
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                Image(symbols[numbers[2]])
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
            }
            HStack {
                Image(symbols[numbers[3]])
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                Image(symbols[numbers[4]])
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                Image(symbols[numbers[5]])
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
            }
            HStack {
                Image(symbols[numbers[6]])
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                Image(symbols[numbers[7]])
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                Image(symbols[numbers[8]])
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
            }
        }.padding(.horizontal)


    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(numbers: Binding.constant([0,1,2,0,1,2,0,1,2]))
            .background(Color.yellow)
    }
}
