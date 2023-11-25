//
//  dash.swift
//  ikambav4
//
//  Created by Ishimwe Thierry on 03.11.2023.
//
import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseAuth
let db = Firestore.firestore()
struct dash: View {
    @State var item: Double
    @State private var userIsLogged = false
    @State private var next = false
    @State private var  isAppReady = false
    @State private var isSignedIn = false
    @State private var userEmail: String = ""
    @State private var rubToRwfRate: Double?
    @State private var xitem: Int?
    
    @State private var baseAmount: String = ""{
        didSet {
            self.next=false
        
        }
    }
    @State private var selectedBaseCurrency: String = "RUB"{
        didSet {
            self.next=false
        
        }
    }
       
    @State private var selectedTargetCurrency: String = "RWF"{
        didSet {
            self.next=false
        
        }
    }
    @State private var convertedAmount: Double?
    @State private var rate: Double?
    @State private var xrate: Double=0
    @State private var realrate: Double?
    
    let baseCurrency = "RUB"
    let targetCurrency = "RWF"
    
    var body: some View {
        NavigationView{
            
            VStack {
                
                
                HStack{
                    
                    Text("\(userEmail)")
                        .bold()
                        .padding()
                    Spacer()
                    NavigationLink("",destination: login(), isActive: $isSignedIn)
                    
                    Button(action: {
                        // Perform the logout action here
                        do {
                            try Auth.auth().signOut()
                            isSignedIn = true
                        } catch {
                            print("Error signing out: \(error.localizedDescription)")
                        }
                    }) {
                        Label("Sign out", systemImage: "arrow.left.square")
                            .padding()
                    }
                }
                Spacer()
              
                
                    VStack {
                        Text("Check the rates first!")
                            .font(.title)

                        TextField("Enter amount in ₽", text: $baseAmount)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                            .onTapGesture {
                                self.next=false
                            }
                            .onChange(of: baseAmount){self.next=false
                            }

                        HStack {
                            CurrencyPicker(selectedCurrency: $selectedBaseCurrency)
                            Text("to")
                            CurrencyPicker(selectedCurrency: $selectedTargetCurrency)
                        }.onTapGesture {
                            self.next=false
                        }

                        Button("Convert") {
                            convertCurrency()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)

                        if let convertedAmount = convertedAmount {
                            Text("Amount: \(convertedAmount, specifier: "%.2f") \(selectedTargetCurrency)")
                        }
                    }
                    .padding()
                
                
                Text("Press convert to allow New Transaction")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                Spacer()
               
                //logout
                
                if selectedBaseCurrency == "RUB" && selectedTargetCurrency == "RWF" && baseAmount != "" && xrate != 0 && next
                {
                    NavigationLink(destination: acc(exchangeRate: rate ?? 0,rwf: String(convertedAmount ?? 0),rub:baseAmount)) {
                        Label("New Transaction", systemImage: "plus.circle")
                        
                    }
                    
                }
                if selectedBaseCurrency == "RWF"  && selectedTargetCurrency == "RUB" && baseAmount != "" && xrate != 0 && next
                {
                    NavigationLink(destination: acc(exchangeRate: 0.005+(realrate ?? 0)  ,rwf:baseAmount,rub: String(convertedAmount ?? 0))) {
                        Label("New Transaction", systemImage: "plus.circle")
                        
                    }
                    
                }
                Spacer()
                
                
            }
            
            .onAppear{
                Auth.auth().addStateDidChangeListener {
                    auth, user in
                    if user != nil{
                        userIsLogged.toggle()
                        if let user = Auth.auth().currentUser {
                            self.userEmail = user.email ?? ""
                        }
                    }
                }
            }
            
            
            
            //end vstack
        }.navigationBarBackButtonHidden(true)
    }
    
    
    func convertCurrency() {
        self.next=true
        guard let amount = Double(baseAmount) else {
            print("Invalid amount")
            return
        }

        let apiUrl = "https://api.exchangerate-api.com/v4/latest/\(selectedBaseCurrency)"

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
                    if let rate = result.rates[selectedTargetCurrency] {
                        if selectedBaseCurrency == "RWF" { self.convertedAmount = amount * (rate + 0.005)
                            self.realrate=rate
                            self.xrate=(rate)
                            self.rate=xrate
                        }
                        if selectedBaseCurrency == "RUB"{ self.convertedAmount = amount * (rate-0.67)
                            self.realrate=rate
                            self.xrate=(rate-0.67)
                            self.rate=xrate
                        }
                        if selectedBaseCurrency==selectedTargetCurrency{
                            self.convertedAmount=Double(baseAmount)}
                       
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
}



struct CurrencyPicker: View {
    @Binding var selectedCurrency: String
  

    var body: some View {
        Picker("", selection: $selectedCurrency) {
            Text("RWF").tag("RWF")
            Text("RUB").tag("RUB")
            
            // Add more currencies as needed
        }
        .pickerStyle(SegmentedPickerStyle())
       
    }
}

struct ExchangeRateResponse: Codable {
    let rates: [String: Double]
}
    
    
    
    

