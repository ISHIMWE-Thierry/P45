import SwiftUI
import Firebase
import FirebaseAuth

struct PageTitle: View {
    var title: String
  
    var body: some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.primary)
            .padding()
    }
}

struct login: View {
       
      
        @State private var email = ""
       
        @State private var password = ""
        @State private var signInError: String?
        @State private var isSignedIn = false
        
    var body: some View {
        
        NavigationView{
          
            content
        }.navigationBarBackButtonHidden(true)
    }
    

        
    var content: some View {
        
           
        
        return VStack{
        
                VStack{ PageTitle(title: "Login")
                    Spacer()
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .onTapGesture {
                                        // Dismiss the keyboard when tapped outside the text field
                                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                    }
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .onTapGesture {
                                        // Dismiss the keyboard when tapped outside the text field
                                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                    }
                    
                    if let error = signInError {
                        Text(error)
                            .foregroundColor(.red)
                            .padding(.bottom, 10) // Add padding to separate the error message
                    }
                    NavigationLink("",destination: dash(item: 0.00), isActive: $isSignedIn)
                    Button{
                        loginfunk()
                    } label: {
                        Text(" login ")
                    }
                }
            
            
            VStack{
                Spacer()
                
                Spacer()
                Text("Don't have an account?")
                                .foregroundColor(.gray)
                
                NavigationLink("create account", destination:sighup())
                    .foregroundColor(.blue)
                Spacer()
            }
            
        }
                
                               
    }
    func loginfunk(){
        Auth.auth().signIn(withEmail: email,password:password){ Result,error in
            if error != nil{
                print(error!.localizedDescription)
                signInError = "Incorrect Username or Password"
            }
            else{
                isSignedIn = true
            }
        }

    }
   
}
        
    
