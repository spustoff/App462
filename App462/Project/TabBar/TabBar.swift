//
//  TabBar.swift
//  App462
//
//  Created by IGOR on 08/04/2024.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color.white: .white.opacity(0.5))
                            .frame(height: 22)
                            .padding(10)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.2)).opacity(selectedTab == index ? 1 : 0))
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 28)
        .background(Color("bg"))
    }
}

enum Tab: String, CaseIterable {
    
    case Wallet = "Wallet"
    
    case Calculator = "Calculator"
    
    case Settings = "Settings"
}


#Preview {
    
    ContentView()
}
