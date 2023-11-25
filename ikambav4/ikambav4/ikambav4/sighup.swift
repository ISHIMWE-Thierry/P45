import SwiftUI
import FirebaseDatabase
import FirebaseAuth
import FirebaseFirestore

struct sighup: View {
    @State private var pageIndex = 2
    @State private var isSignedIn = false
    @State private var email = ""
    @State private var password = ""
    @State private var name = ""
    @State private var phonenumber = ""
    @State private var signInError = ""
    @State private var signInErro = false
    
    
    var body: some View {
        NavigationView{
            
            
            
            VStack{
                PageTitle(title: "Create Account")
                
                Spacer()
                Spacer()
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .padding()
                    .onTapGesture {
                        // Dismiss the keyboard when tapped outside the text field
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                
                SecureField("Create Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                    .autocapitalization(.none)
                    .keyboardType(.default)
                    .padding()
                    .onTapGesture {
                        // Dismiss the keyboard when tapped outside the text field
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                
                TextField("Full Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                    .autocapitalization(.none)
                    .keyboardType(.namePhonePad)
                    .padding()
                    .onTapGesture {
                        // Dismiss the keyboard when tapped outside the text field
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                
                HStack{
                    Text("+7")
                        .font(Font.custom("Noto Sans", size: 12))
                    
                    TextField("Phone Number", text: $phonenumber)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                        .autocapitalization(.none)
                        .keyboardType(.numberPad)
                        .padding()
                        .onTapGesture {
                            // Dismiss the keyboard when tapped outside the text field
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }
                }
                
                if  signInErro{
                    Text(signInError)
                        .foregroundColor(.red)
                        .padding(.bottom, 10) // Add padding to separate the error message
                }
                NavigationLink("", destination: dash(item: 0.00), isActive: $isSignedIn)
                
                
                Button{
                    registerfunk()
                    
                    
                } label: {
                    Text("create account")
                }
                
                
                Spacer()
                
                Spacer()
                Text("Already have an account?")
                    .foregroundColor(.gray)
                
                NavigationLink("login", destination:login())
                    .foregroundColor(.blue)
                Spacer()
                
                
            }.padding()
            
            
            
        }.navigationBarBackButtonHidden(true)
        
        
        
    }
    func registerfunk(){
        if phonenumber.count == 10 && name != ""
        {
            Auth.auth().createUser(withEmail: email,password:password){ Result,error in
            if error != nil{
                print(error!.localizedDescription)
                signInError = error!.localizedDescription
                signInErro = true
            }
            else if let authResult = Result {
                let db = Firestore.firestore()
                let userRef = db.collection("users").document(authResult.user.uid)
                
                let userData: [String: Any] = [
                    "name": name,
                    "phonenumber": Int(phonenumber) ?? 0,
                    "email": email
                ]
                
                userRef.setData(userData) { error in
                    if let error = error {
                        print("Error adding user data: \(error)")
                        
                        
                    } else {
                        print("User data added successfully")
                        isSignedIn = true
                    }
                }
            }
        }
        
    }
    else
        {
        signInErro=true
        self.signInError = "Phone Number Must Be 10 Digit!"
    }
}
    

    
    }

