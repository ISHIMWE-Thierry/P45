//
//  acc2.swift
//  ikambav4
//
//  Created by Ishimwe Thierry on 24.10.2023.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
struct acc2: View {
    @State  var rname: String = ""
    @State  var rtel: String = ""
    @State  var rwf: String = ""
    @State  var rub: String = ""
    
    @Environment(\.colorScheme) var colorScheme

    @State  var total: Double = 0
    @State  var service: Double = 0
    
    @State var xemail = ""
    
    @State var xfname = ""
    @State var xphonenumber = ""
    
    
    
    @State var email = ""
    
    @State var fname = ""
    @State var phonenumber = ""
    @State private var isTextFieldDisabled = true
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
                        
                        Text("2 Of 4")
                            .padding()
                        
                        HStack{
                            Text("Info About \nThe Sender!")
                            
                                .padding()
                            
                                .bold()
                            Spacer()
                            
                        }
                        ZStack{
                            
                            
                            VStack{
                                
                                
                                
                                Text("Sender’s Full Name:")
                                    .font(Font.custom("Noto Sans", size: 12))
                                
                                
                                
                                TextField("\(xfname)", text: $xfname)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                
                                    .keyboardType(.numberPad)
                                
                                    .frame(width: 254, height: 60)
                                    .disabled(isTextFieldDisabled)
                                    .cornerRadius(10)
                                
                                
                                
                                
                                Text("Senders’s Tel. No :")
                                    .font(Font.custom("Noto Sans", size: 12))
                                
                                
                                TextField("\(xphonenumber)", text: $xphonenumber)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .disabled(isTextFieldDisabled)
                                    .keyboardType(.numberPad)
                                 
                                    .frame(width: 254, height: 60)
                                
                                    .cornerRadius(10)
                                
                                Spacer()
                                
                                
                                Text("Money to send in rubles: \(Double(rub) ?? 0,specifier: "%.2f")")
                                    .font(.headline)
                                
                                
                                
                                
                                
                                ZStack{
                                    Rectangle()
                                        .background(.black)
                                        .frame(width: 189, height: 42)
                                    
                                        .cornerRadius(15)
                                    NavigationLink("Next", destination: acc3(rname: rname, rtel: rtel,rwf: rwf, rub: rub,total:total, service:service, name: xfname,phonenumber: xphonenumber))
                                    
                                        .font(
                                            Font.custom("Noto Sans", size: 12)
                                                .weight(.semibold)
                                        )
                                        .foregroundColor(.blue)
                                    
                                }.padding()
                                
                            }
                        }
                        
                    }
                }
                Spacer()
                Spacer()
            }.navigationBarBackButtonHidden(true)
            
                .onAppear {
                    // Get the currently authenticated user
                    if let user = Auth.auth().currentUser {
                        // Access the user's UID
                        let userID = user.uid
                       
                        // Access Firestore and the "users" collection
                        let db = Firestore.firestore()
                        let userRef = db.collection("users").document(userID)
                        
                        // Retrieve the user's data
                        userRef.getDocument { (document, error) in
                            if let document = document, document.exists {
                                if let data = document.data() {
                                    if let uname = data["name"] as? String {
                                        xfname = uname
                                    }
                                    if let uphoneNumber = data["phonenumber"] as? Int {
                                        xphonenumber = String( uphoneNumber)
                                    }
                                }
                            } else {
                                print("Document does not exist or there was an error: \(error?.localizedDescription ?? "Unknown error")")
                            }
                        }
                    }
                }
            
        }.navigationBarBackButtonHidden(true)
    }
}
#Preview {
    acc2()
}
