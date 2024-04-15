//
//  HomeView.swift
//  App462
//
//  Created by IGOR on 08/04/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                
                VStack(spacing: 40) {
                    
                    HStack {
                        
                        Text("Wallet")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .semibold))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.isEditBalance = true
                            
                        }, label: {
                            
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                                .padding(4)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                        })
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("$\(viewModel.balance)")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .semibold))
                        
                        Text("+$\(viewModel.change) (-34,5%)")
                            .foregroundColor(.green)
                            .font(.system(size: 13, weight: .regular))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                .background(Image("card2").resizable())
                
                HStack {
                    
                    VStack(alignment: .leading) {
                        
                        Text("Staff Utilisation")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .medium))
                        
                        Text("For all time")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                        
                        Text("0%")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .padding(.top, 4)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                    
                    VStack(alignment: .leading) {
                        
                        Text("Growth Dynamics")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .medium))
                        
                        Text("For all time")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                        
                        Text("0%")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .padding(.top, 4)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                }
                
                HStack {
                    
                    Button(action: {
                        
                        viewModel.isTransactions = true
                        
                    }, label: {
                        
                        VStack(alignment: .leading, spacing: 15) {
                            
                            Image(systemName: "creditcard")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .padding(4)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color.white.opacity(0.15)))

                            Text("Transactions")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                                .padding(.top, 4)
                        }
                        .padding()
                        .frame(height: 100)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                    })
                    
                    Button(action: {
                        
                        viewModel.isBuyers = true
                        
                    }, label: {
                        
                        VStack(alignment: .leading, spacing: 15) {
                            
                            Image(systemName: "person.2.fill")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .padding(4)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color.white.opacity(0.15)))

                            Text("Buyers")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                                .padding(.top, 4)
                        }
                        .padding()
                        .frame(height: 100)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.1)))
                    })
                }
                
                HStack {
                    
                    Text("Your assets")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.isAddFranchise = true
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .font(.system(size: 13, weight: .semibold))
                            .padding(4)
                            .background(RoundedRectangle(cornerRadius: 5).fill(.white.opacity(0.4)))
                    })
                }
                
                if viewModel.franchises.isEmpty {
                    
                    VStack(alignment: .center, spacing: 10, content: {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 23, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("No any franchises you have.")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                    .padding()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.franchises, id: \.self) { index in
                            
                                NavigationLink(destination: {
                                    
                                    HomeDetail(index: index)
                                        .navigationBarBackButtonHidden()
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 4, content: {
                                            
                                            Text(index.name ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 15 ,weight: .semibold))
                                                .multilineTextAlignment(.leading)
                                                .lineLimit(1)
                                            
                                            Text(index.text ?? "")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 13 ,weight: .regular))
                                                .multilineTextAlignment(.leading)
                                                .lineLimit(1)
                                        })
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12, weight: .regular))
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                                })
                            }
                        }
                    }
                }

            }
            .padding([.horizontal, .bottom])
        }
        .onAppear {
            
            viewModel.fetchTransactions()
            viewModel.fetchBuyers()
            viewModel.fetchFranchies()
        }
        .sheet(isPresented: $viewModel.isEditBalance, content: {
            
            HomeBalanceEdit(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isTransactions, content: {
            
            HomeTransactions(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isBuyers, content: {
            
            HomeBuyers(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isAddFranchise, content: {
            
            HomeAddFranchise(viewModel: viewModel)
        })
    }
}

#Preview {
    HomeView()
}
