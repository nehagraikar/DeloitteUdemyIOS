//
//  LoginView.swift
//  DeloitteUdemyIOS
//
//  Created by nraikar on 13/12/21.
//

import SwiftUI


struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    var user = UserViewModel().userData
    var body: some View {
        NavigationView{
        VStack{
            user.image
            .resizable()
            .scaledToFill()
            .frame(width: 150, height: 150, alignment: .center)
            .cornerRadius(100)
            .padding(.bottom)
            TextField("Enter your Username", text: $username)
                .padding(.all, 20.0)
                .background(Color(hue: 1.0, saturation: 0.007, brightness: 0.846))
            TextField("Enter your Password", text: $password)
                .padding(.all, 20.0)
                .background(Color(hue: 1.0, saturation: 0.007, brightness: 0.846))
            NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)) {
                            Text("Login")
                    .padding(.horizontal, 40)
                    .padding(.vertical, 10.0)

                    .foregroundColor(Color.white)
                    .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                    .background(Color.orange)
                    .cornerRadius(10)
            }
                
        }
        .padding(.horizontal, 30.0)
    }
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let user:UserModel = UserModel(id: 1, username: "neharaikar", password: "123", name: "Neha Raikar", bandName: "B7", role: "Software Development Engineer - 1", skills: "Java, iOS", level: "Intermediate", bio: "Enthusiastic learner", imageName: "neha")
        LoginView(user: user)
    }
}
