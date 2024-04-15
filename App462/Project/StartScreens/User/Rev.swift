//
//  Rev.swift
//  App462
//
//  Created by IGOR on 08/04/2024.
//

import SwiftUI
import StoreKit

struct Rev: View {
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("Reviews")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 12) {
                    
                    Text("Rate us in the AppStore")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                    
                    Text("Make the app better")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Not()
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
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Rev()
}
