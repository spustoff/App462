//
//  BuyersAdd.swift
//  App462
//
//  Created by IGOR on 08/04/2024.
//

import SwiftUI

struct BuyersAdd: View {
    
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
                        
                        Text("Add Buyer")
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
                            
                            Text("First Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.buyer_firstName.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.buyer_firstName)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        })
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Second Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Example")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.buyer_secondName.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.buyer_secondName)
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
                    
                    viewModel.addBuyer()
                    viewModel.fetchBuyers()
                    
                    router.wrappedValue.dismiss()
                    
                    viewModel.buyer_firstName = ""
                    viewModel.buyer_secondName = ""
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        .padding()
                })
                .opacity(viewModel.buyer_firstName.isEmpty || viewModel.buyer_secondName.isEmpty ? 0.5 : 1)
                .disabled(viewModel.buyer_firstName.isEmpty || viewModel.buyer_secondName.isEmpty ? true : false)
            }
        }
        .onAppear {
            
            viewModel.fetchBuyers()
            viewModel.fetchFranchies()
        }
    }
}

#Preview {
    BuyersAdd(viewModel: HomeViewModel())
}
