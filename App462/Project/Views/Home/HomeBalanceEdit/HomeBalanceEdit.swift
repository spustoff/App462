//
//  HomeBalanceEdit.swift
//  App462
//
//  Created by IGOR on 08/04/2024.
//

import SwiftUI

struct HomeBalanceEdit: View {
    
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
                        
                        Text("Edit Balance")
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
                            
                            Text("Balance")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter amount")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.balance.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.balance)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .keyboardType(.decimalPad)
                            })
                        })
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Change")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter change")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.change.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.change)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .keyboardType(.decimalPad)
                            })
                        })
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Direction")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            Menu {
                                
                                ForEach(["Up", "Down"], id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.direction = index
                                        
                                    }, label: {
                                        
                                        HStack {
                                            
                                            Text(index)
                                            
                                            Spacer()
                                            
                                            if viewModel.direction == index {
                                                
                                                Image(systemName: "xmark")
                                            }
                                        }
                                    })
                                }
                                
                            } label: {
                                
                                HStack {
                                    
                                    Image(systemName: viewModel.direction == "Up" ? "chevron.up" : "chevron.down")
                                        .foregroundColor(viewModel.direction == "Up" ? .green : .red)
                                        .font(.system(size: 11, weight: .semibold))
                                    
                                    Text(viewModel.direction.isEmpty ? "Direction" : viewModel.direction)
                                        .foregroundColor(viewModel.direction == "Up" ? .green : .red)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
                                }
                            }
                        })
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        .padding()
                })
            }
        }
    }
}

#Preview {
    HomeBalanceEdit(viewModel: HomeViewModel())
}
