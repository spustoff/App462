//
//  TransactionAdd.swift
//  App462
//
//  Created by IGOR on 08/04/2024.
//

import SwiftUI

struct TransactionAdd: View {
    
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
                        
                        Text("Add Transaction")
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
                            
                            Text("Amount")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter amount")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.transaction_amount.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.transaction_amount)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .keyboardType(.decimalPad)
                            })
                        })
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Buyer")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            Menu {
                                
                                ForEach(viewModel.buyers, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.transaction_buyer = ((index.first_name ?? "") + (index.second_name ?? ""))
                                        
                                    }, label: {
                                        
                                        HStack {
                                            
                                            Text((index.first_name ?? "") + (index.second_name ?? ""))
                                            
                                            Spacer()
                                            
                                            if viewModel.transaction_buyer == ((index.first_name ?? "") + (index.second_name ?? "")) {
                                                
                                                Image(systemName: "xmark")
                                            }
                                        }
                                    })
                                }
                                
                            } label: {
                                
                                HStack {
                                    
                                    Text(viewModel.buyers.isEmpty ? "No any buyers you have" : viewModel.transaction_buyer.isEmpty ? "Not selected buyer" : viewModel.transaction_buyer)
                                        .foregroundColor(viewModel.buyers.isEmpty || viewModel.transaction_buyer.isEmpty ? .red : .white)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
                                }
                            }
                        })
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Franchise")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            Menu {
                                
                                ForEach(viewModel.franchises, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.transaction_franchise = index.name ?? ""
                                        
                                    }, label: {
                                        
                                        HStack {
                                            
                                            Text(index.name ?? "")
                                            
                                            Spacer()
                                            
                                            if viewModel.transaction_franchise == index.name ?? "" {

                                                Image(systemName: "xmark")
                                            }
                                        }
                                    })
                                }
                                
                            } label: {
                                
                                HStack {
                                    
                                    Text(viewModel.franchises.isEmpty ? "No any franchises you have" : viewModel.transaction_franchise.isEmpty ? "Not selected franchise" : viewModel.transaction_franchise)
                                        .foregroundColor(viewModel.franchises.isEmpty || viewModel.transaction_franchise.isEmpty ? .red : .white)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
                                }
                            }
                        })
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Direction")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            Menu {
                                
                                ForEach(["Up", "Down"], id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.transaction_direction = index
                                        
                                    }, label: {
                                        
                                        HStack {
                                            
                                            Text(index)
                                            
                                            Spacer()
                                            
                                            if viewModel.transaction_direction == index {
                                                
                                                Image(systemName: "xmark")
                                            }
                                        }
                                    })
                                }
                                
                            } label: {
                                
                                HStack {
                                    
                                    Image(systemName: viewModel.transaction_direction == "Up" ? "chevron.up" : "chevron.down")
                                        .foregroundColor(viewModel.transaction_direction == "Up" ? .green : .gray)
                                        .font(.system(size: 11, weight: .semibold))
                                    
                                    Text(viewModel.transaction_direction.isEmpty ? "Select Direction" : viewModel.transaction_direction)
                                        .foregroundColor(viewModel.transaction_direction == "Up" ? .green : .gray)
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
                    
                    viewModel.addTransaction()
                    viewModel.fetchTransactions()
                    
                    router.wrappedValue.dismiss()
                    
                    viewModel.transaction_amount = ""
                    viewModel.transaction_buyer = ""
                    viewModel.transaction_franchise = ""
                    viewModel.transaction_direction = ""
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        .padding()
                })
                .opacity(viewModel.transaction_amount.isEmpty || viewModel.transaction_buyer.isEmpty || viewModel.transaction_franchise.isEmpty || viewModel.transaction_direction.isEmpty ? 0.5 : 1)
                .disabled(viewModel.transaction_amount.isEmpty || viewModel.transaction_buyer.isEmpty || viewModel.transaction_franchise.isEmpty || viewModel.transaction_direction.isEmpty ? true : false)
            }
        }
        .onAppear {
            
            viewModel.fetchBuyers()
            viewModel.fetchFranchies()
        }
    }
}

#Preview {
    TransactionAdd(viewModel: HomeViewModel())
}
