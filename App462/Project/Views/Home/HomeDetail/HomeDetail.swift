//
//  HomeDetail.swift
//  App462
//
//  Created by IGOR on 08/04/2024.
//

import SwiftUI

struct HomeDetail: View {
    
    @Environment(\.presentationMode) var router
    let index: FranchiseModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(index.name ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                        
                        Spacer()
                    }
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(alignment: .leading, spacing: 30) {
                        
                        Text(index.category ?? "")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text(index.name ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 21, weight: .semibold))
                                .multilineTextAlignment(.leading)
                            
                            Text(index.text ?? "")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .multilineTextAlignment(.leading)
                        })
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            
                            Text("Key Financials:")
                                .foregroundColor(.gray)
                                .font(.system(size: 18, weight: .semibold))
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                                
                                VStack(alignment: .leading, spacing: 10, content: {
                                    
                                    Text("Initital Investment")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                    
                                    Text("$\(index.initital_investmne ?? "")")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .medium))
                                })
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                                
                                VStack(alignment: .leading, spacing: 10, content: {
                                    
                                    Text("Avg. profit Margin")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                    
                                    Text("\(index.avg_profit_margine ?? "")%")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .medium))
                                })
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                                
                                VStack(alignment: .leading, spacing: 10, content: {
                                    
                                    Text("Royalty Fee")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                    
                                    Text("\(index.royalty_fee ?? "")%")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .medium))
                                })
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                                
                                VStack(alignment: .leading, spacing: 10, content: {
                                    
                                    Text("Avg. Annuals Sales")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                    
                                    Text("$\(index.avg_annual_sales ?? "")")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .medium))
                                })
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                            })
                        })
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            
                            Text("Geographical Presence:")
                                .foregroundColor(.gray)
                                .font(.system(size: 18, weight: .semibold))
                            
                            Text(index.geo_presence ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .multilineTextAlignment(.leading)
                        })
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            
                            Text("Franchise Requirements:")
                                .foregroundColor(.gray)
                                .font(.system(size: 18, weight: .semibold))
                            
                            HStack {
                                
                                Text("Min. Liquid Capital:")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .medium))
                                
                                Spacer()
                                
                                Text("$\(index.min_liq_capital ?? "")")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .medium))
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                        })
                        
                        HStack {
                            
                            Text(index.something ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            Spacer()
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                    }
                    .padding()
                }
            }
        }
    }
}

//#Preview {
//    HomeDetail()
//}
