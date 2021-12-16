//
//  ProfileView.swift
//  DeloitteUdemyIOS
//
//  Created by nraikar on 13/12/21.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var userViewModel : UserViewModel = UserViewModel()
    
    @AppStorage("loggedIn") var loggedIn:Bool = true;
    
    var body: some View {

        VStack(alignment: .center, spacing: 0){
            Text("Profile").font(Font.system(size: 20, weight: .bold, design: .rounded)).padding(.bottom)
            Divider()
            ScrollView{
            userViewModel.userData.image
            .resizable()
            .scaledToFill()
            .frame(width: 150, height: 150, alignment: .center)
            .cornerRadius(100)
            .padding(.vertical)
            Divider()
            Group{
            HStack{
                VStack(alignment: .leading){
                    Text("Name ")
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.leading)
                        .padding(.vertical, 3.0)
                    Text("\(userViewModel.userData.name)").font(Font.system(size: 25, weight: .semibold, design: .rounded)).padding(.bottom)
                }
                Spacer()
                
            }
            .padding(.horizontal)
            Divider()
            .padding(.leading)
            HStack{
                VStack(alignment: .leading){
                    Text("Band")
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.leading)
                        .padding(.vertical, 3.0)
                    Text("\(userViewModel.userData.bandName)").font(Font.system(size: 25, weight: .semibold, design: .rounded)).padding(.bottom)
                }
                Spacer()
                VStack(alignment: .leading){
                    Text("Role")
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.leading)
                        .padding(.vertical, 3.0)
                    Text("\(userViewModel.userData.role)").font(Font.system(size: 25, weight: .semibold, design: .rounded)).padding(.bottom)
                }
                Spacer()
                
            }
            .padding(.horizontal)
            Divider()
            .padding(.leading)
            HStack{
                VStack(alignment: .leading){
                    Text("Skills")
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.leading)
                        .padding(.vertical, 3.0)
                    Text("\(userViewModel.userData.skills)").font(Font.system(size: 25, weight: .semibold, design: .rounded)).padding(.bottom)
                }
                Spacer()
                VStack(alignment: .leading){
                    Text("Level")
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.leading)
                        .padding(.vertical, 3.0)
                    Text("\(userViewModel.userData.level)").font(Font.system(size: 25, weight: .semibold, design: .rounded)).padding(.bottom)
                }
                Spacer()
                
            }
            .padding(.horizontal)
            Divider()
            .padding(.leading)
            HStack{
                VStack(alignment: .leading){
                    Text("Bio")
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.leading)
                        .padding(.vertical, 3.0)
                    Text("\(userViewModel.userData.bio)").font(Font.system(size: 25, weight: .semibold, design: .rounded)).padding(.bottom)
                }
                Spacer()
                
             }
            .padding(.horizontal)
            Divider()
            .padding(.leading)
            }
            LogoutButton
            Spacer()
            }
        }
            

    }
    
    var LogoutButton: some View{
        ZStack{
        Button(action: { loggedIn = false
        }){
            Text("Logout")
                                .padding(.horizontal, 40)
                                .padding(.vertical, 10.0)
            
                                .foregroundColor(Color.white)
                                .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                                .background(Color.orange)
                                .cornerRadius(10)
        }
        }
        .padding(.top, 20.0)
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}




