//
//  acc4.swift
//  ikambav4
//
//  Created by Ishimwe Thierry on 25.10.2023.
//

import SwiftUI

struct acc4: View {
    
    @State  var rname: String = ""
    @State  var rtel: String = ""
    @Environment(\.colorScheme) var colorScheme

    
    @State  var name: String = ""
    @State  var phonenumber: String = ""
    
    @State  var total: Double = 0
    @State  var rwf: String = ""
    
    @State private var Hname: String = ""
    @State private var Cnum: String = ""
    @State private var Exdate: String = ""
    @State private var CVC: String = ""
    var body: some View {
        NavigationView{
           
            VStack(){
                
                HStack{
                    Spacer()
                    NavigationLink(destination: dash(item: 0.00)) {
                        Text("cancel")
                            .padding()
                            .foregroundColor(.blue)
                        
                            .cornerRadius(10)
                    }
                }
                Spacer()
                HStack(alignment: .center, spacing: 2)
                {
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 121.68, height: 39)
                            .background(.white)
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.16), radius: 12.5, x: 4, y: 4)
                        
                        HStack{
                            Text("Russia")
                                .font(
                                    Font.custom("Noto Sans", size: 12)
                                        .weight(.semibold)
                                )
                                .foregroundColor(colorScheme == .light ? Color.white : Color.black)
                                .multilineTextAlignment(.center)
                            
                            Image("arrow")
                                .frame(width: 12, height: 11)
                            
                        }
                    }
                    
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 121.68, height: 39)
                            .background(.white)
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.16), radius: 12.5, x: 4, y: 4)
                        Text("Rwanda")
                            .font(
                                Font.custom("Noto Sans", size: 12)
                                    .weight(.medium)
                            )
                            .foregroundColor(colorScheme == .light ? Color.white : Color.black)
                    }
                }
                Spacer()
                Spacer()
                ZStack{
                    
                    VStack{
                        
                        Text("4 Of 4")
                        
                            .font(
                                Font.custom("Noto Sans", size: 12)
                                    .weight(.semibold)
                                
                            )
                            .padding()
                      
                        HStack{
                            Text(" Send Money And Get \n It Done In 15 min")
                                .padding()
                            
                                .bold()
                           
                        }
                        
                        Text("  Amount to receive: \(Double(rwf) ?? 0,specifier: "%.2f") RWF" ).font(Font.custom("Noto Sans", size: 12))
                            .bold()
                            .padding()
                        
                        Text("  Total: \(total,specifier: "%.2f") Rubees" ).font(Font.custom("Noto Sans", size: 12))
                            .bold()
                            .padding()
                       
                        
                        
                        ZStack{
                           
                            
                            VStack{
                                Text("Card Holder Name:")
                                    .font(.system(size: 12))
                                 
                                TextField("ex: Ronard Gakire",text: $Hname)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                
                               
                              
                                    .frame(width: 224, height: 60)
                             
                                    .cornerRadius(10)
                                    .onTapGesture {
                                                    // Dismiss the keyboard when tapped outside the text field
                                                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                                }
                                Text("Card Number:")
                                    .font(.system(size: 12))
                                 
                                TextField("ex: 2009988776678",text: $Cnum)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                
                                    .keyboardType(.numberPad)
                                  
                                    .frame(width: 224, height: 60)
                              
                                    .cornerRadius(10)
                                    .onTapGesture {
                                                    // Dismiss the keyboard when tapped outside the text field
                                                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                                }
                                HStack{
                                    VStack{
                                        Text("Expire Date")
                                            .font(.system(size: 12))
                                          
                                        TextField("ex:20/80",text: $Exdate)
                                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                        
                                            .keyboardType(.numberPad)
                                        
                                            .frame(width: 80, height: 60)
                                    
                                            .cornerRadius(10)
                                            .onTapGesture {
                                                            // Dismiss the keyboard when tapped outside the text field
                                                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                                        }
                                    }
                                    VStack{
                                        Text("CVC")
                                            .font(.system(size: 12))
                                       
                                        TextField("ex:8090",text: $CVC)
                                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                        
                                            .keyboardType(.numberPad)
                                 
                                            .frame(width: 80, height: 60)
                                          
                                            .cornerRadius(10)
                                            .onTapGesture {
                                                            // Dismiss the keyboard when tapped outside the text field
                                                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                                        }
                                    }
                                }
                            }
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                    }
                }
                ZStack{
                 
                    NavigationLink("pay",destination:acc5(rname: rname, rtel: rtel, name: name, phonenumber: phonenumber, total: total,rwf: rwf))
                        .font(
                            Font.custom("Noto Sans", size: 16)
                                .weight(.semibold)
                        )
                        .foregroundColor(.blue)
                
                }.padding()
               Spacer()
                Spacer()
            }
         
          
            }.navigationBarBackButtonHidden(true)
        }
    }

#Preview {
    acc4()
}
