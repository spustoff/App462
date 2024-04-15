//
//  SettingsView.swift
//  App462
//
//  Created by IGOR on 08/04/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @State var isChart: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                
                VStack(spacing: 40) {
                    
                    HStack(alignment: .top) {
                        
                        Text("Settings")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .semibold))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            isChart = true
                            
                        }, label: {
                            
                            HStack {
                                
                                Text("USD")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                             
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                            }
                                .padding(7)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.black.opacity(0.2)))
                        })
                    }
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteAllData()
                        
                    }, label: {
                        
                        Text("Reset Progress")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                }
                .padding()
                .background(Image("card2").resizable())
                .padding(.horizontal)
                
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.system(size: 19, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                Button(action: {
                    
                    guard let url = URL(string: "") else { return }
                    
                    UIApplication.shared.open(url)
                    
                }, label: {
                    
                    Text("Usage Policy")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                        .padding(.horizontal)
                })
                
                Button(action: {
                    
                    SKStoreReviewController.requestReview()
                    
                }, label: {
                    
                    Text("Rate App")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                        .padding(.horizontal)
                })
                
                Spacer()
            }
        }
        .sheet(isPresented: $isChart, content: {
            
            SettingsChart()
        })
    }
}

#Preview {
    SettingsView()
}
