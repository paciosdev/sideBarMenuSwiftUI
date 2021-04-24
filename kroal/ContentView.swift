//
//  ContentView.swift
//  kroal
//
//  Created by Kekko Paciello on 24/04/21.
//

import SwiftUI

struct ContentView: View {
    @State private var show = false
    var body: some View {
        ZStack{
            Color.yellow.edgesIgnoringSafeArea(.all)
            
            HStack{
                SideBar(show: $show)
                Spacer()
            }
            
            VStack{
                Spacer()
                Button(action: {withAnimation{
                    show.toggle()
                }}, label: {
                    Text(show ? "Hide" : "Show")
                        .foregroundColor(.black)
                        .background(
                            Capsule().stroke(Color.black,lineWidth: 2)
                                .frame(width: 100, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        )
                })
                Spacer()
                
                if !show{
                    HStack(spacing: 70){
                        Image(systemName: "person")
                        Image(systemName: "house")
                        Image(systemName: "book")
                    }
                    .font(.title)
                    .transition(.asymmetric(insertion: .opacity, removal: .slide))
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SideBar: View {
    @Binding var show: Bool
    var body: some View {
        ZStack{
            Rectangle().edgesIgnoringSafeArea(.all)
                .animation(.easeInOut)
            
            VStack{
                Spacer()
                
                VStack{
                    Image(systemName: "person.fill")
                    Spacer(minLength: 50)
                    Image(systemName: "person.2.fill")
                    Spacer(minLength: 50)
                    Image(systemName: "person.3.fill")
                    Spacer(minLength: 50)
                }
                
                Spacer()
                
                Button(action: {withAnimation{
                    show.toggle()
                }}, label: {
                    Image(systemName: "chevron.left")
                })
                    
            }
            .font(.title2)
            .foregroundColor(.white)

        }
        .frame(width: 100)

        .offset(x: show ? 0 : -100)
            
    }
}
