//
//  acc.swift
//  ikambav4
//
//  Created by Ishimwe Thierry on 21.10.2023.
//

import SwiftUI

struct acc: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var inputValue: String = "99"
    @State private var serviceFee: Double = 0
    @State var exchangeRate: Double 
        let baseCurrency = "RUB"
        let targetCurrency = "RWF"
    
    @State var email:String=""
    @State var fname = ""
    @State var phonenumber = ""
    
    
    @State  var total: Double = 0
    @State  var service: Double = 0
    
    @State var rname: String = ""
    @State var payme: String = ""
    @State var rtel: String = ""
    @State var rwf: String = ""
    @State var rub: String = ""
    
    var body: some View {
        NavigationView{
            ScrollView{
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
                        
                        Text("1 Of 4")
                            .padding()
                        
                        HStack{
                            Text("Tell Us Some Info About \nThe Receiver!")
                            
                                .padding()
                            
                                .bold()
                            Spacer()
                            
                        }
                        ZStack{
                            
                            
                            VStack{
                                
                                
                                
                                Text("Recipient’s Full Name:")
                                    .font(Font.custom("Noto Sans", size: 12))
                                
                                
                                
                                TextField("", text: $rname)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                
                                
                                
                                    .frame(width: 254, height: 60)
                                
                                    .cornerRadius(10)
                                
                                Picker("Payment method", selection: $payme) {
                                    Text("MTN(mobile payment)").tag("MTN(mobile payment")
                               
                                }
                                
                                Text("Recipient’s MoMo Tel. No :")
                                    .font(Font.custom("Noto Sans", size: 12))
                                
                                HStack{
                                    Text("+250")
                                        .font(Font.custom("Noto Sans", size: 12))
                                    TextField("ex:788802211", text: $rtel)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                    
                                        .keyboardType(.numberPad)
                                    
                                        .frame(width: 254, height: 60)
                                    
                                        .cornerRadius(10)
                                        .onTapGesture {
                                            // Dismiss the keyboard when tapped outside the text field
                                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                        }
                                    
                                }
                                
                                
                                
                                
                                
                                VStack{
                                    HStack{
                                        
                                        TextField("\(rub)", text: $rub)
                                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                            .keyboardType(.numberPad)
                                            .frame(width: 112, height: 50)
                                            .onTapGesture {
                                                // Dismiss the keyboard when tapped outside the text field
                                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                            }
                                        
                                        
                                        Text("Rubees")
                                            .font(
                                                Font.custom("Noto Sans",size: 10)
                                                    .weight(.medium)
                                            )
                                        
                                        
                                    }
                                    
                                    
                                }
                                
                                
                                
                                
                                
                                Text("Amount To Receive")
                                    .font(Font.custom("Noto Sans", size: 12))
                                
                                
                                
                                VStack{
                                    
                                    
                                    Text("RWF \((Double(rub) ?? 0) * exchangeRate,specifier: "%.2f")")
                                        .font(.headline)
                                        .padding()
                                }.onAppear{
                                    
                                    calculateServiceFee()
                                    service = serviceFee
                                    total = (Double(rub) ?? 0)+serviceFee
                                }
                                ZStack{
                                    Rectangle()
                                        .background(.black)
                                        .frame(width: 189, height: 42)
                                    
                                        .cornerRadius(15)
                                    if Double(rub) ?? 0 < 99 {
                                        Text(" Min Amout is 99 rubbles")
                                            .font(
                                                Font.custom("Noto Sans", size: 12)
                                                    .weight(.semibold)
                                            )
                                            .foregroundColor(.red)
                                        
                                    }
                                    else if rname != "" && rtel != ""{
                                        Text("Next")
                                            .font(
                                                Font.custom("Noto Sans", size: 12)
                                                    .weight(.semibold)
                                            )
                                            .foregroundColor(.gray)
                                        
                                        NavigationLink("Next", destination: acc2(rname: rname, rtel: rtel,rwf: String((Double(rub) ?? 0) * exchangeRate), rub: rub,total: total, service: service))
                                        
                                            .font(
                                                Font.custom("Noto Sans", size: 12)
                                                    .weight(.semibold)
                                            )
                                            .foregroundColor(.blue)
                                            
                                        
                                    }
                                    
                                    
                                }.padding()
                                Spacer()
                                Spacer()
                            }
                        }
                        
                    }
                }
                Spacer()
                Spacer()
            }.navigationBarBackButtonHidden(true)
        }
     
        }  .navigationBarBackButtonHidden(true)
    }
    
    func calculateServiceFee() {
        if Double(rub) ?? 0 < 99 {
            self.rub = "98"
        }
            if let numericValue = Double(rub) {
                if numericValue < 100 {
                    serviceFee = 0.0
                } else if numericValue < 1000 {
                    serviceFee = numericValue * 0.05
                } else if numericValue < 10000 {
                    serviceFee = numericValue * 0.04
                } else if numericValue < 50000 {
                    serviceFee = numericValue * 0.03
                } else if numericValue <= 150000 {
                    serviceFee = numericValue * 0.02
                } else {
                    serviceFee = 0.0
                }
            } else {
                serviceFee = 0.0
            }
        }

    
    
    func convertCurrency() {
       
        guard let amount = Double(rub) else {
            print("Invalid amount")
            return
        }

        let apiUrl = "https://api.exchangerate-api.com/v4/latest/RUB"

        guard let url = URL(string: apiUrl) else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }

            if let data = data {
                do {
                    let result = try JSONDecoder().decode(ExchangeRateResponse.self, from: data)
                    if let rate = result.rates[targetCurrency] {
                      
                            self.rwf = String(amount * (rate-0.2))

                       
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
    
    
}

    
   
