//
//  U1.swift
//  App462
//
//  Created by IGOR on 08/04/2024.
//

import SwiftUI

struct U1: View {
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("U1")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 12) {
                    
                    Text("High chance to win")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                    
                    Text("Explore a lot of great card games")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Rev()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(width: 250, height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                            .padding(.bottom, 20)
                    })
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 280)
                .background(Color("bg"))
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    U1()
}
