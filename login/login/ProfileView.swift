//
//  ProfileView.swift
//  login
//
//  Created by Harun Sasmaz on 6.08.2020.
//  Copyright © 2020 Harun Sasmaz. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
       Home()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct hstackModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
        .frame(height: 100)
        .padding(.horizontal)
        .cornerRadius(15)
        .background(Color("Color1"))
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 8, y: 8)
        .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
    }
}

struct vstackModifier : ViewModifier {
    
    func body(content: Content) -> some View {
        content
        .padding(.vertical, 10)
        .frame(width: (UIScreen.main.bounds.width - 60) / 2 - 10)
        .background(Color("Color1"))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
        .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
    }
}

struct Home : View {
    
    @State var index = 1
    
    var body : some View {
        
        VStack {
            
            HStack(spacing: 15) {
                
                Button(action: {
                    
                }) {
                    Image(systemName: "chevron.left")
                    .font(.system(size: 22))
                    .foregroundColor(.black)
                }
                
                Text("Profile")
                    .font(.title)
                
                Spacer(minLength: 0)
                
                Button(action: {
                    
                }) {
                    Text("Edit")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background(Color("Color"))
                        .cornerRadius(10)
                        .shadow(radius: 10)
                }
            }
            .padding()
            
            HStack {
                
                VStack(spacing: 0) {
                    
                    Rectangle()
                    .fill(Color("Color"))
                    .frame(width: 80, height: 3)
                    .zIndex(1)
                    
                    Image("harun")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.top, 6)
                    .padding(.horizontal, 8)
                    .background(Color("Color1"))
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 8, y: 8)
                    .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    
                        Text("Harun Sasmaz")
                            .font(.title)
                            .foregroundColor(Color.black.opacity(0.8))
                        Text("Undergraduate Student")
                            .foregroundColor(Color.black.opacity(0.7))
                            .padding(.top, 8)
                        Text("harunxaxmaz@gmail.com")
                            .foregroundColor(Color.black.opacity(0.7))
                    
                    
                }.padding(.leading, 10)
                
                Spacer(minLength: 0)
            }
            .padding(.horizontal, 20)
            
            HStack {
                
                Button(action: {
                    self.index = 0
                }) {
                    Text("Experience")
                        .foregroundColor(self.index == 0 ? .white : .gray)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 0 ? Color("Color") : Color.clear)
                        .cornerRadius(10)
                }
                
                Spacer(minLength: 0)
                
                Button(action: {
                    
                    self.index = 1
                    
                }) {
                    
                    Text("Education")
                        .foregroundColor(self.index == 1 ? Color.white : .gray)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 1 ? Color("Color") : Color.clear)
                        .cornerRadius(10)
                }
                
                Spacer(minLength: 0)
                
                Button(action: {
                    
                    self.index = 2
                    
                }) {
                    
                    Text("Accounts")
                        .foregroundColor(self.index == 2 ? Color.white : .gray)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 2 ? Color("Color") : Color.clear)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal,8)
            .padding(.vertical,5)
            .background(Color("Color1"))
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
            .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
            .padding(.horizontal, 10)
            .padding(.top,15)
            
            if(self.index == 0) {
                Experiences()
            } else if (self.index == 1) {
                Education()
            }
            
            Spacer()
        }
        .background(Color("Color1")
        .edgesIgnoringSafeArea(.all))

    }
}

struct Education : View {
    var body : some View {
        
        VStack(spacing: 15) {
            
            HStack(spacing: 10) {
                Image("skkulogo")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 80, height: 80)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Sungkyunkwan University")
                        .font(.headline)
                    
                    Text("Computer Science")
                        .foregroundColor(Color("Color"))
                    
                    Text("2020-2021")
                        .font(.caption)
                        .foregroundColor(.black).opacity(0.7)
                    
                    Text("Global Exchange Program - One Term")
                        .font(.caption)
                        .foregroundColor(Color("Color")).opacity(0.8)
                }
                
                Spacer()
            }
            .modifier(hstackModifier())
            
            HStack() {
                
                Image("koclogo")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 80, height: 80)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Koc University - Istanbul")
                        .font(.headline)
                    
                    Text("Computer Science")
                        .foregroundColor(Color("Color"))
                    
                    Text("2016-2021")
                        .font(.footnote)
                        .foregroundColor(.black).opacity(0.7)
                }
                
                Spacer()
            }
            .modifier(hstackModifier())
            
            HStack {
                
                Image("koclogo")
                    .resizable()
                    .frame(width: 80, height: 80)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Koc University - Istanbul")
                        .font(.headline)
                    
                    Text("Mathematics")
                        .foregroundColor(Color("Color"))
                    
                    Text("2018-2022")
                        .font(.footnote)
                        .foregroundColor(.black).opacity(0.7)
                }
                
                Spacer()
            }
            .modifier(hstackModifier())
            
            HStack(spacing: 10) {
                
                Image("meblogo")
                    .resizable()
                    .frame(width: 80, height: 80)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("IMKB Science High School")
                        .font(.headline)
                    
                    Text("Science")
                        .foregroundColor(Color("Color"))
                    
                    Text("2012-2016")
                        .font(.footnote)
                        .foregroundColor(.black).opacity(0.7)
                }
                
                Spacer()
            }
            .modifier(hstackModifier())

        }
    }
}

struct Experiences : View {
    
    var body: some View {
        
        VStack(spacing: 0) {
            HStack(spacing: 20) {
                       
               VStack(spacing: 12){
                   
                   Image("twitter")
                   .resizable()
                   .frame(width: 80, height: 80)
                   
                   Text("Twitter")
                       .font(.title)
                       .padding(.top,10)
                   
                   Text("iOS Developer")
                       .foregroundColor(Color("Color"))
                   
                   Text("1 Year")
                       .font(.caption)
                       .foregroundColor(.gray)
               }
               .modifier(vstackModifier())

               VStack(spacing: 12){
                   
                   Image("apple")
                   .resizable()
                   .frame(width: 80, height: 80)
                   
                   Text("Apple")
                       .font(.title)
                       .padding(.top,10)
                   
                   Text("iOS Developer")
                       .foregroundColor(Color("Color"))
                   
                   Text("1 Year")
                       .font(.caption)
                       .foregroundColor(.gray)
               }
               .modifier(vstackModifier())

           }
           .padding(.top, 10)
           
           HStack(spacing: 20) {
               
               VStack(spacing: 12) {
                   Image("fb")
                       .resizable()
                       .frame(width: 80, height: 80)
                   
                   Text("Facebook")
                       .font(.title)
                       .padding(.top, 10)
                   
                   Text("iOS Developer")
                       .foregroundColor(Color("Color"))
                   
                   Text("1 Year")
                       .font(.caption)
                       .foregroundColor(.gray)
                   
               }
               .modifier(vstackModifier())
               
               VStack(spacing: 12) {
                   
                   Image("pinterest")
                       .resizable()
                       .frame(width: 80, height: 80)
                   
                   Text("Pinterest")
                       .font(.title)
                       .padding(.top, 10)
                   
                   Text("iOS Developer")
                       .foregroundColor(Color("Color"))
                   
                   Text("1 Year")
                       .font(.caption)
                       .foregroundColor(.gray)
               }
               .modifier(vstackModifier())
               
           }.padding(.top, 10)
        }
    }
}

