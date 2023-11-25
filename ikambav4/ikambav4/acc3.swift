//
//  acc3.swift
//  ikambav4
//
//  Created by Ishimwe Thierry on 24.10.2023.
//

import SwiftUI


struct acc3: View {
    @State  var rname: String = ""
    @State  var rtel: String = ""
    @State  var rwf: String = ""
    @State  var rub: String = ""
    @Environment(\.colorScheme) var colorScheme

    @State  var total: Double = 0
    @State  var service: Double = 0
    
    @State  var name: String = ""
    @State  var phonenumber: String = ""
    var body: some View {
        NavigationView{
            VStack(){
                
                HStack{
                    Spacer()
                    NavigationLink(destination: dash(item: 0.00)) {
                        Text("cancel")
                            .padding()
                            .cornerRadius(10)
                    }
                }
                Spacer()
                HStack(alignment: .center, spacing: 2)
                {
                    
                    ZStack{
                        Rectangle()
                        
                            .frame(width: 121.68, height: 39)
                        
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.16), radius: 12.5, x: 4, y: 4)
                        HStack{
                            Text("Russia")
                                .multilineTextAlignment(.center)
                                .foregroundColor(colorScheme == .light ? Color.white : Color.black)
                            Image("arrow")
                                .frame(width: 12, height: 11)
                        }
                    }
                    
                    ZStack{
                        Rectangle()
                        
                            .frame(width: 121.68, height: 39)
                            .background(.white)
                            .cornerRadius(15)
                        
                        Text("Rwanda")
                                        .foregroundColor(colorScheme == .light ? Color.white : Color.black)
                        
                    }
                }
                
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 314, height: 524)
                    
                    
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.16), radius: 12.5, x: 4, y: 4)
                    VStack{
                        
                        Text("3 Of 4")
                            .padding()
                        
                        HStack{
                            Text("Transaction Summery")
                            
                                .padding()
                            
                                .bold()
                            Spacer()
                        }
                        ZStack{
                
                            
                            VStack{
                               
                                
                                Text(" Receiver's Name: \(rname) \n Receiver's MoMo Tel No: \(rtel)\n Amount To receive: \(rwf) Rwf \n Sender's name: \(name)\n Sender's Phone number:\(phonenumber) \n\n\n " ).font(Font.custom("Noto Sans", size: 16))
                                    .foregroundColor(.gray)
                                    .bold()
                                    .padding()
                                Spacer()
                                Text(" Service Fee: \(service,specifier: "%.2f")\tRubees \n \n\n  Total: \(total,specifier: "%.2f")\t\tRubees")
                                    .bold()
                                    .font(.headline)
                                    .foregroundColor(.gray)
                            }
                            
                            
                        }
                    }
                    
                }
                
                ZStack{
                    Rectangle()
                        .background(.black)
                        .frame(width: 189, height: 42)
                    
                        .cornerRadius(15)
                    NavigationLink("Next", destination: acc4(rname: rname, rtel: rtel, name: name, phonenumber: phonenumber, total: total,rwf: rwf))
                    
                        .font(
                            Font.custom("Noto Sans", size: 12)
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
    acc3()
}


