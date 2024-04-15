//
//  HomeAddFranchise.swift
//  App462
//
//  Created by IGOR on 08/04/2024.
//

import SwiftUI

struct HomeAddFranchise: View {
    
    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .center, spacing: 20, content: {
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.gray.opacity(0.3))
                        .frame(width: 40, height: 5)
                    
                    ZStack {
                        
                        Text("Add Franchise")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .semibold))
                        
                        HStack {
                            
                            Button(action: {
                                
                                router.wrappedValue.dismiss()
                                
                            }, label: {
                                
                                Image(systemName: "xmark")
                                    .foregroundColor(.white)
                                    .font(.system(size: 10, weight: .semibold))
                                    .frame(width: 25, height: 25)
                                    .background(Circle().fill(.gray.opacity(0.2)))
                            })
                            
                            Spacer()
                        }
                    }
                })
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 20) {
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter Name")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.name.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.name)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        })
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Category")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.category.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.category)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        })
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Description")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter Description")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.text.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.text)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        })
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Initial Investment")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter Investment")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.initital_investmne.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.initital_investmne)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        })
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Avg. Profit Margine")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter Profit")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.avg_profit_margine.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.avg_profit_margine)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        })
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Avg. Annual Sales")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter Annual Sales")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.avg_annual_sales.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.avg_annual_sales)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        })
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Royalty Fee")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter Royalty")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.royalty_fee.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.royalty_fee)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        })
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Geographical Presence")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.geo_presence.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.geo_presence)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        })
                        .padding(.bottom)
                    
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Min. Liquid Capital")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.min_liq_capital.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.min_liq_capital)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        })
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Comment")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.fran_something.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.fran_something)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        })
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addFranchise()
                    viewModel.fetchFranchies()
                    
                    router.wrappedValue.dismiss()
                    
                    viewModel.name = ""
                    viewModel.category = ""
                    viewModel.text = ""
                    viewModel.initital_investmne = ""
                    viewModel.avg_profit_margine = ""
                    viewModel.avg_annual_sales = ""
                    viewModel.royalty_fee = ""
                    viewModel.geo_presence = ""
                    viewModel.min_liq_capital = ""
                    viewModel.fran_something = ""
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        .padding()
                })
                .opacity(viewModel.name.isEmpty || viewModel.category.isEmpty || viewModel.text.isEmpty || viewModel.initital_investmne.isEmpty || viewModel.avg_profit_margine.isEmpty || viewModel.avg_annual_sales.isEmpty || viewModel.royalty_fee.isEmpty || viewModel.geo_presence.isEmpty || viewModel.min_liq_capital.isEmpty || viewModel.fran_something.isEmpty ? 0.5 : 1)
                .disabled(viewModel.name.isEmpty || viewModel.category.isEmpty || viewModel.text.isEmpty || viewModel.initital_investmne.isEmpty || viewModel.avg_profit_margine.isEmpty || viewModel.avg_annual_sales.isEmpty || viewModel.royalty_fee.isEmpty || viewModel.geo_presence.isEmpty || viewModel.min_liq_capital.isEmpty || viewModel.fran_something.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    HomeAddFranchise(viewModel: HomeViewModel())
}
