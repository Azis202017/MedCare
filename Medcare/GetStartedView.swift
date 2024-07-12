import SwiftUI

struct GetStartedView: View {
   
    @State private var showAlert = false
    var body: some View {
        ZStack {
            Color(Color("BackgroundColor"))
                .ignoresSafeArea()
            
            
            VStack {
                Language(languageAction : {
                    self.showAlert = true
                })
                
                Spacer()
                LogoAndText()
                
                Spacer()
                
                ButtonNavigation(nextAction : {
                    print("Hello World")
                }, registerAction: {
                    print("Register")
                })
                
                
            }.padding(.horizontal,28)
            
        }
      
        
        .alert(isPresented: $showAlert, content: alertMessage)
    }
    func alertMessage() -> Alert{
        Alert(title: Text("Opss Something Wrong!"),
              message: Text("This feature still under maintenance"),
              dismissButton: .default(Text("OK")))
    }
}


struct Language: View {
    var languageAction : (()-> Void)?
    var body: some View {
        HStack{
            Spacer()
            Button(action: {
                self.languageAction?()
            }, label: {
                Text("English")
                    .padding()
            })
            .frame(maxWidth:93, maxHeight:33)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color("PrimaryColor"), lineWidth: 1)
            )
        }
        .frame(maxWidth:.infinity)
    }
}

struct LogoAndText: View {
    var body: some View {
        VStack {
            Image("LogoWhite")
                .resizable()
                .scaledToFit()
                .frame(width: 183, height: 166.58)
            Text("We're here to help keep you healthy")
                .font(.custom("Khula-Regular", size: 16))
             
        }
    }
}

struct ButtonNavigation: View {
    var nextAction : (() -> Void)?
    var registerAction : (()-> Void)?
    var body: some View {
        VStack {
            Button(action:{
                self.nextAction?()
            }, label: {
                Spacer()
                Text("Next")
                    .font(.custom("Khula-Bold",size: 16))
                    .padding()
                Spacer()
            })
            .frame(maxWidth: .infinity)
        
            .background(Color("PrimaryColor"))
            .foregroundColor(.white)
            .cornerRadius(24)
            .contentShape(Rectangle())
            Spacer()
                .frame(height:16)
            
            Button(action: {
                self.registerAction?()
            }, label: {
                Spacer()
                Text("Register")
                    .foregroundColor(Color("SecondaryColor"))
                    .padding()
                Spacer()
            }) .frame(maxWidth:.infinity, maxHeight:51)
                .cornerRadius(24)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color("SecondaryColor"), lineWidth: 1)
                ).contentShape(Rectangle())
        }.navigationBarHidden(true)
    }
}
#Preview {
    GetStartedView()
}
