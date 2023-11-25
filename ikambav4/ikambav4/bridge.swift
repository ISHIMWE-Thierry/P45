
//
//  bridge.swift
//  ikambav4
//
//  Created by Ishimwe Thierry on 28.10.2023.
//

import SwiftUI
import Firebase
import FirebaseAuth
struct bridge: View {
    @State private var userIsLogged = false
    @State private var  isAppReady = false
    @State private var  isAppReadyx = true
    @State private var userEmail: String?
    var body: some View {
        NavigationView{
            if isAppReady {
                NavigationLink(
                    destination: dash(item: 0.00),
                    isActive: $isAppReady
                ) {
                    EmptyView()
                }
            }
            else
            { ZStack{
                ProgressView("...").onAppear {
                    Task {
                        await initializeApp()
                    }
                }
                
                
                if !isAppReady{
                    
                    NavigationLink(
                        destination: ContentView(),
                        isActive: $isAppReadyx
                    ) {
                        EmptyView()
                    }
                    
                }
            }
            } //end vstack
        }.navigationBarBackButtonHidden(true)
        }
    func initializeApp() async{
     
        Auth.auth().addStateDidChangeListener {
            auth, user in
            if user != nil{
                userIsLogged.toggle()
            }
           
        }
        
    if let user = Auth.auth().currentUser
        { self.userEmail = user.email
        isAppReady = true}
               
      
        }
      
    }
       
    
    


#Preview {
    bridge()
}














