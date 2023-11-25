//
//  acc5.swift
//  ikambav4
//
//  Created by Ishimwe Thierry on 25.10.2023.
//

import SwiftUI

func generateUniqueTimeBasedID() -> Int {
    let currentTime = Date().timeIntervalSince1970
    return Int(currentTime * 1000) // Convert seconds to milliseconds and keep it as an integer
}





struct acc5: View {
    @State private var uniqueID: Int = 0
    
    @State  var rname: String = ""
    @State  var rtel: String = ""
    
    
    @State  var name: String = ""
    @State  var phonenumber: String = ""
    
    @State  var total: Double = 0
    @State  var rwf: String = ""
    
    @State private var timeRemaining = 900
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        ScrollView{
            VStack(){
                
                
                HStack{
                    Spacer()
                    NavigationLink(destination: dash(item: 0.00)) {
                        Text("home")
                            .padding()
                            .foregroundColor(.blue)
                        
                            .cornerRadius(10)
                    }
                    
                }
                ZStack{
                    Spacer()
                    VStack{
                        
                       
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        ZStack{
                            
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 246, height: 299)
                                
                                .cornerRadius(15)
                            VStack{
                                
                                Text("Transaction Follow Up")
                                  
                                    .padding()
                               
                                    .bold()
                                
                                
                                Text(" Receiver's Name: \(rname) \n Receiver's MoMo Tel No: \(rtel)\n Amount To Receive: \(Double(rwf) ?? 0,specifier: "%.2f") Rwf \n transaction id:\(String(uniqueID))" ).font(Font.custom("Noto Sans", size: 12))
                                  
                                    .padding()
                                
                                                  
                                                 
                                   
                                                  
                                Text("Status" ).font(Font.custom("Noto Sans", size: 12))
                            
                                    .padding()
                                Text("Pending")
                                  
                                    
                            
                                    .bold()
                                Text("Time: \(timeRemaining)")
                                    
                                  
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 1)
                                   
                             

                            }.onReceive(timer) { time in
                                if timeRemaining > 0 {
                                    timeRemaining -= 1
                                }
                            }
                         
                        }
                        
                             
                             
                             
                            
       
                            
                      
                                    
            
                    
                        
                        Link("Support Center", destination: URL(string: "tel:+79995522418")!)
                          
                            .padding()
                   
                            .font(Font.custom("Noto Sans", size: 12))
                            
                        
                    }
                }}.navigationBarBackButtonHidden(true)
                .onAppear {
                    Task {
                        uniqueID = generateUniqueTimeBasedID()
                    }
                }
         
        }
    }
    
}

#Preview {
    acc5()
}
